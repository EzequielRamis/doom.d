(setq ledger-binary-path "hledger"
      ledger-mode-should-check-version nil
      ledger-report-auto-width nil
      ledger-report-links-in-register nil
      ledger-report-native-highlighting-arguments '("--color=always"))
(add-to-list 'auto-mode-alist '("\\.hledger\\'" . ledger-mode))

;; (set-formatter! 'hledger-format '("hledger-fmt" "--no-diff" "-") :modes '(ledger-mode))

(add-hook 'ledger-mode-hook (lambda () (copilot-mode -1)))
