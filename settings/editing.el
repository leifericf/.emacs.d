;; Customizations related to editing a buffer

;; Key binding to use "hippie expand" for text autocompletion
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
  '(try-complete-lisp-symbol
    try-complete-lisp-symbol-partially
    try-expand-dabbrev
    try-expand-dabbrev-all-buffers
    try-expand-dabbrev-from-kill))

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Automatically create backup files in  ~/.emacs.d/backups
(setq backup-directory-alist `(("." . , (concat user-emacs-directory "backups"))))
(setq auto-save-default nil)

;; Function and key binding to comment/uncomment current line
(defun toggle-comment-on-line ()
  "Comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; Use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; Fix weird macOS kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
    (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

;; Disable electric Indent mode
(setq electric-indent-mode nil)