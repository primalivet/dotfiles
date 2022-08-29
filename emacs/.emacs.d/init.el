;;; .emacs --- Emacs configuration

;;; Commentary:
;; Entry point for personal configuration of Emacs

;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(eval-and-compile (require 'use-package))

(use-package ns-win
  :straight (:type built-in)
  :init
  (setq mac-command-modifier 'meta))

(use-package display-line-numbers
  :straight (:type built-in)
  :init
  (setq display-line-numbers-type 'relative)
  :config
  (global-display-line-numbers-mode 1))

(use-package recentf
  :straight (:type built-in)
  :init
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 25)
  :config
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  (recentf-mode 1))

(use-package files
  :straight (:type built-in)
  :init
  (setq backup-directory-alist `(("." . "~/.saves"))))


(use-package emacs
  :straight (:type built-in)
  :init
  (setq inhibit-startup-screen t)
  (set-default 'truncate-lines 0)
  :config
  (tool-bar-mode -1))

(use-package frame
  :straight (:type built-in)
  :init
  (setq default-frame-alist '(
			      (fullscreen . maximized)
			      (font . "Iosevka-20"))))

(use-package paren
  :straight (:type built-in)
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

(use-package scroll-bar
  :straight (:type built-in)
  :config
  (scroll-bar-mode -1))

(use-package zoom-frm
  :straight t
  :bind (
	 ("C-x C-=" . zoom-in)
	 ("C-x C--" . zoom-out)))

(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t) ;; required by evil-collection
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  (setq evil-shift-width 2)
  (setq evil-shift-round 2)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-global-set-key 'normal (kbd "j") 'evil-next-visual-line)
  (evil-global-set-key 'normal (kbd "k") 'evil-previous-visual-line)
  (evil-mode))

(use-package evil-commentary
  :straight t
  :requires (evil)
  :init
  (evil-commentary-mode +1))


(use-package evil-collection
  :straight t
  :custom (evil-collection-setup-minibuffer t)
  :after evil
  :config
  (evil-collection-init))

(use-package magit
  :straight t
  :bind (("C-x C-g" . magit-status)))

(use-package which-key
  :straight t
  :init
  (which-key-mode))

(use-package ivy
  :straight t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

;; Include my regular shell PATH variable in emacs.
;; (use-package exec-path-from-shell
;;   :straight t
;;   :config
;;   (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize)))

(use-package flycheck
  :straight t
  :init
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  :config
  (global-flycheck-mode))

(use-package company
  :straight t
  :init
  (setq company-idle-delay 0.0)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (company-mode 1))

;; (use-package projectile
;;   :straight t
;;   :init
;;   (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
;;   (projectile-mode +1))

;; (use-package tide
;;   :config
;;   (defun setup-tide-mode ()
;;     (interactive)
;;     (tide-setup)
;;     (eldoc-mode +1)
;;     (tide-hl-identifier-mode +1)
;;     (company-mode +1))
;;   (add-hook 'typescript-mode-hook #'setup-tide-mode))
;;
;; (use-package lsp-mode
;;   :hook((typescript-mode . lsp)
;; 	(js-mode . lsp)
;; 	(js-jsx-mode . lsp)
;; 	(lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)
;;
;;
;;
;; (use-package srcery-theme
;;   :init
;;   (load-theme 'srcery t))
;;
;; (use-package haskell-mode)
;; (use-package lua-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;;; init.el ends here
