;; Setup

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (setq use-package-always-ensure t))

;; Core packages

(use-package display-line-numbers
  :ensure nil
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode 1))

(use-package files
  :ensure nil
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))))

(use-package emacs
  :ensure nil
  :config
  (tool-bar-mode -1))

(use-package emacs
  :ensure nil
  :config
  (setq inhibit-startup-screen t))

(use-package frame
  :ensure nil
  :config
  (setq default-frame-alist '(
			      ;; (fullscreen . maximized)
			      (font . "Iosevka-18"))))

(use-package paren
  :ensure nil
  :init 
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

(use-package scroll-bar
  :ensure nil
  :config
  (scroll-bar-mode -1))

;; ELPA packages

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
  (company-mode 1))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package lsp-mode
  :hook(
	(typescript-mode . lsp)
	(js-mode . lsp)
	(js-jsx-mode . lsp)
	(lsp-mode . lsp-enable-which-key-integration)
	)
  :commands lsp)

(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  :config
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (ivy-mode 1))

(use-package swiper)
(use-package counsel)


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(haskell-mode counsel swiper ivy evil-commentary srcery-theme ligature ligatures emacs zenburn-theme which-key use-package projectile magit helm evil doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
