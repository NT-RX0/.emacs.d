;; el-get Settings
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; colors
(add-to-list 'load-path "~/.emacs.d/el-get/color-theme")
(require 'color-theme)
(color-theme-initialize)

;; Enable CEDET
(add-to-list 'load-path "~/.emacs.d/plugins/cedet/common")
(require 'cedet)

;; Enable ECB
(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
(require 'ecb)

;; Org-Mode
(add-to-list 'load-path "~/.emacs.d/plugins/org-mode")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-prefix-command 'ctl-c-s-map)
(global-set-key (kbd "C-c s") 'ctl-c-s-map)
(define-key global-map (kbd "\C-c s l") 'org-store-link)
(define-prefix-command 'ctl-c-a-map)
(global-set-key (kbd "C-c a") 'ctl-c-a-map)
(define-key global-map (kbd "\C-c a g") 'org-agenda)
(setq org-log-done t)

;; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/fuzzy")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/ert")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-extension")
(require 'auto-complete-config)
(require 'auto-complete-extension)
(require 'auto-complete-yasnippet)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)
(setq ac-fuzzy-enable t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;;yasnippet
;;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)


;;nav
;;(add-to-list 'load-path "~/.emacs.d/plugins/nav")
;;(require 'nav)
;;(nav-disable-overeager-window-splitting)

;;markdown
;;(add-to-list 'load-path "~/.emacs.d/plugins/markdown")
;;(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;session
(add-to-list 'load-path "~/.emacs.d/plugins/session")
(require 'session)
(add-hook 'after-init-hook
          'session-initialize)
(add-to-list 'session-globals-exclude
             'org-mark-ring)

;;cursor change
(add-to-list 'load-path "~/.emacs.d/plugins/cursor-chg")
(require 'cursor-chg)  ; Load the library
;;cursor change setting
(setq curchg-default-cursor-color "dodger blue")
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;;browse-kill-ring
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;tabbar hotkey
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(meta left)] 'tabbar-backward-group)
(global-set-key [(meta right)] 'tabbar-forward-group)
(global-set-key [(C-S-iso-lefttab)] 'tabbar-backward)
(global-set-key [(C-tab)] 'tabbar-forward)
;; customize tabbar group
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ;; ((member (buffer-name)
    ;;          '("*scratch*" "*Messages*" "*Help*"))
    ;;  "Common"
    ;;  )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Common"
     )
    ;; ((member (buffer-name)
    ;;          '("xyz" "day" "m3" "abi" "for" "nws" "eng" "f_g" "tim" "tmp"))
    ;;  "Main"
    ;;  )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Common"
     )
    ((memq major-mode
           '(rmail-mode
             rmail-edit-mode vm-summary-mode vm-mode mail-mode
             mh-letter-mode mh-show-mode mh-folder-mode
             gnus-summary-mode message-mode gnus-group-mode
             gnus-article-mode score-mode gnus-browse-killed-mode))
     "Mail"
     )
    (t 
     ;; Return `mode-name' if not blank, `major-mode' otherwise.
     (if (and (stringp mode-name)
              ;; Take care of preserving the match-data because this
              ;; function is called when updating the header line.
              (save-match-data (string-match "[^ ]" mode-name)))
         mode-name
       (symbol-name major-mode))
     ))))


;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
;; (set-face-attribute
;;  'tabbar-default-face nil
;;  :family "DejaVu Sans Mono"
;;  :background "gray80"
;;  :foreground "gray30"
;;  :height 0.8)
;; (set-face-attribute 
;;  'tabbar-selected-face nil  
;;  :family "DejaVu Sans Mono"  
;;  :background "gray80"  
;;  :foreground "gray30"
;;  :weight 'bold
;;  :height 0.8)  
;; (set-face-attribute
;;  'tabbar-default nil
;;  :height 0.8
;;  :background "gray20"
;;  :foreground "gray20"
;;  :box '(:line-width 2 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "gray30"
;;  :foreground "gray70"
;;  :box '(:line-width 5 :color "gray30" :style nil))
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "gray45"
;;  :foreground "gray90"
;;  :box '(:line-width 5 :color "gray45" :style nil))
;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "gray55"
;;  :foreground "gray95"
;;  :underline nil
;;  :box '(:line-width 5 :color "gray55" :style nil))
;; (set-face-attribute
;;  'tabbar-button nil
;;  :height 0.8
;;  :box '(:line-width 1 :color "gray40" :style nil))
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "gray20"
;;  :height 0.6)

;;folding settings
;; (load "folding" 'nomessage 'noerror)
;; (folding-mode-add-find-file-hook)
;; (load-library  "folding")
;; (declare (special folding-fold-on-startup
;; 		  folding-keys-already-setup
;; 		  ))

;; (setq folding-fold-on-startup t)
;; (folding-mode-add-find-file-hook)

;; (setq folding-keys-already-setup nil)
;; (add-hook 'folding-mode-hook
;;           (function 
;;            (lambda()
;;              (unless folding-keys-already-setup
;;                (setq folding-keys-already-setup t)
;;                (define-prefix-command 'ctl-f-folding-mode-prefix)
;;                (define-key 'ctl-f-folding-mode-prefix "f" 'folding-fold-region)
;;                (define-key 'ctl-f-folding-mode-prefix "b" 'folding-whole-buffer)
;;                (define-key 'ctl-f-folding-mode-prefix "o" 'folding-open-buffer)
;;                (define-key 'ctl-f-folding-mode-prefix "s" 'folding-show-all)
;;                )
;;              (local-set-key "\C-f" 'ctl-f-folding-mode-prefix)
;;              )
;;            )
;;           )

;; (folding-add-to-marks-list 'sgml-mode
;; 			"<!-- {" 
;;  			"<!-- } -->" " --> ")
;; (folding-add-to-marks-list 'c-mode "/* <" "/* > */" "*/")
;; (folding-add-to-marks-list 'c++-mode
;; 			"//<" "//>" "")
;; (folding-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" " ")
;; (folding-add-to-marks-list 'latex2e-mode "%%% {{{" "%%% }}}" " ")
;; (folding-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" " ")
;; (folding-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" " ")
;; (folding-add-to-marks-list 'lisp-mode ";;; {" ";;; }" "")
;; (folding-add-to-marks-list 'lex-mode" /* {{{ " " /* }}} */ " "*/")
;; (folding-add-to-marks-list 'html-mode "<!-- { " "<!-- } -->" "-->")
;; (folding-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil)
;; (folding-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil)

;; weibo client
(add-to-list 'load-path "~/.emacs.d/plugins/weibo.emacs")
(require 'weibo)

;;autopair
(autopair-global-mode t)
;;hightlight parentheses + autopair
(setq hl-paren-colors '("deep pink" "purple" "dodger blue" "green yellow" "goldenrod"))
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                    (if autopair-handle-action-fns
                        autopair-handle-action-fns
                      '(autopair-default-handle-action))
                    '((lambda (action pair pos-before)
                        (hl-paren-color-update)))))))
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;;dictionary settings
(add-to-list 'load-path "~/.emacs.d/plugins/dictionary-el")
(require 'dictionary)

(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary"
  "Enable/disable dictionary-tooltip-mode for all buffers" t)

(global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words)
(global-set-key [(control c)(d)] 'dictionary-lookup-definition)
(global-set-key [(control c)(s)] 'dictionary-search)
(global-set-key [(control c)(m)] 'dictionary-match-words)

;; choose a dictionary server
;; (setq dictionary-server "localhost")

;; for dictionary tooltip mode
;; choose the dictionary: "wn" for WordNet
;; "web1913" for Webster's Revised Unabridged Dictionary(1913)
;; so on
;; (setq dictionary-tooltip-dictionary "web1913")
;; (global-dictionary-tooltip-mode t)
;;(dictionary-tooltip-mode t)

;;page-break-lines
(add-to-list 'load-path "~/.emacs.d/plugins/page-break-lines")
(require 'page-break-lines)
(global-page-break-lines-mode t)
;;(setq truncate-lines t)

;;icicles settings
;; (add-to-list 'load-path "~/.emacs.d/plugins/icicles/")
;; (require 'icicles)
;; (icy-mode 1)


;;key chord settings
(require 'key-chord)
(key-chord-mode t)
(setq key-chord-two-keys-delay 0.05)
(key-chord-define-global "fg"     'wy-go-to-char)
(key-chord-define-global "hj"     'undo)
;;      (key-chord-define-global [?h ?j]  'undo)  ; the same

;;point undo key set
(require 'point-undo)
(define-key global-map [f5] 'point-undo)
(define-key global-map [f6] 'point-redo)

;;hide lines shortcut
;;hide region
(require 'hide-region)
(global-set-key (kbd "C-c r") 'hide-region-hide)
(global-set-key (kbd "C-c R") 'hide-region-unhide)

;; hide lines
(require 'hide-lines)
(global-set-key (kbd "C-c l") 'hide-lines)
(global-set-key (kbd "C-c L") 'show-all-invisible)

;;expand region key set
(require 'expand-region)
(global-set-key (kbd "C-`") 'er/expand-region)



(provide 'load-plugins)
