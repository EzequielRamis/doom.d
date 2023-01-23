;;; markdown.el -*- lexical-binding: t; -*-

;; text modes
(defun nolinum (&optional arg)
  (setq display-line-numbers nil))

(defun txt-mode (&optional arg)
  (nolinum)
  (visual-fill-column-mode)
  (variable-pitch-mode))

(setq markdown-bullets-bullet-list '("•" "∴" "∵" "⁘" "⁙")
      markdown-header-scaling t
      markdown-command "markdown | smartypants")

(add-hook!    '(markdown-mode-hook)               '(markdown-bullets-mode))
(add-hook!    '(markdown-mode-hook org-mode-hook) '(nolinum visual-fill-column-mode valign-mode))
;; (add-hook!    '(markdown-mode-hook org-mode-hook) '(nolinum visual-fill-column-mode variable-pitch-mode valign-mode))

(setq-default visual-fill-column-center-text t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . gfm-mode))
;; (add-to-list 'auto-minor-mode-alist '("\\.txt\\'" . txt-mode))

(defvar markdown-bullets--keywords
  '(("^\\(#+\\) "
     (1 (prog1 nil
          (let* ((beg (match-beginning 1))
                 (end (match-end 1)))
                 ;; (end-1 (1- end)))
            ;; ### Heading 3
            ;;   ✸
            (compose-region beg end (markdown-bullets--level-char (- end beg)))))))))
            ;; (compose-region end-1 end (markdown-bullets--level-char (- end beg)))
            ;; (compose-region beg end-1 (string-to-char " "))))))))

(map! :map 'gfm-mode-map :m "g TAB" 'markdown-up-list)
