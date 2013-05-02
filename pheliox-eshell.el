;; common settings
(setq
 eshell-save-history-on-exit   t
 eshell-history-size           5000
 eshell-hist-ignoredups        t
 eshell-cmpl-ignore-case       t
 eshell-cp-interactive-query   t
 eshell-ln-interactive-query   t
 eshell-mv-interactive-query   t
 eshell-rm-interactive-query   t
 eshell-mv-overwrite-files     nil
 ;; aliases-file 里面不能有多余的空行，否则会报正则表达式错误
 eshell-aliases-file       (expand-file-name "eshell/eshell-alias/" current-emacs-path)

 eshell-highlight-prompt   t
 ;; 提示符设置，下面两项必须对应起来，
 ;; 否则会报 read-only，并且不能补全什么的
 eshell-prompt-regexp      "^[^#$\n]* [#>]+ "
 eshell-prompt-function    (lambda nil
                             (concat
                              (abbreviate-file-name
                               (eshell/pwd))
                              (if
                                  (=
                                   (user-uid)
                                   0)
                                  " # " " >>> ")))
 )
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-cmpl)
     (require 'em-prompt)
     (require 'em-term)
     ;; TODO: for some reason requiring this here breaks it, but
     ;; requiring it after an eshell session is started works fine.
     ;; (require 'eshell-vc)
     (setenv "PAGER" "cat")
     ;; (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     ;; (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
     ;;           '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
     (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)))

;;auto complete for eshell
;; (defvar ac-source-eshell-pcomplete
;;   '((candidates . (pcomplete-completions))))
;; (defun ac-complete-eshell-pcomplete ()
;;   (interactive)
;;   (auto-complete '(ac-source-eshell-pcomplete)))
;; 自动开启 ac-mode
;; 需要 (global-auto-complete-mode 1)
(add-to-list 'ac-modes 'eshell-mode)
(setq ac-sources '(ac-source-eshell-pcomplete
                   ac-source-files-in-current-dir
                   ac-source-filename
                   ac-source-abbrev
                   ac-source-words-in-buffer
                   ac-source-imenu
                   ))

;;command timing statistics
(add-hook 'eshell-load-hook
          (lambda()(setq last-command-start-time (time-to-seconds))))
(add-hook 'eshell-pre-command-hook
          (lambda()(setq last-command-start-time (time-to-seconds))))
(add-hook 'eshell-before-prompt-hook
          (lambda()
            (message "spend %g seconds"
                     (- (time-to-seconds) last-command-start-time))))




(provide 'pheliox-eshell)
