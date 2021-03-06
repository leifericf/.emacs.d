;; CLOJURE

;; Enable paredit
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; Enable useful mode for working with camel-case tokens, e.g., JavaClassName
(add-hook 'clojure-mode-hook 'subword-mode)

;; More syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Syntax hilighting for midje
(add-hook 'clojure-mode-hook
  (lambda ()
    (setq inferior-lisp-program "lein repl")
    (font-lock-add-keywords
     nil
     '(("(\\(facts?\\)"
        (1 font-lock-keyword-face))
       ("(\\(background?\\)"
        (1 font-lock-keyword-face))))
    (define-clojure-indent (fact 1))
    (define-clojure-indent (facts 1))
    (rainbow-delimiters-mode)))

;; CIDER

;; Provide minibuffer documentation for code typed into the REPL
(add-hook 'cider-mode-hook 'eldoc-mode)

;; Go straight to the REPL buffer when it has finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-auto-select-error-buffer t)
(setq cider-show-error-buffer t)

;; Directory for storing CIDER history
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history
(setq cider-repl-wrap-history t)

;; Enable paredit in the REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use Clojure-mode for other extensions
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; Useful key bindings when developing web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))