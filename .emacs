;; Martin's .emacs file
;;
;; Author: Martin Foot <martin@mfoot.com>

; To speed up init, the garbage collection settings are increased while init is happening, then restored afterwards.
(setq gc-cons-threshold 100000000)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
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
