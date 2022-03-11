;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Change offsett and indentation for shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Do not create ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on start-up
(setq inhibit-startup-message t)