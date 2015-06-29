(require 'package)
(require 'cl)

;; Add the Marmalade and Melpa package repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

; activate installed packages
(package-initialize)

(defvar required-packages
  '(
    ;; https://github.com/purcell/whitespace-cleanup-mode
    ;;
    ;; whitespace-cleanup is a handy function, but putting it in
    ;; before-save-hook for every buffer is overkill, and causes messy
    ;; diffs when editing third-party code that did not initially have
    ;; clean whitespace.  Additionally, whitespace preferences are
    ;; often project-specific, and it's inconvenient to set up
    ;; before-save-hook in a .dir-locals.el file.
    ;; whitespace-cleanup-mode is a minor mode which calls
    ;; whitespace-cleanup before saving the current buffer, but only
    ;; if the whitespace in the buffer was initially clean. It
    ;; determines this by quickly checking to see if
    ;; whitespace-cleanup would have any effect on the buffer
    whitespace-cleanup-mode

    magit
    yasnippet
    helm
    markdown-mode
    dockerfile-mode
    yaml-mode

    ;; https://github.com/Malabarba/smart-mode-line
    ;;
    ;; Smart Mode Line is a sexy mode-line for Emacs. It aims to be
    ;; easy to read from small to large monitors by using colors, a
    ;; prefix feature, and smart truncation.
    smart-mode-line
    smart-mode-line-powerline-theme


    indent-guide

    ;; https://github.com/Fanael/rainbow-delimiters
    ;;
    ;; rainbow-delimiters is a "rainbow parentheses"-like mode which
    ;; highlights delimiters such as parentheses, brackets or braces
    ;; according to their depth. Each successive level is highlighted
    ;; in a different color. This makes it easy to spot matching
    ;; delimiters, orient yourself in the code, and tell which
    ;; statements are at a given depth.
    rainbow-delimiters
    
    solarized-theme
  ) "a list of packages to ensure are installed at launch.")


; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
	finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;  Disable the audible bell
(setq visible-bell 1)

;;; Enable Helm completion and suggestions
;(require 'helm-config)
;(helm-mode 1)
;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(require 'helm-ls-git)

; Disable the menu bar
(menu-bar-mode -1)

; Smart-mode-line setup
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup)

; Indent guide - highlight current indent level vertically
(require 'indent-guide)
(indent-guide-global-mode)

