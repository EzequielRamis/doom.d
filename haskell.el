;;; haskell.el -*- lexical-binding: t; -*-

;; fix to .cabal from https://github.com/doomemacs/doomemacs/issues/5147#issuecomment-874682852
;; (after! format-all
;;    (advice-add 'format-all-buffer :around #'envrc-propagate-environment))

;; from https://github.com/ch1bo/dotfiles/blob/master/emacs/doom.d/config.el
;; https://github.com/haskell/haskell-language-server/issues/2457
(after! lsp-haskell (add-to-list 'lsp-haskell-server-args "-j2"))

;; TODO(SN): this is necessary as format-all-mode / format-all-buffer--from-hook
;; advice is not :override and had been broken the +onsave feature. So waiting
;; for that :editor format rewrite...
(defun add-autoformat-hook ()
  (add-hook 'before-save-hook '+format-buffer-h nil 'local))
(add-hook! (haskell-mode haskell-cabal-mode) 'add-autoformat-hook)

;; Configure formatter when using +format-with-lsp
;;
;; NOTE This is intentionally set early, as options are only picked up by the
;; haskell LS when (re-)starting.
;; (setq lsp-haskell-formatting-provider "stylish-haskell")
;; (setq lsp-haskell-formatting-provider "brittany")
;; (setq lsp-haskell-formatting-provider "none")
(setq lsp-haskell-formatting-provider "ormolu")

;; Use 'cabal-fmt' for .cabal files
(set-formatter! 'cabal-fmt "cabal-fmt"
 :modes 'haskell-cabal-mode)

;; TODO How to organize formatters? brittany is default, and switching using
;; config updates is annoying. Also, tools are not picked up from nix-shells

;; Use 'ormolu' as formatter.
(set-formatter! 'ormolu "ormolu"
  :modes 'haskell-mode
  :filter
  (lambda (output errput)
    (list output
          (replace-regexp-in-string "Loaded config from:[^\n]*\n*" "" errput))))

;; Use 'stylish-haskell' as formatter.
;;
;; NOTE Call stylish-haskell directly instead of the
;; 'haskell-mode-stylish-buffer command as I am still a bit puzzled why the
;; latter does not pick up the projects .stylish-haskell.yaml.
;; (set-formatter! 'stylish-haskell "stylish-haskell"
;;   :modes 'haskell-mode)
