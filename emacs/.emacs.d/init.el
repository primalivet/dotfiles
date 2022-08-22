;;; .emacs --- Emacs configuration

;;; Commentary:
;; Entry point for personal configuration of Emacs

;;; Code:

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (setq use-package-always-ensure t))


(use-package display-line-numbers
  :ensure nil ;; Built in package
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode 1))

(use-package files
  :ensure nil ;; Built in package
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))))

(use-package emacs
  :ensure nil ;; Built in package
  :config
  (set-default 'truncate-lines 0)
  (setq inhibit-startup-screen t)
  (tool-bar-mode -1))

(use-package frame
  :ensure nil ;; Built in package
  :config
  (setq default-frame-alist '(
			      ;; (fullscreen . maximized)
			      (font . "Iosevka-18"))))

(use-package paren
  :ensure nil ;; Built in package
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

(use-package scroll-bar
  :ensure nil ;; Built in package
  :config
  (scroll-bar-mode -1))

(use-package evil
  :init
  (setq evil-want-integration t) ;; required by evil-collection
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  :config
  (evil-global-set-key 'normal (kbd "j") 'evil-next-visual-line)
  (evil-global-set-key 'normal (kbd "k") 'evil-previous-visual-line)
  (evil-mode))

(use-package evil-commentary
  :init
  (evil-commentary-mode +1))

(use-package evil-collection
  :custom (evil-collection-setup-minibuffer t)
  :after evil
  :config
  (evil-collection-init))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (company-mode 1))

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1)
  (counsel-mode 1))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package flycheck
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (global-flycheck-mode))

(use-package tide
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package lsp-mode
  :hook((typescript-mode . lsp)
	(js-mode . lsp)
	(js-jsx-mode . lsp)
	(lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package projectile
  :init
  (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
  (projectile-mode +1))

(use-package magit)

(use-package which-key
  :init
  (which-key-mode))

(use-package srcery-theme
  :init
  (load-theme 'srcery t))

(use-package haskell-mode)
(use-package lua-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;;; init.el ends here
