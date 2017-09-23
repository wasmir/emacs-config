;;设置语言为utf-8
(set-language-environment "UTF-8")
;;关闭工具栏
(tool-bar-mode -1)
;;关闭文件滑动控件
(scroll-bar-mode -1)
;;显示行号
(global-linum-mode 1)
;;关闭启动帮助画面
;(setq inhibit-splash-screen 1)
;;使用dashboard作为启动画面
(dashboard-setup-startup-hook)
;;修改启动画面图像
(setq dashboard-startup-banner "~/.emacs.d/startpng/doge.png")
;;更改显示字体大小
(set-face-attribute 'default nil :height 140)
;;修改默认字体
(set-default-font "Monaco-14")
;;开启全局 Company补全
(global-company-mode 1)
;;开启LeaderKey
(global-evil-leader-mode)
;;开启evil
(evil-mode 1)
;;开启window-numbering
(window-numbering-mode 1)
;;开启evil-surround
(global-evil-surround-mode)
;;开启whichkey
(which-key-mode 1)
;;设置光标样式
(setq-default cursor-type 'bar)
;;禁止自动生成备份文件
(setq make-backup-files nil)
;;禁止自动保存
(setq make-backup-files nil)
;;禁止dired不断生成缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;;在图形界面打开最近打开文档
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;;选中一段文字之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)
;;启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
(global-hl-line-mode 1)
;;打开时加载主题
(load-theme 'sanityinc-solarized-dark 1)
;;使用js2-mode替代原始mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;;关闭提示音
(setq ring-bell-function 'ignore)
;;更改yes or no 为 y or n
(fset 'yes-or-no-p 'y-or-n-p)
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
; put files
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))
;;python environment
(defcustom python-shell-interpreter "python3"
  "Default Python interpreter for shell."
  :type 'string
  :group 'python)
(setq python-python-command "python3")
(elpy-enable)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 
(setq elpy-rpc-python-command "python3")
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(defun python-shell-completion-native-try ()
  "Return non-nil if can trigger native completion."
  (with-eval-after-load 'python
    '(let ((python-shell-completion-native-enable t)
           (python-shell-completion-native-output-timeout
            python-shell-completion-native-try-output-timeout))
       (python-shell-completion-native-get-completions
        (get-buffer-process (current-buffer))
        nil "_"))))
;; 文件末尾
(provide 'init-better-default)
