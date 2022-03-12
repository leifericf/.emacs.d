;; Check if system is running macOS
(setq is-mac (equal system-type 'darwin))

;; Keep Emacs custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Define paths to dependencies
(setq vendor-dir
      (expand-file-name "vendor" user-emacs-directory))
(setq settings-dir
  (expand-file-name "settings" user-emacs-directory))

;; Add dependencies to load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path vendor-dir)

;; Add external dependencies (Git submodules) to load path
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Refresh package info if necessary
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
'(
  cider
  clojure-mode
  clojure-mode-extra-font-locking
  ido-completing-read+
  magit
  paredit
  projectile
  rainbow-delimiters
  smex
  solarized-theme
  tagedit
  ))

(when is-mac
  (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load additional customizations
(load "clojure.el")
(load "editing.el")
(load "elisp.el")
(load "interface.el")
(load "macos.el")
(load "misc.el")
(load "navigation.el")
(load "shell.el")