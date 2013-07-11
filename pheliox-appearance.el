;;Escape-Meta-Alt-Control-Shift Configuration
;;外观设置   


;;去掉工具栏   
(setq tool-bar-mode nil)   
;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单   
(menu-bar-mode nil)   
;;在minibuffer上面可以显示列号   
(column-number-mode t)

(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)
;; Highlight current line
(global-hl-line-mode 1)
;; Customize background color of lighlighted line
(set-face-background 'hl-line "#222228")
;;(set-face-foreground 'linum "#425365")
;; Fringe
(setq fringe-mode 'half-width)
;; (setq-default right-fringe-width 1)
;; (setq default-indicate-buffer-boundaries '((top . left) (t . left)))
(setq-default indicate-empty-lines t)
(better-fringes-mode t)

;; Set theme
(load (concat current-emacs-path "themes/color-theme-molokai/color-theme-molokai.el"))
(load (concat current-emacs-path "themes/phelio-theme/phelio-theme.el"))
;;(load (concat current-emacs-path "el-get/color-theme-zenburn/zenburn-theme.el"))
(color-theme-molokai)
;;(color-theme-almost-monokai)
;; set line spacing
;;(setq-default line-spacing 0)


(provide 'pheliox-appearance)
