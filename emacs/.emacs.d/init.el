;;; .emacs --- Emacs configuration

;;; Commentary:
;; Entry point for personal configuration of Emacs

;;; Code:

;; Boostrap Straight package manager
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

;; Use 'use-package' ontop of Straight
(straight-use-package 'use-package)

(eval-and-compile (require 'use-package))

(use-package ns-win
  :straight (:type built-in)
  :if (memq window-system '(mac ns))
  :init
  (setq mac-command-modifier 'meta))

(use-package display-line-numbers
  :straight (:type built-in)
  :init
  (setq display-line-numbers-type 'relative)
  :config
  (global-display-line-numbers-mode 1))

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
  :init (setq default-frame-alist '((font . "Iosevka Term-25"))))

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

;; Include my regular shell PATH variable in emacs.
(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))


(use-package zoom-frm
  :straight t)

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
  (evil-mode))

(use-package general
  :straight t
  :init
  (general-define-key
   :states 'normal
   "j" 'evil-next-visual-line
   "k" 'evil-previous-visual-line
   "C-=" 'zoom-in
   "C--" 'zoom-out
   "C-x p" 'projectile-switch-project
   "C-x f" 'projectile-find-file
   "C-x g" 'magit-status
   "[d" 'flycheck-previous-error
   "]d" 'flycheck-next-error)
  (general-create-definer my-leader-def
    :prefix "SPC") ;; Space is  the leader key
  (my-leader-def
   :states 'normal
   "sb" 'switch-to-buffer
   "sf" 'projectile-find-file
   "sc" 'execute-extended-command))

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
  :straight t)

(use-package which-key
  :straight t
  :init
  (which-key-mode))

(use-package savehist
  :straight (:type built-in)
  :init
  (savehist-mode))

(use-package vertico
  :straight t
  :after (savehist) ;; vertico sorts by history position
  :init
  (vertico-mode))

(use-package orderless
  :straight t
  :after (vertico)
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :straight t
  :after (vertico)
  :init
  (marginalia-mode))


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

(use-package projectile
  :straight t
  :init
  (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
  (projectile-mode +1))

(use-package tree-sitter
  :straight t
  :config
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  (global-tree-sitter-mode 1))

(use-package tree-sitter-langs
  :straight t
  :requires (tree-sitter))

(use-package typescript-mode
  :straight t)

(use-package lsp-mode
  :straight t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;; (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (typescript-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :straight t
  :after (lsp-mode)
  :commands lsp-ui-mode)

(use-package srcery-theme
  :straight t
  :init
  (load-theme 'srcery t))

;; (use-package gruber-darker-theme
;;   :straight t
;;   :init
;;   (load-theme 'gruber-darker t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;;; init.el ends here
