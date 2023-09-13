;;; web.el -*- lexical-binding: t; -*-

(setq web-mode-enable-front-matter-block t)
(define-derived-mode astro-mode web-mode "Astro")
(setq auto-mode-alist
      (append '(("\\.astro\\'" . astro-mode))
              auto-mode-alist))

(after! lsp-mode
        (add-to-list 'lsp-language-id-configuration '(astro-mode . "astro"))
        (add-hook 'astro-mode-local-vars-hook #'lsp! 'append))

;; prettier works with these lines
(setq-hook! '(astro-mode-hook javascript-mode-hook typescript-mode-hook rjsx-mode-hook typescript-tsx-mode-hook) lsp-javascript-format-enable nil)
(setq-hook! '(astro-mode-hook javascript-mode-hook typescript-mode-hook rjsx-mode-hook typescript-tsx-mode-hook) lsp-typescript-format-enable nil)
(setq-hook! 'json-mode-hook +format-with-lsp nil)

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-major-modes '(rjsx-mode web-mode html-mode css-mode typescript-mode astro-mode))
  (setq lsp-tailwindcss-add-on-mode t))

(setq lsp-css-lint-unknown-at-rules "ignore")
(lsp-register-custom-settings
 '(("scss.lint.unknownAtRules" "ignore")))

(add-hook 'typescript-tsx-mode-hook
  (lambda ()
    ;; Preferred comment style
    (setq comment-start "// "
          comment-end "")))
