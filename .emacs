;; Martin's .emacs file
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

    ;; https://github.com/syohex/emacs-git-gutter
    ;;
    ;; Provides git modification markers in the left hand side gutter
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global major mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(projectile-global-mode)		  ; Enable projectile everywhere
(setq projectile-completion-system 'helm) ; Use helm as the projectile completion system
(helm-projectile-on)			  ; Enable helm-projectile
(global-whitespace-cleanup-mode t)	  ; Enable whitespace-mode globally
(global-git-gutter-mode t)		  ; Enable git-gutter-mode everywhere
(set-face-foreground 'git-gutter:added "green") ; Configure the colour scheme for git-gutter-mode
(set-face-foreground 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:deleted "red")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Major mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 '(coffee-tab-width 2))	  		; Set the tab width to two in coffee-mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general editor configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq scroll-step 1)			; Scroll smoothly rather than by paging
(setq visible-bell 1)			; Disable terminal bells
(setq show-trailing-whitespace t)	; Highlight trailing whitespace
