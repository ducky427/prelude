;; For examples: https://github.com/Abizern/prelude/tree/master/personal
;; For org-mode: https://github.com/mjs2600/prelude/tree/master/personal
;; https://github.com/otfrom/otfrom-org-emacs
;; iterm2 and emacs: http://azaleasays.com/2013/07/05/setting-up-mac-os-x-and-iterm2-for-emacs/

;; For work screen
(defun make-work-screen ()
  (interactive)
  (set-frame-width (selected-frame) 170)
  (set-frame-height (selected-frame) 50))

;; From otfrom & http://www.emacswiki.org/emacs/BackupDirectory#toc1
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; FONTS
(setq default-frame-alist '((font . "Source Code Pro-16") (width . 120) (height . 40)))
;; (add-to-list 'default-frame-alist '(font .  "Source Code Pro-13" ))
;; (set-frame-font   "Source Code Pro-13" nil t)


;; AUTO-COMPLETE
(prelude-require-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; (setq prelude-flyspell nil)

;;(setq default-frame-alist '((top . 0) (left . 0) (width . 120) (height . 40)))

;; Turn off long line highlighting.
;; (setq whitespace-line-column 250)

;; But it would be nice to autoflow long paragraphs
;;(setq-default fill-column 80)


;; python virtualenv wrapper
;; (prelude-require-packages '(virtualenv virtualenvwrapper))
;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/.virtualenvs")

;; Python
;; see: https://github.com/gabrielelanaro/emacs-for-python


;; git-gutter
(prelude-require-package 'git-gutter)
(global-git-gutter-mode 1)

;; yasnippet
;; (prelude-require-package 'yasnippet)
;; (prelude-require-package 'clojure-snippets)
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; Allow hash to be entered
;; http://jimbarritt.com/non-random/2010/11/07/typing-the-pound-or-hash-key-in-emacs-on-uk-macbook/
(defun insert-pound ()
  "Inserts a pound into the buffer"
  (insert "#"))
(global-set-key (kbd "M-3") '(lambda()(interactive)(insert-pound)))

;; From: http://emacsredux.com/blog/2014/01/18/ido-vertical-mode/
(prelude-require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;;(prelude-require-package 'clj-refactor)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; F Sharp
;; (prelude-require-package 'fsharp-mode)
;; (setq inferior-fsharp-program "/opt/mono/bin/fsharpi --readline-")
;; (setq fsharp-compiler "/opt/mono/bin/fsharpc")

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
)

;; Elixir
(prelude-require-package 'elixir-mode)
(prelude-require-package 'alchemist)

;; For HyLang
(prelude-require-package 'hy-mode)
(add-hook 'hy-mode-hook #'smartparens-strict-mode)
(add-hook 'hy-mode-hook #'rainbow-delimiters-mode)

;; For clj-refactor
(prelude-require-package 'clj-refactor)
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)))

;; For go-lang
;; https://johnsogg.github.io/emacs-golang
(prelude-require-package 'go-autocomplete)
(prelude-require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; For neo-tree
(prelude-require-package 'neotree)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

(global-set-key [f8] 'neotree-project-dir)


(require 'prelude-helm-everywhere)

(provide 'personal)
;;; personal.el ends here