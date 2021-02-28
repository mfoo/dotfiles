;; Martin's .emacs file
;;
;; Author: Martin Foot <martin@mfoot.com>

; To speed up init, the garbage collection settings are increased while init is happening, then restored afterwards.
(setq gc-cons-threshold 100000000)

(require 'package)

; Org mode is a bit of a pain, it's the only bit that needs to be inside .emacs, since org is necessary to parse my
; config. I need to make sure it's the correct version.
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)


; If use-package isn't installed, install it
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; Enforce that use-package always installs all packages if they're not present.
; Put slow loading packages / config warnings in the *Messages* buffer
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(require 'use-package)

(org-babel-load-file (concat user-emacs-directory "config.org"))

(setq gc-cons-threshold 800000)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(spacemacs-theme yasnippet yafolding which-key use-package solarized-theme scss-mode ruby-end rubocop rspec-mode robe rainbow-mode rainbow-delimiters projectile-rails org-plus-contrib org-bullets org-attach-screenshot neotree multiple-cursors magit-popup magit k8s-mode indent-guide htmlize helm-git-grep helm go-mode git-gutter+ fortune-cookie flymake-coffee flycheck-yamllint expand-region evil-tabs evil-surround es-mode enh-ruby-mode emojify dockerfile-mode docker diminish counsel company coffee-mode cmake-mode avy anzu ag ace-isearch))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-hspace ((t (:foreground "black"))))
 '(whitespace-space ((t (:foreground "dark slate gray" :slant italic))))
 '(whitespace-tab ((t (:foreground "black")))))
