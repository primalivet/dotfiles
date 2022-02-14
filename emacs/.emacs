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
  :ensure nil
  :config
  (global-display-line-numbers-mode 1))

(use-package files
  :ensure nil
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))))

(use-package emacs
  :ensure nil
  :config
  (tool-bar-mode -1))

(use-package frame
  :ensure nil
  :config
  (setq default-frame-alist '(
			      (fullscreen . maximized)
			      (font . "Fira Code-18"))))

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

(use-package evil
  :init
  (setq evil-want-integration t) ;; required by evil-collection
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  :config
  (evil-global-set-key 'normal (kbd "j") 'evil-next-visual-line)
  (evil-global-set-key 'normal (kbd "k") 'evil-previous-visual-line)
  (evil-mode))

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
  :hook ((
	  js-mode
	  js-jsx-mode
	  typescript-mode
	  web-mode
	  ) . lsp-deferred)
  :commands lsp)


(use-package helm
  :preface (require 'helm-config)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config (helm-mode 1))

(use-package projectile
  :init
  (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
  (projectile-mode +1))

(use-package magit)

(use-package which-key
  :init
  (which-key-mode))

(use-package doom-themes
  :config
  ;; Global Doom settings
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(ligature ligatures emacs zenburn-theme which-key use-package projectile magit helm evil doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
