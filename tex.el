;;; tex.el -*- lexical-binding: t; -*-

(setq-default TeX-master 'shared)

(setq TeX-view-program-selection '((output-pdf "Zathura"))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(add-hook 'LaTeX-mode-hook
  (lambda ()
    (add-hook 'after-save-hook
     (lambda () (TeX-command "LatexMk" #'TeX-master-file)))))
