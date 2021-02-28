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

; Ensure the latest org-mode version. This is a trick - the org package is provided by the OS distribution, but org-plus-contrib isn't, it's from the org-mode repo, and it will pull down the latest org package.
(use-package org-plus-contrib
  :ensure t
)

(org-babel-load-file (concat user-emacs-directory "config.org"))

(setq gc-cons-threshold 800000)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-hspace ((t (:foreground "black"))))
 '(whitespace-space ((t (:foreground "dark slate gray" :slant italic))))
 '(whitespace-tab ((t (:foreground "black")))))
