;; Check if system is running macOS
(setq is-mac (equal system-type 'darwin))

;; Keep Emacs custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Define paths to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir
  (expand-file-name "settings" user-emacs-directory))

;; Add dependencies to load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Add external dependencies (Git submodules) to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Install missing packages
(require 'packages)

(defun init-install-packages ()
  (packages-install
   '(
    cider
    clojure-mode
    clojure-mode-extra-font-locking
    exec-path-from-shell
    ido-completing-read+
    magit
    paredit
    projectile
    rainbow-delimiters
    smex
    solarized-theme
    tagedit
    )))

(condition-case nil
    (init-install-packages)
  (error
   (package-refresh-contents)
   (init-install-packages)))

;; Set up environment variables from the user's shell
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Load additional customizations
(load "clojure.el")
(load "editing.el")
(load "elisp.el")
(load "interface.el")
(load "macos.el")
(load "misc.el")
(load "navigation.el")
(load "shell.el")