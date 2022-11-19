;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ezequiel Ramis"
      user-mail-address "ezequielramis.hello@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SFMono Nerd Font" :size 18)
      doom-emoji-fallback-font-families '("Twitter Color Emoji")
      doom-variable-pitch-font (font-spec :family "sans" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(defun theme-is-dark-p ()
  (car (read-from-string
        (shell-command-to-string "theme_is_dark && echo -n t || echo -n nil"))))

(defun sync-theme-light ()
  (setq doom-theme 'mylight)
  (doom-init-theme-h))
(defun sync-theme-dark ()
  (setq doom-theme 'mydark)
  (doom-init-theme-h))

(add-load-path! "~/.local/share/dotfiles")
(require 'dash)
(if (and (-contains-p (custom-available-themes) 'mydark)
         (-contains-p (custom-available-themes) 'mylight))
  (if (theme-is-dark-p)
    (setq doom-theme 'mydark)
    (setq doom-theme 'mylight))
 (setq doom-theme 'doom-one))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq +doom-quit-messages '(
                            ;; from Doom 1
                            "Please don't leave, there's more demons to toast!"
                            "I wouldn't leave if I were you. DOS is much worse."
                            "Don't leave yet -- There's a demon around that corner!"
                            "Ya know, next time you come in here I'm gonna toast ya."
                            "Go ahead and leave. See if I care."
                            "Are you sure you want to quit this great editor?"
                            ;; from Portal
                            "Thank you for participating in this Aperture Science computer-aided enrichment activity."
                            "You can't fire me, I quit!"
                            "I don't know what you think you are doing, but I don't like it. I want you to stop."
                            "This isn't brave. It's murder. What did I ever do to you?"
                            "I'm the man who's going to burn your house down! With the lemons!"
                            "Okay, look. We've both said a lot of things you're going to regret..."
                            ;; Custom
                            "Emacs will remember that."
                            "Hey! Hey, M-x listen!"
                            "It's not like I'll miss you or anything, b-baka!"
                            "You are *not* prepared!"
                            "Please don't go. The drones need you. They look up to you."
                            ;; Franquito
                            "Chau, te vas, TE VAS... Púmbate *Elefantito de Simón*"
                            "¡No hermano! No me sirve, no me sirve... *PUM PUM PUM*"
                            "Solidaridad, para Andy que se va... Solidaridad para Andy que se va..."
                            "Me chupa un huevo... Me chupa tres huevos, no uno, me chupa tres huevos."
                            "*Seña de rajar* Chau... Abandona la casa, eh? Abandona la casa... Basta papá."
                            "Saludos desde Nueva York, Mica Bezona."
                            "*Toma mate, luego de una pausa* ¿Qué me importa? *Toma mate de vuelta*"
                            "A llorar a la llorería."
                            "*Elefantito de Simón triste*"))        

;; NOTE Begin - Treemacs icons fix
(setq doom-themes-treemacs-theme "doom-colors")
;; NOTE End - Treemacs icons fix

;; NOTE Begin - Lisp dialects without lisp-mode
(add-to-list 'auto-mode-alist '("\\.yuck\\'" . lisp-mode))
;; NOTE End - Lisp dialects without lisp-mode

;; NOTE Begin - Haskell fixes

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

;; NOTE End - Haskell fixes

;; NOTE Begin - Daemon fixes
(eval-after-load "workspaces"
 '(defun +workspaces-associate-frame-fn (frame &optional _new-frame-p)
   "Create a blank, new perspective and associate it with FRAME."
   (when persp-mode
     (if (not (persp-frame-list-without-daemon))
      (+workspace-switch +workspaces-main t)
      (with-selected-frame frame
        (print (car (+workspace-list-names)))
        ;; (+workspace-switch (format "#%s" (+workspace--generate-id)) t)
        (+workspace-switch (car (+workspace-list-names)) t)
        (unless (doom-real-buffer-p (current-buffer))
          (switch-to-buffer (doom-fallback-buffer)))
        (set-frame-parameter frame 'workspace (+workspace-current-name))
        ;; ensure every buffer has a buffer-predicate
        (persp-set-frame-buffer-predicate frame))
      (run-at-time 0.1 nil #'+workspace/display)))))
;; NOTE End - Daemon fixes

;; from https://github.com/idris-community/idris2-mode
(add-load-path! "~/.emacs.d/idris2-mode/")
(require 'idris2-mode)

;; Fixes lag when editing idris code with evil
(defun ~/evil-motion-range--wrapper (fn &rest args)
  "Like `evil-motion-range', but override field-beginning for performance.
See URL `https://github.com/ProofGeneral/PG/issues/427'."
  (cl-letf (((symbol-function 'field-beginning)
             (lambda (&rest args) 1)))
    (apply fn args)))
(advice-add #'evil-motion-range :around #'~/evil-motion-range--wrapper)

(require 'poly-astro)
(defun astro-mode (&optional arg)
  (setq tab-width 4))

;; (add-to-list 'auto-mode-alist '("\\.astro\\'" . poly-astro))
;; (add-to-list 'auto-minor-mode-alist '("\\.astro\\'" . astro-mode))

;; fix for <style is:global> case
(define-auto-innermode poly-astro-style-tag-lang-innermode
  :head-matcher "<[[:space:]]*style[[:space:]]*.*lang=[[:space:]]*[\"'][[:space:]]*[[:alpha:]]+[[:space:]]*[\"'][[:space:]]*.*>\n"
  :tail-matcher "</[[:space:]]*style[[:space:]]*[[:space:]]*>"
  :mode-matcher (cons  "<[[:space:]]*style[[:space:]]*.*lang=[[:space:]]*[\"'][[:space:]]*\\([[:alpha:]]+\\)[[:space:]]*[\"'][[:space:]]*.*>" 1)
  :head-mode 'host
  :tail-mode 'host
  :body-indent-offset 2)

(define-innermode poly-astro-script-innermode
  :mode 'js-mode
  :head-matcher "<[[:space:]]*script[[:space:]]*.*[[:space:]]*>\n"
  :tail-matcher "</[[:space:]]*script[[:space:]]*.*[[:space:]]*>"
  :head-mode 'host
  :tail-mode 'host
  :body-indent-offset 2)

(define-polymode poly-astro
  :hostmode 'poly-astro-hostmode
  :innermodes '(poly-astro-fm-innermode
                poly-astro-style-tag-lang-innermode
                poly-astro-style-innermode
                poly-astro-script-innermode))

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
(add-hook!    '(markdown-mode-hook org-mode-hook) '(nolinum visual-fill-column-mode variable-pitch-mode valign-mode))

(setq-default visual-fill-column-center-text t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . gfm-mode))
(add-to-list 'auto-minor-mode-alist '("\\.txt\\'" . txt-mode))

(setq vterm-clear-scrollback-when-clearing t)

(require 'pdf-tools)
(use-package pdf-occur
    :commands (pdf-occur-global-minor-mode))
(use-package pdf-history
  :commands (pdf-history-minor-mode))
(use-package pdf-links
  :commands (pdf-links-minor-mode))
(use-package pdf-outline
  :commands (pdf-outline-minor-mode))
(use-package pdf-annot
  :commands (pdf-annot-minor-mode))
(use-package pdf-sync
  :commands (pdf-sync-minor-mode))

(use-package! pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :init
  (after! pdf-annot
    (defun +pdf-cleanup-windows-h ()
      "Kill left-over annotation buffers when the document is killed."
      (when (buffer-live-p pdf-annot-list-document-buffer)
        (pdf-info-close pdf-annot-list-document-buffer))
      (when (buffer-live-p pdf-annot-list-buffer)
        (kill-buffer pdf-annot-list-buffer))
      (let ((contents-buffer (get-buffer "*Contents*")))
        (when (and contents-buffer (buffer-live-p contents-buffer))
          (kill-buffer contents-buffer))))
    (add-hook! 'pdf-view-mode-hook
      (add-hook 'kill-buffer-hook #'+pdf-cleanup-windows-h nil t)))

  :config
  ;; (defadvice! +pdf--install-epdfinfo-a (fn &rest args)
  ;;   "Install epdfinfo after the first PDF file, if needed."
  ;;   :around #'pdf-view-mode
  ;;   (if (and (require 'pdf-info nil t)
  ;;            (or (pdf-info-running-p)
  ;;                (ignore-errors (pdf-info-check-epdfinfo) t)))
  ;;       (apply fn args)
  ;;     ;; If we remain in pdf-view-mode, it'll spit out cryptic errors. This
  ;;     ;; graceful failure is better UX.
  ;;     (fundamental-mode)
  ;;     (message "Viewing PDFs in Emacs requires epdfinfo. Use `M-x pdf-tools-install' to build it")))

  ;; Despite its namesake, this does not call `pdf-tools-install', it only sets
  ;; up hooks, auto-mode-alist/magic-mode-alist entries, global modes, and
  ;; refreshes pdf-view-mode buffers, if any.
  ;;
  ;; I avoid calling `pdf-tools-install' directly because `pdf-tools' is easy to
  ;; prematurely load in the background (e.g. when exporting an org file or by
  ;; packages like org-pdftools). And I don't want pdf-tools to suddenly block
  ;; Emacs and spew out compiler output for a few minutes in those cases. It's
  ;; abysmal UX. The `pdf-view-mode' advice above works around this with a less
  ;; cryptic failure message, at least.
  (pdf-tools-install-noverify)

  ;; For consistency with other special modes
  (map! :map pdf-view-mode-map :gn "q" #'kill-current-buffer)

  (setq-default pdf-view-display-size 'fit-page)
  ;; Enable hiDPI support, but at the cost of memory! See politza/pdf-tools#51
  (setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil)

  ;; Handle PDF-tools related popups better
  (set-popup-rules!
    '(("^\\*Outline*" :side right :size 40 :select nil)
      ("^\\*Edit Annotation " :quit nil)
      ("\\(?:^\\*Contents\\|'s annots\\*$\\)" :ignore t)))

  ;; The mode-line does serve any useful purpose is annotation windows
  (add-hook 'pdf-annot-list-mode-hook #'hide-mode-line-mode)

  ;; HACK Fix #1107: flickering pdfs when evil-mode is enabled
  (setq-hook! 'pdf-view-mode-hook evil-normal-state-cursor (list nil))

  ;; HACK Refresh FG/BG for pdfs when `pdf-view-midnight-colors' is changed by a
  ;;      theme or with `setq!'.
  ;; TODO PR this upstream?
  (defun +pdf-reload-midnight-minor-mode-h ()
    (when pdf-view-midnight-minor-mode
      (pdf-info-setoptions
       :render/foreground (car pdf-view-midnight-colors)
       :render/background (cdr pdf-view-midnight-colors)
       :render/usecolors t)
      (pdf-cache-clear-images)
      (pdf-view-redisplay t)))
  (put 'pdf-view-midnight-colors 'custom-set
       (lambda (sym value)
         (set-default sym value)
         (dolist (buffer (doom-buffers-in-mode 'pdf-view-mode))
           (with-current-buffer buffer
             (if (get-buffer-window buffer)
                 (+pdf-reload-midnight-minor-mode-h)
               ;; Defer refresh for buffers that aren't visible, to avoid
               ;; blocking Emacs for too long while changing themes.
               (add-hook 'doom-switch-buffer-hook #'+pdf-reload-midnight-minor-mode-h
                         nil 'local))))))

  ;; Silence "File *.pdf is large (X MiB), really open?" prompts for pdfs
  (defadvice! +pdf-suppress-large-file-prompts-a (fn size op-type filename &optional offer-raw)
    :around #'abort-if-file-too-large
    (unless (string-match-p "\\.pdf\\'" filename)
      (funcall fn size op-type filename offer-raw))))

(use-package! saveplace-pdf-view
  :after pdf-view)

(setq-default TeX-master 'shared)

(setq TeX-view-program-selection '((output-pdf "Zathura"))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(add-hook 'LaTeX-mode-hook
  (lambda ()
    (add-hook 'after-save-hook
     (lambda () (TeX-command "LatexMk" #'TeX-master-file)))))

;; (require 'pdf-continuous-scroll-mode)
;; (setq pdf-continuous-suppress-introduction t)
(setq which-key-allow-imprecise-window-fit nil)

(defvar markdown-bullets--keywords
  '(("^\\(#+\\) "
     (1 (prog1 nil
          (let* ((beg (match-beginning 1))
                 (end (match-end 1))
                 (end-1 (1- end)))
            ;; ### Heading 3
            ;;   ✸
            (compose-region end-1 end (markdown-bullets--level-char (- end beg)))
            (compose-region beg end-1 (string-to-char " "))))))))

(setq-default evil-kill-on-visual-paste nil)

(defun evil-change-from-nil ()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-change)))

(defun evil-change-line-from-nil ()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-change-line)))

(define-key evil-normal-state-map (kbd "c") 'evil-change-from-nil)
(define-key evil-normal-state-map (kbd "C") 'evil-change-line-from-nil)
