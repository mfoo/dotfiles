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

	;; https://github.com/winterTTr/ace-jump-mode
	;;
	;; Very fast navigation.
	ace-jump-mode

	;; https://github.com/defunkt/coffee-mode
	;;
	;; An Emacs major mode for CoffeeScript and IcedCoffeeScript.
	;; Provides syntax highlighting, indentation support, imenu
	;; support, a menu bar, and a few cute commands.
	coffee-mode

	;; https://github.com/purcell/flymake-coffee
	;;
	;; Flymake mode for CoffeeScript linting
	flymake-coffee

    ;; https://github.com/benprew/flymake-puppet
    ;;
    ;; Puppet flymake support with puppet-lint
    flymake-puppet

	;; https://github.com/flycheck/flycheck
	;;
	;; Modern, on-the-fly syntax checking.
	flycheck

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

	;; https://github.com/timcharper/evil-surround
	;;
	;; evil-surround is a port of vim's surround plugin. It allows changing surrounding items (e.g. double quotes) for
	;; single quotes with c s " ' https://github.com/syohex/emacs-git-gutter
	evil-surround

	;; https://github.com/krisajenkins/evil-tabs
	;;
	;; evil-tabs adds vim's tab functionality.
	evil-tabs

	;; Provides git modification markers in the left hand side gutter~
	;; window that shows which lines have been locally modified
	;; compared to the git index
	;;
	;; This is currently commented out because it does not work well
	;; with linum-mode.
	; git-gutter

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

	;; https://github.com/pezra/rspec-mode
	;;
	;; Enable running rspec tests from inside emacs
	rspec-mode


	;; https://github.com/rejeep/ruby-end.el
	;;
	;; Automatically insert 'end' blocks when 'do' is typed in ruby
	ruby-end

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

;;; Emacs defaults configuration
(setq vc-follow-symlinks t)				; Automatically follow symlinks when visiting them
(setq inhibit-startup-message t) ; Disable the welcome screen

;;; Inbuilt minor mode configuration
(menu-bar-mode -1)				 ; Disable the menu bar
(global-linum-mode)						  ; Enable line numbers in everywhere
(setq linum-format "%d ")				  ; Stick a space after the line numbers
(column-number-mode)			  ; Show the column number in the cursor position in the bottom left
(global-hl-line-mode)			  ; Highlight the current cursor line


;; Enable Helm completion and suggestions
(helm-mode 1)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
;;(require 'helm-ls-git)

;; Enable evil-mode globally
(evil-mode)
(global-evil-tabs-mode t)
(global-evil-surround-mode t)

;; Smart-mode-line setup
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup)

; Indent guide - highlight current indent level vertically
; (indent-guide-global-mode)
; (setq indent-guide-recursive t)


;;; Global mode configuration
(setq projectile-completion-system 'helm) ; Use helm as the projectile completion system
(helm-projectile-on)			 ; Enable helm-projectile
;(global-whitespace-cleanup-mode)	; Enable whitespace-mode globally
(rainbow-delimiters-mode)		; Highlight nested parentheses in different colours
(rainbow-mode)				; Highlight CSS colours in their actual colour
(projectile-global-mode)		  ; Enable projectile everywhere


;(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark)))

(electric-pair-mode)			  ; Automatically complete parentheses when typed
(show-paren-mode)			  ; Automatically highlight parenthesis pairs
(setq show-paren-delay 0) ; show the paren match immediately
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-x g") 'magit-status)

;;; Major mode configuration
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
 '(org-todo-keywords (quote ((sequence "TODO" "IN_PROGRESS" "|" "DONE")))))


;;;; General editor configuration
(setq scroll-step 1)			; Scroll smoothly rather than by paging
(setq visible-bell 1)			; Disable terminal bells
(setq-default
  show-trailing-whitespace t)		; Highlight trailing whitespace
(global-auto-revert-mode t)	; Automatically revert buffers when files change

(windmove-default-keybindings)
(global-set-key (kbd "C-c <left>")	'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")	'windmove-up)
(global-set-key (kbd "C-c <down>")	'windmove-down)

(defalias 'yes-or-no-p 'y-or-n-p)	; Use 'y' or 'n' instead of 'yes' and 'no' in interactive buffers

(setq backward-delete-char-untabify-method nil) ; Disable hitting backspace on tabs converting that tab into spaces

;; default to using tabs at 4
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 200 4))
(setq-default tab-always-indent 'complete)
(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")

;; By default emacs doesn't tab indent to the current level when you hit return. Move to vim style.
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Don't make backup save files
(setq make-backup-files nil)

;; Enable multiple windows like a graphical debugger then using GDB
(setq gdb-many-windows t)

(defun common-text-editing-hook ()
  "Mode configuration for working with text files"
  (flyspell-mode)						; Automatic spell checking
  (auto-fill-mode)						; Add line wraps up to fill-column automatically
  )

(defun common-programming-language-hook ()
  "Mode configuration for working with source code files"
  (flycheck-mode)
  (flyspell-prog-mode))

(defun org-interactive-hook ()
  "Mode configuration for org mode when it's run interactively"
  (interactive)
  (org-display-inline-images t t)
  (org-add-link-type
   "yt"
   (lambda (handle)
     (browse-url
      (concat "https://www.youtube.com/embed/"
              handle)))
   (lambda (path desc backend)
     (cl-case backend
       (html (format yt-iframe-format
                     path (or desc "")))
       (latex (format "\href{%s}{%s}"
                      path (or desc "video")))))))

;(defun projectile-custom-hook ()
;  "Mode configuration for helm-projectile"
;  (global-set-key (kbd "C-c p g") 'helm-projectile-grep))

(add-hook 'markdown-mode-hook 'common-text-editing-hook)
(add-hook 'coffee-mode-hook 'common-programming-language-hook)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
(add-hook 'org-mode-hook 'common-text-editing-hook)
(add-hook 'org-mode-hook 'org-interactive-hook)
(add-hook 'puppet-mode-hook 'flymake-puppet-load)
(add-hook 'ruby-mode-hook 'common-programming-language-hook)

;(add-hook 'projectile-mode-hook 'projectile-custom-hook)
;(add-hook 'helm-projectile-mode-hook 'projectile-custom-hook)

;(global-unset-key (kbd "C-c p g"))
;(global-set-key (kbd "C-c p g") 'helm-projectile-grep)
;(define-key projectile-command-map (kbd "C-c p g") 'helm-projectile-grep)

;; If we're at the end of a word and hit TAB, run the expand command
;; for tab completion. If we're not at the end of a word, run the
;; normal tab command
;; http://emacsblog.org/2007/03/12/tab-completion-everywhere/
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))


(load-theme 'solarized-dark)


(local-set-key (kbd "<tab>") 'indent-or-expand)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-hspace ((t (:foreground "black"))))
 '(whitespace-space ((t (:foreground "dark slate gray" :slant italic))))
 '(whitespace-tab ((t (:foreground "black")))))

(add-to-list 'auto-mode-alist '("\\.hamlc$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.json.jbuilder$" . ruby-mode))

(set-face-attribute 'default nil :height 90)

(tool-bar-mode -1)


(setq rspec-use-rake-when-possible nil)
(setq rspec-use-bundler-when-possible nil)
(setq rspec-use-rvm-when-possible t)

;; TODO: Try and get projectile-ag to work. Is git grep better?
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin"))
(setenv "PATH" (concat  "/home/martin/.rvm/rubies/ruby-2.1.5/bin" ":" "/home/martin/.rvm/gems/ruby-2.1.5/bin" ":" (getenv "PATH")))
(setenv "GEM_HOME" "/home/martin/.rvm/gems/ruby-2.1.5")
(add-to-list 'exec-path "/home/martin/.rvm/gems/ruby-2.1.5/bin")
(add-to-list 'exec-path "/home/martin/.rvm/rubies/ruby-2.1.5/bin")

;; Allow exporting YouTube videos in HTML export. Via
;; http://endlessparentheses.com/embedding-youtube-videos-with-org-mode-links.html
(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(setq circe-network-options
      '(("Freenode"
         :tls t
         :nick "my-nick"
         :sasl-username "my-nick"
         :sasl-password "my-password"
         :channels ("#emacs-circe")
         )))

;; http://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ditaa.html
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

;; Source highlight font blocks in org mode using the correct mode
(setq-default org-src-fontify-natively t)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)
   (sh . t)
  ))

(setq org-ditaa-jar-path "/home/martin/bin/ditaa0_9.jar")

;; Things that are not in melpa
(add-to-list 'load-path "~/Dropbox/lisp/")
(require 'flymake-easy)

;; Map ace-jump-mode to just space when in normal mode in evil
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(setq x-select-enable-clipboard t)
