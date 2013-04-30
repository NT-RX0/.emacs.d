;;set linux var by default
(defvar home-path)
<<<<<<< HEAD
;;(setq home-path nil)
=======
(setq home-path nil)
>>>>>>> 7840b6315d10b97e0c12fd5be4724ee17b708b48
(defvar emacs-configuration-dir)
(setq emacs-configuration-dir ".emacs.d/")
(if (not (string< home-path nil))
  (setq home-path "~/"))
;;Default settings dir
(defvar current-emacs-path)
(setq current-emacs-path (concat home-path emacs-configuration-dir))
(add-to-list 'load-path current-emacs-path)
;;(add-to-list 'load-path "~/.emacs.d")

;;configuration file list
<<<<<<< HEAD
(if (eq system-type 'windows-nt)
    (progn
      (print "Windows detected")
      (require 'pheliox-settings-windows)))

=======
>>>>>>> 7840b6315d10b97e0c12fd5be4724ee17b708b48
(require 'pheliox-load-plugins)
(require 'pheliox-appearance)
(require 'pheliox-settings)
(require 'pheliox-key-bindings)
(require 'pheliox-functions)


<<<<<<< HEAD

=======
>>>>>>> 7840b6315d10b97e0c12fd5be4724ee17b708b48

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(size-indication-mode t)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-background-color "gray20")
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-separator (quote (" " (:type pbm :data ("20 20 20") :ascent center :mask (heuristic) :margin 1))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-button ((t (:background "gray25" :foreground "gray80"))))
 '(tabbar-button-highlight ((t (:box nil :overline "cornflower blue"))))
 '(tabbar-default ((t (:background "gray25" :foreground "gray80" :box (:line-width 5 :color "gray25") :height 1.0))))
 '(tabbar-highlight ((t (:foreground "light blue" :box (:line-width 1 :color "grey10") :overline "cornflower blue" :height 0.7))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "gray10" :foreground "skyblue1" :box (:line-width 4 :color "gray10") :weight bold :height 0.9))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "gray8" :box (:line-width 1 :color "grey9") :height 0.3))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background "gray25" :foreground "gray60" :box (:line-width 2 :color "gray20") :overline "gray10" :height 0.9))))
 '(show-paren-match ((t (:foreground "violet" :background "gray10"))))
)
