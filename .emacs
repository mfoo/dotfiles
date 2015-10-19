;; Martin's .emacs file
;;
;; Author: Martin Foot <martin@mfoot.com>
;;
;; This file is split into several sections. As a general overview,
;; theprojectile file adds some package repositories, then lists several
;; packages that I use regularly. It then defines a function that
;; executes on startup to automatically ensure all of those packages
;; are installed. This can add to startup time somewhat but helps a
;; lot when keeping Emacs in sync across multiple machines.

;;; Set-up packages
(require 'package)
(require 'cl)

;; Add the Marmalade and Melpa package repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Activate installed packages
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
	("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fill-column 120)
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-hspace ((t (:foreground "black"))))
 '(whitespace-space ((t (:foreground "dark slate gray" :slant italic))))
 '(whitespace-tab ((t (:foreground "black")))))
