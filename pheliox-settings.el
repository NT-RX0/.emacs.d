;; basic settings

;; user settings
(setq user-full-name "PHELiOX")
(setq user-mail-address "pheliox@live.com")

;;Screen Settings
(setq truncate-lines t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq auto-window-vscroll nil)
;;follow mode to sync between windows
(follow-mode t)
;;cursor color
(set-cursor-color "dodger blue")
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode t)
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
(setq history-length 250)

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

(setq auto-save-interval 25)
(setq auto-save-timeout 1)
;; backup policies
(setq make-backup-files t)
(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(defvar pheliox-backup-path)
(setq pheliox-backup-path  (concat current-emacs-path ".backup/"))
(setq backup-directory-alist
      `(("." . ,pheliox-backup-path)
        (,tramp-file-name-regexp t)))
(setq auto-save-list-file-prefix
      (concat pheliox-backup-path ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,pheliox-backup-path t)
        (,tramp-file-name-regexp t)))


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
;;set kill ring
(setq kill-ring-max 200)

(setq default-major-mode 'text-mode)
;;(global-font-lock-mode nil)


(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; Fringe
(setq fringe-mode 'left-only)
(setq fringe-mode 'default)
(setq fringe-mode 'left-only)
(setq-default right-fringe-width 0)
(setq default-indicate-buffer-boundaries '((top . left) (t . left)))






(provide 'pheliox-settings)
