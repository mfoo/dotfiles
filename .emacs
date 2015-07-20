;; Martin's .emacs file
;;
;; Author: Martin Foot <martin@mfoot.com>
;;
;; This file is split into several sections. As a general overview,
;; the file adds some package repositories, then lists several
;; packages that I use regularly. It then defines a function that
;; executes on startup to automatically ensure all of those packages
;; are installed. This can add to startup time somewhat but helps a
;; lot when keeping Emacs in sync across multiple machines.

(require 'package)
(require 'cl)

;; Add the Marmalade and Melpa package repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Activate installed packages
(package-initialize)

(defvar required-packages
  '(
    ;; https://github.com/syohex/emacs-anzu
    ;; http://pragmaticemacs.com/emacs/prettier-text-replacement-with-anzu/
    ;;
    ;; Port of anzu.vim. Show total match count and current match
    ;; number when replacing strings. Display replaced text as
    ;; replacement is typed.
    anzu
    
    ;; https://github.com/defunkt/coffee-mode
    ;;
    ;; An Emacs major mode for CoffeeScript and IcedCoffeeScript.
    ;; Provides syntax highlighting, indentation support, imenu
    ;; support, a menu bar, and a few cute commands.
    coffee-mode

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

    ;; http://www.emacswiki.org/emacs/Evil
    ;;
    ;; Vim keybindings for Emacs
    evil

    ;; https://github.com/syohex/emacs-git-gutter
    ;;
    ;; Provides git modification markers in the left hand side gutter~
    ;; window that shows which lines have been locally modified
    ;; compared to the git index
    git-gutter

    magit
    yasnippet

    ;; https://github.com/emacs-helm/helm
    ;;
    ;; Helm is incremental completion and selection narrowing
    ;; framework for Emacs. It will help steer you in the right
    ;; direction when you're looking for stuff in Emacs (like buffers,
    ;; files, etc).
    helm

    ;; http://tuhdo.github.io/helm-projectile.html
    ;;
    ;; Helm-projectile uses helm as projectile's suggestion tab indexer
    helm-projectile

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

    ;; https://github.com/genehack/smart-tab
    ;;
    ;; An intelligent tab completion function for Emacs
    ;; http://www.emacswiki.org/emacs/TabCompletion
    smart-tab

    indent-guide

    ;; https://github.com/bbatsov/projectile
    ;;
    ;; Projectile is a project interaction library for Emacs. Its goal
    ;; is to provide a nice set of features operating on a project
    ;; level without introducing external dependencies(when
    ;; feasible). For instance - finding project files has a portable
    ;; implementation written in pure Emacs Lisp without the use of
    ;; GNU find (but for performance sake an indexing mechanism backed
    ;; by external commands exists as well).
    projectile

    ;; https://github.com/lunaryorn/puppet-mode
    ;;
    ;; Puppet Mode lets you edit Puppet 3 manifests with GNU Emacs 24.
    puppet-mode

    ;; https://github.com/Fanael/rainbow-delimiters
    ;;
    ;; rainbow-delimiters is a "rainbow parentheses"-like mode which
    ;; highlights delimiters such as parentheses, brackets or braces
    ;; according to their depth. Each successive level is highlighted
    ;; in a different color. This makes it easy to spot matching
    ;; delimiters, orient yourself in the code, and tell which
    ;; statements are at a given depth.
    rainbow-delimiters

    ;; https://julien.danjou.info/projects/emacs-packages
    ;;
    ;; Rainbow mode highlights hex colour references in that colour;
    rainbow-mode


    solarized-theme

    ;; https://github.com/antonj/scss-mode
    scss-mode
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


;; Automatically follow symlinks when visiting them
(setq vc-follow-symlinks t)

;; Enable Helm completion and suggestions
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
;;(require 'helm-ls-git)

;; Disable the menu bar
(menu-bar-mode -1)

;; Smart-mode-line setup
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup)

;; Indent guide - highlight current indent level vertically
(require 'indent-guide)
(indent-guide-global-mode)

;;;; Global mode configuration
(projectile-global-mode)		  ; Enable projectile everywhere
(setq projectile-completion-system 'helm) ; Use helm as the projectile completion system
(helm-projectile-on)			  ; Enable helm-projectile
(global-whitespace-cleanup-mode)	  ; Enable whitespace-mode globally
(rainbow-delimiters-mode)		  ; Highlight nested parentheses in different colours
(rainbow-mode)				  ; Highlight CSS colours in their actual colour


(global-whitespace-mode)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(global-git-gutter-mode)		  ; Enable git-gutter-mode everywhere
(global-linum-mode)                       ; Enable line numbers in everywhere
(electric-pair-mode)			  ; Automatically complete parentheses when typed
(show-paren-mode)			  ; Automatically highlight parenthesis pairs
(column-number-mode)			  ; Show the column number in the cursor position in the bottom left
(global-hl-line-mode)			  ; Highlight the current cursor line
(set-face-foreground 'git-gutter:added "green") ; Configure the colour scheme for git-gutter-mode
(set-face-foreground 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:deleted "red")
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;;; Major mode configuration
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-whitespace-newline-mode t))
	  		; Set the tab width to two in coffee-mode

;;;; General editor configuration
(setq scroll-step 1)			; Scroll smoothly rather than by paging
(setq visible-bell 1)			; Disable terminal bells
(setq-default
  show-trailing-whitespace t)	        ; Highlight trailing whitespace

(windmove-default-keybindings)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(defalias 'yes-or-no-p 'y-or-n-p)	; Use 'y' or 'n' instead of 'yes' and 'no' in interactive buffers

(setq backward-delete-char-untabify-method nil) ; Disable hitting backspace on tabs converting that tab into spaces

;; default to using tabs at 4
;; (setq-default indent-tabs-mode t)
;; (setq-default tab-width 4)
;; (setq-default tab-stop-list (number-sequence 4 200 4))
;; (setq-default tab-always-indent 'complete)
;; (setq-default c-basic-offset 4)
;; (setq-default c-default-style "bsd")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit highlight :background "black"))))
 '(whitespace-space ((t (:background "grey20" :foreground "color-238"))))
 '(whitespace-tab ((t (:background "grey22" :foreground "color-238")))))

(defun coffee-mode-hook ()
  'Mode configuration for working with CoffeeScript files'
  (flyspell-mode)
  )

(add-hook 'coffee-mode-hook 'coffee-mode-hook)
(add-hook 'markdown-mode-hook

	  )