;;; modeline.el -*- lexical-binding: t; -*-

(after! doom-modeline

  (setq doom-modeline-buffer-state-icon nil
        doom-modeline-modal-icon nil
        doom-modeline-height 28
        doom-modeline-bar-width 1
        doom-modeline-percent-position '(0 ""))

  (doom-modeline-def-segment modals
    "Displays modal editing states.

Including `evil', `overwrite', `god', `ryo' and `xha-fly-kyes', etc."
    (when doom-modeline-modal
      (let* ((evil (doom-modeline--evil))
             (ow (doom-modeline--overwrite))
             (god (doom-modeline--god))
             (ryo (doom-modeline--ryo))
             (xf (doom-modeline--xah-fly-keys))
             (boon (doom-modeline--boon))
             (vsep (doom-modeline-vspc))
             (meow (doom-modeline--meow))
             (sep (and (or evil ow god ryo xf boon) (doom-modeline-spc))))
        (concat
                (and evil (concat evil (and (or ow god ryo xf boon meow) vsep)))
                (and ow (concat ow (and (or god ryo xf boon meow) vsep)))
                (and god (concat god (and (or ryo xf boon meow) vsep)))
                (and ryo (concat ryo (and (or xf boon meow) vsep)))
                (and xf (concat xf (and (or boon meow) vsep)))
                (and boon (concat boon (and meow vsep)))
                meow
                sep))))

  (doom-modeline-def-modeline 'main
        '(modals follow buffer-info remote-host buffer-position word-count parrot selection-info)
        '(bar compilation objed-state misc-info persp-name battery grip irc mu4e gnus github debug repl lsp minor-modes input-method indent-info buffer-encoding major-mode process vcs check time))

  (doom-modeline-def-modeline 'minimal
        '(matches buffer-info-simple)
        '(bar media-info major-mode time))

  (doom-modeline-def-modeline 'special
        '(modals matches buffer-info remote-host buffer-position word-count parrot selection-info)
        '(bar compilation objed-state misc-info battery irc-buffers debug minor-modes input-method indent-info buffer-encoding major-mode process time))

  (doom-modeline-def-modeline 'project
        '(modals buffer-default-directory remote-host buffer-position)
        '(bar compilation misc-info battery irc mu4e gnus github debug minor-modes input-method major-mode process time))

  (doom-modeline-def-modeline 'dashboard
        '(buffer-default-directory-simple remote-host)
        '(bar compilation misc-info battery irc mu4e gnus github debug minor-modes input-method major-mode process time))

  (doom-modeline-def-modeline 'vcs
        '(modals matches buffer-info remote-host buffer-position parrot selection-info)
        '(bar compilation misc-info battery irc mu4e gnus github debug minor-modes buffer-encoding major-mode process time))

  (doom-modeline-def-modeline 'package
        '(package)
        '(bar compilation misc-info major-mode process time))

  (doom-modeline-def-modeline 'info
        '(buffer-info info-nodes buffer-position parrot selection-info)
        '(bar compilation misc-info buffer-encoding major-mode time))

  (doom-modeline-def-modeline 'media
        '(buffer-size buffer-info)
        '(bar compilation misc-info media-info major-mode process vcs time))

  (doom-modeline-def-modeline 'message
        '(modals matches buffer-info-simple buffer-position word-count parrot selection-info)
        '(bar compilation objed-state misc-info battery debug minor-modes input-method indent-info buffer-encoding major-mode time))

  (doom-modeline-def-modeline 'pdf
        '(matches buffer-info pdf-pages)
        '(bar compilation  misc-info major-mode process vcs time))

  (doom-modeline-def-modeline 'org-src
        '(modals matches buffer-info buffer-position word-count parrot selection-info)
        '(bar compilation objed-state misc-info debug lsp minor-modes input-method indent-info buffer-encoding major-mode process check time))

  (doom-modeline-def-modeline 'helm
        '(helm-buffer-id helm-number helm-follow helm-prefix-argument)
        '(bar helm-help time))

  (doom-modeline-def-modeline 'timemachine
        '(modals matches git-timemachine buffer-position word-count parrot selection-info)
        '(bar misc-info minor-modes indent-info buffer-encoding major-mode time))

  (doom-modeline-def-modeline 'calculator
        '(modals matches calc buffer-position)
        '(bar misc-info minor-modes major-mode process)))

  ;; (setq header-line-format mode-line-format)
  ;; (setq-default header-line-format mode-line-format)
  ;; (setq mode-line-format nil)
  ;; (setq-default mode-line-format nil))

(setq evil-emacs-state-tag        "  E  "
      evil-visual-char-tag        "  V  "
      evil-visual-line-tag        "  L  "
      evil-visual-block-tag       "  B  "
      evil-normal-state-tag       "  N  "
      evil-insert-state-tag       "  I  "
      evil-motion-state-tag       "  M  "
      evil-replace-state-tag      "  R  "
      evil-operator-state-tag     "  O  "
      evil-visual-screen-line-tag "  S  ")

(setq all-the-icons-scale-factor 1)
