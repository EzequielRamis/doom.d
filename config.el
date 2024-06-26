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
(setq doom-font (font-spec :family "LigaSF Mono Nerd Font" :size 18)
      doom-emoji-fallback-font-families '("Twitter Color Emoji")
      doom-variable-pitch-font (font-spec :family "sans" :size 20))

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
(if (theme-is-dark-p)
    (setq doom-theme 'mydark)
  (setq doom-theme 'mylight))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (if (boundp 'doom-theme)
                  (if (theme-is-dark-p)
                      (load-theme 'mydark t)
                    (load-theme 'mylight t))
                (load-theme 'doom-theme t)))))

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

(setq lsp-enable-suggest-server-download nil)

;; (load! "haskell")
(load! "idris")
(load! "ligatures")
(load! "copilot")
(load! "markdown")
(load! "web")
(load! "pdf")
(load! "info")
(load! "modeline")

;; NOTE Begin - Treemacs icons fix
(setq doom-themes-treemacs-theme "doom-colors")
;; NOTE End - Treemacs icons fix

;; NOTE Begin - Lisp dialects without lisp-mode
(add-to-list 'auto-mode-alist '("\\.yuck\\'" . lisp-mode))
;; NOTE End - Lisp dialects without lisp-mode

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

(setq vterm-clear-scrollback-when-clearing t)

;; (require 'pdf-continuous-scroll-mode)
;; (setq pdf-continuous-suppress-introduction t)
(setq which-key-allow-imprecise-window-fit nil)

(setq-default evil-kill-on-visual-paste nil)

(defun evil-change-from-nil ()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-change)))

(defun evil-change-line-from-nil ()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-change-line)))

(map! :n "c" #'evil-change-from-nil)
(map! :n "C" #'evil-change-line-from-nil)
(map! :i "C-v" #'yank)

(map! :im "C-z" nil)

(global-auto-revert-mode t)
(setq auto-revert-interval 0.5)
(setq auto-revert-use-notify t)

(setq
 lsp-lens-enable t
 ;; lsp-headerline-breadcrumb-enable t
 ;; lsp-headerline-breadcrumb-icons-enable t
 lsp-ui-sideline-enable t
 lsp-ui-sideline-show-diagnostics t)

(setq +lsp-company-backends '(:separate company-capf))

(after! flycheck
  (map! :leader
        (:prefix-map ("c" . "code")
                     "x" flycheck-command-map)))

(setq mouse-wheel-progressive-speed nil)

(defun wrap-diff ()
  "Disable `truncate-lines' in the current buffer."
  (setq truncate-lines nil))

(add-hook 'magit-mode-hook #'wrap-diff)
(add-hook 'magit-diff-mode-hook #'wrap-diff)
