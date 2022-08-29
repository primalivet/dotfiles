;;; .emacs --- Emacs configuration

;;; Commentary:
;; Entry point for personal configuration of Emacs

;;; Code:

;; Bootstrap for stright.el
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

;; Install use-package
(straight-use-package 'use-package)
;; Configure use-package to use straight.el by default
;; (use-package straight
;;              :custom (straight-use-package-by-default t))

(use-package display-line-numbers
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode 1))

(use-package files
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))))

(use-package emacs
  :config
  (set-default 'truncate-lines 0)
  (setq inhibit-startup-screen t)
  (tool-bar-mode -1))

(use-package frame
  :config
  (setq default-frame-alist '(
			      ;; (fullscreen . maximized)
			      (font . "Iosevka-18"))))

(use-package paren
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

(use-package scroll-bar
  :config
  (scroll-bar-mode -1))

;; (use-package nano-emacs
;;   :straight t
;;   :host github
;;   :repo: "rougier/nano-emacs"
;;   :config
;;     (setq nano-font-family-monospaced "Iosevka")
;;     (setq nano-font-size 18)
;;     (require nano))

;; (straight-use-package
;;   '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))
;; (setq nano-font-family-monospaced "Iosevka")
;; (setq nano-font-size 18)


(use-package evil
  :straight t
  :init
  (setq evil-want-integration t) ;; required by evil-collection
  (setq evil-want-keybinding nil) ;; required by evil-collection
  (setq evil-want-C-u-scroll t)
  :config
  (evil-global-set-key 'normal (kbd "j") 'evil-next-visual-line)
  (evil-global-set-key 'normal (kbd "k") 'evil-previous-visual-line)
  (evil-mode))

;; (use-package evil-collection
;;   :custom (evil-collection-setup-minibuffer t)
;;   :after evil
;;   :config
;;   (evil-collection-init))

(use-package evil-commentary
  :straight t
  :init
  (evil-commentary-mode +1))

(use-package magit
  :straight t)

(use-package which-key
  :straight t
  :init
  (which-key-mode))

;; (use-package ivy
;;   :config
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) ")
;;   (ivy-mode 1)
;;   (counsel-mode 1))

;; Include my regular shell PATH variable in emacs.
(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

;; Linting (and formatting?)
(use-package flycheck
  :straight t
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (global-flycheck-mode))

;; Completion
(use-package company
  :straight t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (company-mode 1))

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
;; (use-package projectile
;;   :init
;;   (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
;;   (projectile-mode +1))
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
