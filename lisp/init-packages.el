;;使用melpa作为插件源
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
               ;; --- Auto-completion ---
               company
	       which-key
               ;; --- Better Editor ---
               hungry-delete
               swiper
               counsel
               smartparens
	       dashboard
               ;; --- Major Mode ---
	       evil
               js2-mode
	       ;;--- Python ---
	       elpy
	       jedi
	       flycheck
	       py-autopep8
	       ;;--- evil plug ---
	       evil-leader
	       window-numbering
	       evil-surround
	       evil-nerd-commenter
               ;; --- Minor Mode ---
               nodejs-repl
               exec-path-from-shell
	       iedit
               ;; --- Themes ---
               monokai-theme
	       color-theme-solarized
	       color-theme-sanityinc-solarized
               ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; 文件末尾
(provide 'init-packages)
