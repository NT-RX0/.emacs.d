;; basic settings
;;Screen Settings
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse nil) ;; scroll window under mouse
(setq auto-window-vscroll nil)
;;follow mode to sync between windows
(follow-mode t)
;;cursor color
(set-cursor-color "dodger blue")
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode t)
;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)
;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.
;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode nil) 
;;smart spell correction
(flyspell-mode t)
;;保存会话
(desktop-save-mode t)
;;启用minibuffer，好像是默认设置吧   
(minibuffer-electric-default-mode t)   
;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp   
(icomplete-mode t)   
;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母   
(fset 'yes-or-no-p 'y-or-n-p)   
;;当寻找一个同名的文件，自动关联上那个文件？   
(setq uniquify-buffer-name-style 'forward)   
;;设定句子结尾，主要是针对中文设置   
(setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")   
(setq sentence-end-double-space nil)   
;;去掉Emacs和gnus启动时的引导界面   
(setq inhibit-startup-message t)   
(setq gnus-inhibit-startup-message t)   
;;当指针移到另一行，不要新增这一行？d   
(setq next-line-add-newlines nil)   
;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的   
(setq require-final-newline t)  
;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了   
(mouse-avoidance-mode 'animate)   
;;允许自动打开图片，如wiki里面   
(auto-image-file-mode t)
;;可以操作压缩文档   
(auto-compression-mode t)

;;auto-save
(auto-save-mode 1)
(setq auto-save-file-name-transforms 
      '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/tmp/\\2" t) 
        ("\\`/?\\([^/]*/\\)*\\([^/]*\\)\\'" "~/.emacs.backup/\\2" t)))
(setq auto-save-interval 15)
(setq auto-save-timeout 1)
;; backup policies
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist (quote (("." . "~/.emacs.backup"))))

;;(setq default-frame-alist  '((height . 50) (width . 80) )) 
;;(setq default-frame-alist  nil) 
(split-window-right)

;;auto rename buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;ibuffer replace normal buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;autofill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;paren-mode
(require 'paren)
(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "violet")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;;set tab width
(setq tab-width 4) ; or any other preferred value

;;ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;;Messages log
(setq message-log-max t)

;;delete selection mode
(delete-selection-mode 1)

;;auto save when killing buffer

;;set undo settings
(setq undo-limit 15000)




(provide 'settings)
