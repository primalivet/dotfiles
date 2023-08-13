;; .emacs --- Emacs configuration

;; Load Emacs Lisp packages, and activate them.
;; The variable ‘package-load-list’ controls which packages to load
(package-initialize)

;; Modify default list for creating frames with Iosevka font
(setq default-frame-alist '((font . "Iosevka Term-25")))

;; Globally enable line numbers
(global-display-line-numbers-mode t)

;; Disable menubar, toolbar and scrollbars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show matching parens, and do it without delay
(show-paren-mode +1)
(setq show-paren-delay 0)

;; Keep backups in the saves folder, TODO: is this correct?
(setq backup-directory-alist `(("." . "~/.saves")))

;; Menu completion builtin to Emacs.
;; Use it everywhere, and use "fuzzy/flex" matching
(require 'ido)
( ido-mode t)
( ido-everywhere t)
(setq ido-enable-flex-matching t)

(windmove-default-keybindings)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))

;; This package replaces stock emacs completion with ido completion wherever
;; it is possible to do so without breaking things (i.e. what you were
;; probably hoping for when you set ido-everywhere to t).
;; https://github.com/DarwinAwardWinner/ido-completing-read-plus
(rc/require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

;; Magit is an interface to the version control system Git, implemented as
;; an Emacs package. Magit aspires to be a complete Git porcelain.
;; https://magit.vc/manual/magit/#Top
(rc/require 'magit)

;; ;; Include my regular shell PATH variable in emacs.
;; (use-package exec-path-from-shell
;;   :straight t
;;   :config
;;   (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize)))

;; (use-package zoom-frm
;;   :straight t)

;; (use-package vterm
;;   :straight t)

;; (use-package editorconfig
;;   :straight t
;;   :config
;;   (editorconfig-mode 1))

;; (use-package evil
;;   :straight t
;;   :init
;;   (setq evil-want-integration t) ;; required by evil-collection
;;   (setq evil-want-keybinding nil) ;; required by evil-collection
;;   (setq evil-want-C-u-scroll t)
;;   (setq evil-shift-width 2)
;;   (setq evil-shift-round 2)
;;   (setq evil-undo-system 'undo-redo)
;;   :config
;;   (evil-mode))

;; (use-package general
;;   :straight t
;;   :init
;;   (general-define-key
;;    :states 'normal
;;    "j" 'evil-next-visual-line
;;    "k" 'evil-previous-visual-line
;;    "C-=" 'zoom-in
;;    "C--" 'zoom-out
;;    "C-x p" 'projectile-switch-project
;;    "C-x f" 'projectile-find-file
;;    "C-x g" 'magit-status
;;    "[d" 'flycheck-previous-error
;;    "]d" 'flycheck-next-error)
;;   (general-create-definer my-leader-def
;;     :prefix "SPC") ;; Space is  the leader key
;;   (my-leader-def
;;    :states 'normal
;;    "sb" 'switch-to-buffer
;;    "sf" 'projectile-find-file
;;    "sc" 'execute-extended-command))

;; (use-package evil-commentary
;;   :straight t
;;   :requires (evil)
;;   :init
;;   (evil-commentary-mode +1))


;; (use-package evil-collection
;;   :straight t
;;   :custom (evil-collection-setup-minibuffer t)
;;   :after evil
;;   :config
;;   (evil-collection-init))

;; (use-package magit
;;   :straight t)

;; (use-package which-key
;;   :straight t
;;   :init
;;   (which-key-mode))

;; (use-package savehist
;;   :straight (:type built-in)
;;   :init
;;   (savehist-mode))

;; (use-package vertico
;;   :straight t
;;   :after (savehist) ;; vertico sorts by history position
;;   :init
;;   (vertico-mode))

;; (use-package orderless
;;   :straight t
;;   :after (vertico)
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion)))))

;; (use-package marginalia
;;   :straight t
;;   :after (vertico)
;;   :init
;;   (marginalia-mode))


;; (use-package flycheck
;;   :straight t
;;   :init
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   :config
;;   (global-flycheck-mode))

;; (use-package company
;;   :straight t
;;   :init
;;   (setq company-idle-delay 0.0)
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (company-mode 1))

;; (use-package projectile
;;   :straight t
;;   :init
;;   (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
;;   (projectile-mode +1))

;; (use-package tree-sitter
;;   :straight t
;;   :config
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;   (global-tree-sitter-mode 1))

;; (use-package tree-sitter-langs
;;   :straight t
;;   :requires (tree-sitter))

;; (use-package typescript-mode
;;   :straight t)

;; (use-package lsp-mode
;;   :straight t
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   ;; (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (typescript-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; (use-package lsp-ui
;;   :straight t
;;   :after (lsp-mode)
;;   :commands lsp-ui-mode)

;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (load custom-file)
;; ;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit lua-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
