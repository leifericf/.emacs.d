;; Customizations which mak it easier to navigate files, switch buffers, and choose options from the minibuffer

;; Include part of file directory name at the beginning of buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Make it easier to switch to recently edited files when starting Emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; Enable ido-mode for better navigation choices
(ido-mode t)

;; Allow partial matches, e.g., "tl" will match "Tyrion Lannister"
(setq ido-enable-flex-matching t)

;; Disable annoying behavior
(setq ido-use-filename-at-point nil)

;; Only match files in the current directory displayed in the minibuffer
(setq ido-auto-merge-work-directories-length -1)

;; Include buffer names of recently open files, even if they're not open now
(setq ido-use-virtual-buffers t)

;; Enable ido in all contexts where it could be useful
(ido-everywhere t)
(ido-ubiquitous-mode t)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enhance meta to allow easier execution of commands
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Projectile everywhere!
(projectile-global-mode)