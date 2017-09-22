;;最近打开过的文件
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;;iedit模式更改快捷键
(global-set-key (kbd "M-s e") 'iedit-mode)
;;evil-leader/set-key
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "fd" 'dired
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  "er" 'iedit-mode
  "ss" 'shell
  "jm" 'java-mode
  )
(provide 'init-keybindings)
