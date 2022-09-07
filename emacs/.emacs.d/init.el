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
  :if (string=
       system-type "darwin")
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
  :init (setq default-frame-alist '((font . "Iosevka Term-20"))))

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
   "C--" 'zoom-out)
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
  :straight t
  :bind (("C-x C-g" . magit-status)))

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

;; Include my regular shell PATH variable in emacs.
;; (use-package exec-path-from-shell
;;   :straight t
;;   :config
;;   (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize)))

(use-package projectile
  :straight t
  :init
  (setq projectile-project-search-path '(("~/Code/OSS/" . 1) ("~/Code/Work/" . 1)))
  (projectile-mode +1))

(use-package tree-sitter
  :straight t
  :init
  (global-tree-sitter-mode 1))

(use-package tree-sitter-langs
  :straight t
  :requires (tree-sitter))

(use-package gruber-darker-theme
  :straight t
  :init
  (load-theme 'gruber-darker t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;;; init.el ends here
