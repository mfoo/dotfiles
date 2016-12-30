
;; Martin's .emacs file
;;
;; Author: Martin Foot <martin@mfoot.com>

(setq gc-cons-threshold 100000000)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (setq use-package-always-ensure t)
  (setq use-package-verbose t) ; Put slow loading packages / config warnings in the *Messages* buffer
  (require 'use-package)
)

; Ensure the latest org-mode version
(use-package org-plus-contrib
  :ensure t
)

(org-babel-load-file (concat user-emacs-directory "config.org"))

(setq gc-cons-threshold 800000)
