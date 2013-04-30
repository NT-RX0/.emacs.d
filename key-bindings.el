;; esc-meta-alt-ctrl-shift keybinding config


;;(global-set-key (kbd "M-]") 'next-multiframe-window)
;;(global-set-key (kbd "M-[") 'previous-multiframe-window)
;;(global-set-key (kbd "M-k") 'kill-buffer-and-window)
(global-set-key [f8] 'nav-toggle)

;;windows control
(define-prefix-command 'control-shift-map)
(global-set-key [(control shift)] 'control-shift-map)
(global-set-key [(control shift left)] 'windmove-left)          ; move to left window
(global-set-key [(control shift right)] 'windmove-right)        ; move to right window
(global-set-key [(control shift up)] 'windmove-up)              ; move to upper window
(global-set-key [(control shift down)] 'windmove-down)          ; move to lower window

;; Reload File
(global-set-key (kbd "C-x <f5>") 'revert-buffer)
(global-set-key (kbd "C-x <C-f5>") 'revert-buffer-with-coding-system)

;;Cancel Org-mode shortcut
(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map [(control tab)] nil)
             (define-key org-mode-map [(control shift tab)] nil)
             (define-key org-mode-map [(shift left)] nil)
             (define-key org-mode-map [(shift up)] nil)
             (define-key org-mode-map [(shift right)] nil)
             (define-key org-mode-map [(shift down)] nil)
             (define-key org-mode-map [(control shift left)] nil)
             (define-key org-mode-map [(control shift right)] nil)
             (define-key org-mode-map [(control shift up)] nil)
             (define-key org-mode-map [(control shift down)] nil)
             ))

;;marker operation
(global-set-key (kbd "C-c q") 'set-mark-command)

;;



(provide 'key-bindings)

