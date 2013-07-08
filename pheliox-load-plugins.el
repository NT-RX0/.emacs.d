;; el-get Settings
(if (eq system-type 'gnu/linux) 
    (progn
      (print "Welcome back commander")

      ;;initialize el-get
      (add-to-list 'load-path (concat current-emacs-path "plugins/el-get/el-get"))

      ;;el-get submodules fix
      (defun force-git-add-after-el-get (package-path)
        (let* ((git-executable (el-get-executable-find "git"))
               (name (format "*git add subdir  %s*" package))	 )
          (message
           (format "cd %s && %s add %s/"
                   el-get-dir git-executable package-path))
          (shell-command 
           (format "cd %s && %s add %s/" 
                   el-get-dir git-executable package-path))))
            
      (add-hook 'el-get-post-install-hooks 'force-git-add-after-el-get)
      (add-hook 'el-get-post-update-hooks 'force-git-add-after-el-get)

      
      ;;el-get setup
      (setq el-get-dir (concat current-emacs-path "plugins/el-get/"))
      (setq el-get-user-package-directory (concat current-emacs-path "plugins/.packages.d/"))

      (unless (require 'el-get nil 'noerror)
	(with-current-buffer
	    (url-retrieve-synchronously
	     "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	  (let (el-get-master-branch)
	    (goto-char (point-max))
	    (eval-print-last-sexp))))

      (el-get 'sync)
 ))


;; colors
;; (add-to-list 'load-path (concat current-emacs-path "plugins/packages.d/color-theme/"))
(require 'color-theme)
(color-theme-initialize)

;; Enable CEDET
(add-to-list 'load-path (concat current-emacs-path "plugins/cedet/common/"))
(require 'cedet)

;; Semantic
(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(setq semanticdb-default-save-directory (concat current-emacs-path ".semantic-db/")) 

(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
;; activates highlighting of local names that are the same as name of tag under cursor;
(global-semantic-idle-local-symbol-highlight-mode t)
;; activates automatic parsing of source code in the idle time;
(global-semantic-idle-scheduler-mode t)
;; activates displaying of information about current tag in the idle time. Requires that global-semantic-idle-scheduler-mode was enabled.
(global-semantic-idle-summary-mode t)


;; CC-mode
(add-hook 'c-mode-hook 
          '(lambda ()
             (setq ac-sources (append '(ac-source-semantic) ac-sources))
             (local-set-key (kbd "RET") 'newline-and-indent)
             ;; (linum-mode t)
             (semantic-mode t)))

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (setq ac-sources (append '(ac-source-semantic) ac-sources))
;;              (local-set-key (kbd "RET") 'newline-and-indent)
;;              ;; (linum-mode t)
;;              (semantic-mode t)))

;; additional hooks
(defun my-semantic-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  ;; (local-set-key "<mouse-3>" 'semantic-ia-fast-mouse-jump)
  )
(add-hook 'c-mode-common-hook 'my-semantic-mode-cedet-hook)
(add-hook 'c++-mode-common-hook 'my-semantic-mode-cedet-hook)

(semantic-mode 1)

;; Enable ECB
(add-to-list 'load-path (concat current-emacs-path "plugins/ecb"))
(require 'ecb)

;; Org-Mode
(add-to-list 'load-path (concat current-emacs-path "plugins/org-mode"))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-prefix-command 'ctl-c-s-map)
(global-set-key (kbd "C-c s") 'ctl-c-s-map)
(define-key global-map (kbd "\C-c s l") 'org-store-link)
(define-prefix-command 'ctl-c-a-map)
(global-set-key (kbd "C-c a") 'ctl-c-a-map)
(define-key global-map (kbd "\C-c a g") 'org-agenda)
(setq org-log-done t)

;;yasnippet
;;(add-to-list 'load-path (concat current-emacs-path "plugins/yasnippet"))
(require 'yasnippet)
(yas/global-mode 1)



;; auto complete
(add-to-list 'load-path (concat current-emacs-path "plugins/auto-complete"))
(add-to-list 'load-path (concat current-emacs-path "plugins/auto-complete/lib/popup"))
(add-to-list 'load-path (concat current-emacs-path "plugins/auto-complete/lib/fuzzy"))
(add-to-list 'load-path (concat current-emacs-path "plugins/auto-complete/lib/ert"))
(add-to-list 'load-path (concat current-emacs-path "plugins/auto-complete-extension"))
(require 'auto-complete-config)
;;(require 'auto-complete-extension)
(require 'auto-complete-yasnippet)
;; (setq ac-sources
;;       (append '(ac-source-yasnippet
;;                 ac-source-semantic
;;                 ac-source-abbrev
;;                 ac-source-words-in-buffer
;;                 ac-source-words-in-all-buffer
;;                 ac-source-imenu
;;                 ac-source-files-in-current-dir
;;                 ac-source-filename) ac-sources))
(ac-config-default)
(setq ac-fuzzy-enable t)
(setq ac-use-fuzzy t)

(global-auto-complete-mode)

(defun ac-settings-4-lisp ()
  "Auto complete settings for lisp mode."
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-symbols
          ;; ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ;; ac-source-words-in-all-buffer
          ;; ac-source-imenu
          ;; ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-java ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ;; ac-source-words-in-all-buffer
          ;; ac-source-files-in-current-dir
          ;; ac-source-filename
)))

(defun ac-settings-4-c ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-c-keywords
          ac-source-abbrev
          ac-source-words-in-buffer
          ;; ac-source-words-in-all-buffer
          ;; ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-cpp ()
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-semantic))
              (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-c++-keywords
          ac-source-abbrev
          ac-source-words-in-buffer
          ;; ac-source-words-in-all-buffer
          ;; ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-text ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ;; ac-source-imenu
)))

(defun ac-settings-4-eshell ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-filename
          ;; ac-source-yasnippet
          ac-source-abbrev
          ;; ac-source-words-in-buffer
          ;; ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-symbols
          ;; ac-source-imenu
)))

(defun ac-settings-4-ruby ()
  (require 'rcodetools-settings)
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-rcodetools))
              (cons "::" '(ac-source-rcodetools)))))

(defun ac-settings-4-html ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ;; ac-source-filename
)))

(defun ac-settings-4-tcl ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-awk ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(add-hook 'lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'emacs-lisp-mode-hook 'ac-settings-4-lisp)
(add-hook 'lisp-interaction-mode-hook'ac-settings-4-lisp)
(add-hook 'svn-log-edit-mode-hook 'ac-settings-4-lisp)
(add-hook 'change-log-mode-hook'ac-settings-4-lisp)
(add-hook 'java-mode-hook   'ac-settings-4-java)
(add-hook 'c-mode-hook      'ac-settings-4-c)
(add-hook 'c++-mode-hook    'ac-settings-4-cpp)
(add-hook 'text-mode-hook   'ac-settings-4-text)
(add-hook 'eshell-mode-hook 'ac-settings-4-eshell)
(add-hook 'ruby-mode-hook   'ac-settings-4-ruby)
(add-hook 'html-mode-hook   'ac-settings-4-html)
(add-hook 'java-mode-hook   'ac-settings-4-java)
(add-hook 'awk-mode-hook    'ac-settings-4-awk)

(add-to-list 'ac-dictionary-directories (concat current-emacs-path "plugins/auto-complete/dict"))


;; ;; auto complete for eshell
;; (defvar ac-source-eshell-pcomplete
;;   '((candidates . (pcomplete-completions))))
;; (defun ac-complete-eshell-pcomplete ()
;;   (interactive)
;;   (auto-complete '(ac-source-eshell-pcomplete)))
;; ;; 自动开启 ac-mode
;; ;; 需要 (global-auto-complete-mode 1)
;; (add-to-list 'ac-modes 'eshell-mode)
;; (setq ac-sources '(ac-source-eshell-pcomplete
;;                    ac-source-filename
;;                    ac-source-files-in-current-dir
;;                    ac-source-abbrev
;;                    ac-source-words-in-buffer
;;                    ac-source-imenu
;;                    ))

(setq ac-use-menu-map t)
;; Default settings
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(define-key ac-completing-map [return]   nil)
(define-key ac-completing-map (kbd "M-j")        'ac-complete)
(define-key ac-completing-map (kbd "<C-return>") 'ac-complete)
(define-key ac-menu-map [return]   nil)
(define-key ac-menu-map "RET"        nil)
(define-key ac-menu-map (kbd "M-j")        'ac-complete)
(define-key ac-menu-map (kbd "<C-return>") 'ac-complete)
;; (define-key ac-menu-map "M-n"        'ac-next)
;; (define-key ac-menu-map "M-p"        'ac-previous)

(setq ac-set-trigger-key [TAB])

(setq ac-auto-start 3)


;;nav
;;(add-to-list 'load-path (concat current-emacs-path "plugins/nav"))
;;(require 'nav)
;;(nav-disable-overeager-window-splitting)

;;markdown
;;(add-to-list 'load-path (concat current-emacs-path "plugins/markdown"))
;;(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;session
(add-to-list 'load-path (concat current-emacs-path "plugins/session"))
(require 'session)
(add-hook 'after-init-hook
          'session-initialize)
(add-to-list 'session-globals-exclude
             'org-mark-ring)

;;cursor change
(add-to-list 'load-path (concat current-emacs-path "plugins/cursor-chg"))
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
;;Windows system settings
(global-set-key [(C-S-<tab>)] 'tabbar-backward)
;;X system settings
(global-set-key (kbd "C-S-<iso-lefttab>") 'tabbar-backward)
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
(add-to-list 'load-path (concat current-emacs-path "plugins/weibo.emacs"))
(require 'weibo)

;;autopair
(require 'autopair)
(autopair-global-mode t)
;;Adding Textmate like smart pair operations



;;highlight parentheses + autopair
(require 'highlight-parentheses)
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
(add-to-list 'load-path (concat current-emacs-path "plugins/dictionary-el"))
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

;; (global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words)
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
(add-to-list 'load-path (concat current-emacs-path "plugins/page-break-lines"))
(require 'page-break-lines)
(global-page-break-lines-mode t)
;;(setq truncate-lines t)

;;icicles settings
;; (add-to-list 'load-path (concat current-emacs-path "plugins/icicles/"))
;; (require 'icicles)
;; (icy-mode 1)


;;key chord settings
(require 'key-chord)
(key-chord-mode t)
(setq key-chord-two-keys-delay 0.05)
(key-chord-define-global "fg"     'wy-go-to-char)
(key-chord-define-global "hj"     'undo)
;;      (key-chord-define-global [?h ?j]  'undo)  ; the same


;;expand region key set
(require 'expand-region)
(global-set-key (kbd "C-`") 'er/expand-region)

;;swank-js setup
(add-to-list 'load-path (concat current-emacs-path "plugins/swank-js"))

(global-set-key (kbd "C-x <f5>") 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))
(add-hook 'css-mode-hook
          (lambda ()
            (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
            (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))

;;slime setup
(require 'slime)
(slime-setup '(slime-js slime-repl))
(defun slime-tab ()
  "slime-mode tab dwim, either indent, complete symbol or yas/expand"
  (interactive)
  (let ((r (slime-indent-and-complete-symbol)))
    (unless r
      (yas/expand))))
(defun my-slime-mode-hook ()
  (interactive)
  (define-key slime-mode-map (kbd "<tab>")
    'slime-tab)
  )
(add-hook 'slime-mode-hook 'my-slime-mode-hook)

;;paredit with autopair
(require 'paredit)
(paredit-mode t)
(require 'autopair)

(defvar autopair-modes '(r-mode ruby-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(require 'paredit)
(defadvice paredit-mode (around disable-autopairs-around (arg))
  "Disable autopairs mode if paredit-mode is turned on"
  ad-do-it
  (if (null ad-return-value)
      (autopair-mode 1)
    (autopair-mode 0)
    ))

(ad-activate 'paredit-mode)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;;change key bindings
(define-key paredit-mode-map (kbd "M-;") nil)
;;manually set global paredit mode
;;
;; (define-globalized-minor-mode global-paredit-mode
;;   paredit-mode
;;   (lambda ()
;;     (paredit-mode t)))
;; (global-paredit-mode t)



;;highlight-symbol mode
(require 'highlight-symbol)
(define-globalized-minor-mode global-highlight-symbol-mode
  highlight-symbol-mode
  (lambda ()
    (highlight-symbol-mode t)))
(global-highlight-symbol-mode t)

;;undo-tree setup
(add-to-list 'load-path (concat current-emacs-path "plugins/undo-tree/"))
(require 'undo-tree)
(global-undo-tree-mode)

;;multiple-cursor setup
(require 'multiple-cursors)

;; Then you have to set up your keybindings - multiple-cursors doesn't presume to
;; know how you'd like them laid out. Here are some examples:

;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;nxhtml-mode
(load (concat current-emacs-path "plugins/nxhtml/autostart.el"))

;;Helm settings
(require 'helm-config)
;; (add-hook 'eshell-mode-hook
;;           '(lambda ()
;;               (define-key eshell-mode-map 
;;                 [remap pcomplete]
;;                 'helm-esh-pcomplete)))

;; (add-hook 'eshell-mode-hook
;;           '(lambda ()
;;               (define-key eshell-mode-map 
;;                 (kbd "M-r")
;;                 'helm-eshell-history)))

;; (add-hook 'eshell-mode-hook
;;           '(lambda ()
;;              (define-key eshell-mode-map 
;;                (kbd "M-p")
;;                nil)))

;;smex settings
(require 'smex)
(global-set-key [(meta x)] (lambda ()
                                (interactive)
                                (or (boundp 'smex-cache)
                                    (smex-initialize))
                                (global-set-key [(meta x)] 'smex)
                                (smex)))

;; (global-set-key [(shift meta x)] (lambda ()
;;                                    (interactive)
;;                                    (or (boundp 'smex-cache)
;;                                        (smex-initialize))
;;                                    (global-set-key [(shift meta x)] 'smex-major-mode-commands)
;;                                    (smex-major-mode-commands)))
;;using acronyms
(defadvice ido-set-matches-1 (after ido-acronym-matches activate)
  (if (> (length ido-text) 1)
      (let ((regex (concat "^" (mapconcat 'char-to-string ido-text "[^-]*-")
                           "[^-]*$")))
        (setq ad-return-value
              (append (reverse (remove-if-not (lambda (i)
                                                (string-match regex i)) items))
                      ad-return-value)))))


;; auto-compile-settings
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "~#")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)




(provide 'pheliox-load-plugins)
