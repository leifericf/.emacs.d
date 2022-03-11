;; Change the way Emacs looks and disable/enable user interface elements

;; Disable distracting menu bar at the top of each frame
(menu-bar-mode -1)

;; Show line numbers
(global-linum-mode)

;; Remove the graphical toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show redundant native OS scroll bars for buffers
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color theme
(load-theme 'solarized-dark t)

;; Increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; Set the width (in characters wide) and height (in lines high) for Emacs window
(setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; Changes to how Emacs interacts with the operating system
(setq ;; Make killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; Not sure what this does, but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click
      mouse-yank-at-point t)

;; Disable distracting cursor blinking
(blink-cursor-mode 0)

;; Show full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; Disable annoying bell
(setq ring-bell-function 'ignore)