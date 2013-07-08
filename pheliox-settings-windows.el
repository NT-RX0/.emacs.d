(defvar el-get-plugins-list)
(setq el-get-plugins-list  (directory-files (concat current-emacs-path "/plugins/el-get/") t)) 
(mapc (lambda(plugin)
	  (add-to-list 'load-path plugin)) el-get-plugins-list)
;;(add-to-list 'load-path (remove ".." (remove "." el-get-plugins-list)))
;;(require 'mark-more-like-this)
(set-face-attribute 'default nil :font "Xhei Mono")
(add-hook 'after-init-hook '(lambda () (w32-send-sys-command ?\xf030)))




(provide 'pheliox-settings-windows)
