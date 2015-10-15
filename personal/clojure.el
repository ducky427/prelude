;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;; clojure
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)

;; (add-hook 'cider-repl-mode-hook 'subword-mode)
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)
;; (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)