;;Escape-Meta-Alt-Control-Shift Configuration
;;外观设置   
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======

>>>>>>> 7840b6315d10b97e0c12fd5be4724ee17b708b48
>>>>>>> 9f8f342e31c8f51608bcd7499a8841bb6a7e2501

;;去掉工具栏   
(setq tool-bar-mode nil)   
;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单   
(menu-bar-mode nil)   
;;在minibuffer上面可以显示列号   
(column-number-mode t)
;; Set theme
(load (concat current-emacs-path "themes/color-theme-molokai/color-theme-molokai.el"))
(load (concat current-emacs-path "el-get/color-theme-zenburn/zenburn-theme.el"))
(color-theme-molokai)
;;(color-theme-almost-monokai)


(provide 'pheliox-appearance)
