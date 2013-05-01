((Enhanced-Ruby-Mode status "removed" recipe nil)
 (anything status "removed" recipe nil)
 (apropos-fn+var status "installed" recipe
                 (:name apropos-fn+var :auto-generated t :type emacswiki :description "Apropos for functions and variables" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/apropos-fn+var.el"))
 (auto-complete status "removed" recipe nil)
 (auto-complete-css status "removed" recipe nil)
 (auto-complete-extension status "removed" recipe nil)
 (auto-complete-yasnippet status "removed" recipe nil)
 (autopair status "installed" recipe
           (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (browse-kill-ring status "installed" recipe
                   (:name browse-kill-ring :description "Interactively insert items from kill-ring" :type emacswiki :features browse-kill-ring))
 (cedet status "removed" recipe nil)
 (color-theme status "installed" recipe
              (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
                     ("xzf")
                     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
                     (progn
                       (color-theme-initialize)
                       (setq color-theme-is-global t))))
 (color-theme-almost-monokai status "installed" recipe
                             (:name color-theme-almost-monokai :description "A beautiful, fruity, calm, yet dark color theme for Emacs." :type github :pkgname "lut4rp/almost-monokai" :depends color-theme :prepare
                                    (autoload 'color-theme-almost-monokai "color-theme-almost-monokai" "color-theme: almost-monokai" t)))
 (color-theme-mac-classic status "removed" recipe nil)
 (color-theme-solarized status "installed" recipe
                        (:name color-theme-solarized :description "Emacs highlighting using Ethan Schoonover's Solarized color scheme" :type github :pkgname "sellout/emacs-color-theme-solarized" :depends color-theme :prepare
                               (progn
                                 (add-to-list 'custom-theme-load-path default-directory)
                                 (autoload 'color-theme-solarized-light "color-theme-solarized" "color-theme: solarized-light" t)
                                 (autoload 'color-theme-solarized-dark "color-theme-solarized" "color-theme: solarized-dark" t))))
 (color-theme-tango status "installed" recipe
                    (:name color-theme-tango :description "Color theme based on Tango Palette. Created by danranx@gmail.com" :type emacswiki :depends color-theme :prepare
                           (autoload 'color-theme-tango "color-theme-tango" "color-theme: tango" t)))
 (color-theme-twilight status "installed" recipe
                       (:name color-theme-twilight :description "Twilight color theme for GNU Emacs inspired by TextMate." :type github :pkgname "crafterm/twilight-emacs" :depends color-theme :prepare
                              (autoload 'color-theme-twilight "color-theme-twilight" "color-theme: twilight" t)))
 (color-theme-zenburn status "installed" recipe
                      (:type github :username "emacsmirror" :name color-theme-zenburn :type emacsmirror :pkgname "zenburn-theme" :description "Just some alien fruit salad to keep you in the zone" :prepare
                             (progn
                               (autoload 'color-theme-zenburn "zenburn" "Just some alien fruit salad to keep you in the zone." t)
                               (defalias 'zenburn #'color-theme-zenburn))))
 (css-mode status "installed" recipe
           (:name css-mode :description "Minor mode for CSS" :features css-mode :type elpa))
 (dictionary status "removed" recipe nil)
 (ecb status "removed" recipe nil)
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (folding status "removed" recipe nil)
 (fuzzy status "removed" recipe nil)
 (fuzzy-match status "installed" recipe
              (:name fuzzy-match :auto-generated t :type emacswiki :description "fuzzy matching" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/fuzzy-match.el"))
 (header2 status "installed" recipe
          (:name header2 :description "Support for creation and update of file headers." :type emacswiki :features "header2"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :features helm-config))
 (hexrgb status "installed" recipe
         (:name hexrgb :auto-generated t :type emacswiki :description "Functions to manipulate colors, including RGB hex strings." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hexrgb.el"))
 (hide-lines status "installed" recipe
             (:name hide-lines :auto-generated t :type emacswiki :description "Commands for hiding lines based on a regexp" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hide-lines.el"))
 (hide-region status "installed" recipe
              (:name hide-region :auto-generated t :type emacswiki :description "hide regions of text using overlays" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hide-region.el"))
 (highlight-indentation status "installed" recipe
                        (:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
 (highlight-parentheses status "installed" recipe
                        (:name highlight-parentheses :description "Highlight the matching parentheses surrounding point." :type http :url "http://nschum.de/src/emacs/highlight-parentheses/highlight-parentheses.el" :features highlight-parentheses))
 (highlight-symbol status "installed" recipe
                   (:name highlight-symbol :description "Quickly highlight a symbol throughout the buffer and cycle through its locations." :type http :url "http://nschum.de/src/emacs/highlight-symbol/highlight-symbol.el" :features "highlight-symbol"))
 (htmlize status "installed" recipe
          (:name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type http :url "http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi" :localname "htmlize.el" :feature htmlize))
 (icicle-cmd1 status "removed" recipe nil)
 (icicles status "removed" recipe nil)
 (icicles-chg status "removed" recipe nil)
 (icicles-cmd1 status "removed" recipe nil)
 (icicles-face status "removed" recipe nil)
 (icicles-fn status "removed" recipe nil)
 (icicles-m status "removed" recipe nil)
 (icicles-mac status "removed" recipe nil)
 (icicles-mcmd status "removed" recipe nil)
 (icicles-mode status "removed" recipe nil)
 (icicles-opt status "removed" recipe nil)
 (icicles-var status "removed" recipe nil)
 (info+ status "installed" recipe
        (:name info+ :auto-generated t :type emacswiki :description "Extensions to `info.el'." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/info+.el"))
 (jdee status "removed" recipe nil)
 (js2-mode status "installed" recipe
           (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (key-chord status "installed" recipe
            (:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
 (linum-ex status "installed" recipe
           (:name linum-ex :description "Display line numbers to the left of buffers" :type emacswiki :features linum-ex))
 (mark-multiple status "removed" recipe nil)
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :before
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))
                       :post-init
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (monokai-theme status "removed" recipe nil)
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el" :features multiple-cursors))
 (nav status "installed" recipe
      (:name nav :description "Emacs mode for filesystem navigation" :type hg :url "https://emacs-nav.googlecode.com/hg" :features nav))
 (org-mode status "removed" recipe nil)
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (setq package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))
                         package-directory-list
                         (list
                          (file-name-as-directory package-user-dir)
                          "/usr/share/emacs/site-lisp/elpa/"))
                   (make-directory package-user-dir t)
                   (unless
                       (boundp 'package-subdirectory-regexp)
                     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
                   (setq package-archives
                         '(("ELPA" . "http://tromey.com/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (paredit status "installed" recipe
          (:name paredit :description "Minor mode for editing parentheses" :type http :url "http://mumble.net/~campbell/emacs/paredit.el" :features "paredit"))
 (point-undo status "installed" recipe
             (:name point-undo :auto-generated t :type emacswiki :description "undo/redo position" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/point-undo.el"))
 (popup status "removed" recipe nil)
 (pp+ status "installed" recipe
      (:name pp+ :auto-generated t :type emacswiki :description "Extensions to `pp.el'." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/pp+.el"))
 (pymacs status "installed" recipe
         (:name pymacs :description "Interface between Emacs Lisp and Python" :type github :pkgname "pinard/Pymacs" :prepare
                (progn
                  (el-get-envpath-prepend "PYTHONPATH" default-directory)
                  (autoload 'pymacs-load "pymacs" nil t)
                  (autoload 'pymacs-eval "pymacs" nil t)
                  (autoload 'pymacs-exec "pymacs" nil t)
                  (autoload 'pymacs-call "pymacs")
                  (autoload 'pymacs-apply "pymacs"))
                :build
                ("make")))
 (session status "removed" recipe nil)
 (slime status "installed" recipe
        (:name slime :description "Superior Lisp Interaction Mode for Emacs" :type github :features slime-autoloads :info "doc" :pkgname "nablaone/slime" :load-path
               ("." "contrib")
               :compile
               (".")
               :build
               ("make -C doc slime.info")
               :post-init
               (slime-setup)))
 (smooth-scroll status "installed" recipe
                (:name smooth-scroll :description "Minor mode for smooth scrolling." :type emacswiki :features smooth-scroll))
 (swank-js status "removed" recipe nil)
 (tabbar status "installed" recipe
         (:name tabbar :type emacswiki :description "Display a tab bar in the header line" :lazy t :load-path "."))
 (undo-tree status "removed" recipe nil)
 (vline status "installed" recipe
        (:name vline :description "show vertical line (column highlighting) mode." :type emacswiki :features vline))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil))
 (zencoding-mode status "installed" recipe
                 (:name zencoding-mode :description "Unfold CSS-selector-like expressions to markup" :type github :pkgname "rooney/zencoding" :features zencoding-mode)))
