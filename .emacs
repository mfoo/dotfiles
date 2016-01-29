;;; .emacs --- Martin's Emacs config file

;; Author: Martin Foot <martin@mfoot.com>
;; URL: https://github.com/mfoo/dotfiles/blob/master/.emacs

;;; Commentary:

;; This file contains my Emacs configuration.  It uses org-babel-load-file so that my configuration can be described in
;; a literate way.  See https://www.mfoot.com/static/emacs-config/config.html for the latest version of these settings.

;;; Code:
(require 'org)
(org-babel-load-file (concat user-emacs-directory "config.org"))

(provide 'emacs)
;;; .emacs ends here
