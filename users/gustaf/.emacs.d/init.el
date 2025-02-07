;; .emacs --- Emacs configuration

(package-initialize)

(setq default-frame-alist '((font . "Iosevka Term-25")))

(global-display-line-numbers-mode t)

(setq inhibit-splash-screen t)
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


;; Packages 
(rc/require
 'ido-completing-read+
 'company
 'magit
 'evil
 'evil-commentary
 'vterm
 'exec-path-from-shell)

;; Ido ubercompletion thing, dont know really
(ido-ubiquitous-mode 1)

;; Company (completion in buffers)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(add-hook 'after-init-hook 'global-company-mode)

;; Evil (vi mode)
(setq evil-want-C-u-scroll t)
(setq evil-undo-system 'undo-redo)
(evil-mode t)
(evil-commentary-mode t)

;; Recognize path from shell
(exec-path-from-shell-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;;; init.el ends here
