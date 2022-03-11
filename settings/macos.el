;; Change modifier keys to prevent "Emacs pinky"
(setq mac-command-modifier 'meta
      mac-option-modifier 'super
      ns-function-modifier 'hyper)

;; Change alt-keys for Norwegian keyboard layout
(define-key key-translation-map (kbd "M-s-7") (kbd "M-|"))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-9") (kbd "]"))