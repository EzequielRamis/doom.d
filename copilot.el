;;; copilot.el -*- lexical-binding: t; -*-

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))

(after! company
    (define-key company-active-map (kbd "TAB") nil)
    (define-key company-active-map (kbd "<tab>") nil)
    (define-key company-active-map (kbd "<backtab>") nil))

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
