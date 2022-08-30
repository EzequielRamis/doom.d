;;; mydark-theme.el -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)
(require 'mypalette)

(def-doom-theme mydark
  "My custom dark theme"
  ((bg        (-map 'eval '(palette0F "black"       "black")))
   (bg-alt    (-map 'eval '(palette0D "black"       "black")))
   (base0     (-map 'eval '(palette0F "black"       "black")))
   (base1     (-map 'eval '(palette0D "brightblack" "brightblack")))
   (base2     (-map 'eval '(palette0B "brightblack" "brightblack")))
   (base3     (-map 'eval '(palette09 "brightblack" "brightblack")))
   (base4     (-map 'eval '(palette08 "brightblack" "brightblack")))
   (base5     (-map 'eval '(palette07 "brightblack" "brightblack")))
   (base6     (-map 'eval '(palette05 "brightblack" "brightblack")))
   (base7     (-map 'eval '(palette03 "brightblack" "brightblack")))
   (base8     (-map 'eval '(palette01 "white"       "white")))
   (fg        (-map 'eval '(palette02 "white"       "white")))
   (fg-alt    (-map 'eval '(palette63 "white"       "white")))

   (grey                base4)
   (red                 (-map 'eval '(palette15 "red" "red")))
   (orange              (-map 'eval '(palette24 "brightred" "brightred")))
   (green               (-map 'eval '(palette43 "green" "green")))
   (teal                (-map 'eval '(palette43 "brightgreen" "brightgreen")))
   (yellow              (-map 'eval '(palette33 "yellow" "yellow")))
   (blue                (-map 'eval '(palette65 "brightblue" "brightblue")))
   (dark-blue           (-map 'eval '(palette67 "blue" "blue")))
   (magenta             (-map 'eval '(palette73 "brightmagenta" "brightmagenta")))
   (violet              (-map 'eval '(palette75 "magenta" "magenta")))
   (cyan                (-map 'eval '(palette54 "brightcyan" "brightcyan")))
   (dark-cyan           (-map 'eval '(palette55 "cyan" "cyan")))

   ; These are the "universal syntax classes" that doom-themes establishes.
   ; These *must* be included in every doom themes, or your theme will throw an
   ; error, as they are used in the base theme defined in doom-themes-base.
   (highlight    blue)
   (vertical-bar base0)
   (selection    base1)
   (builtin      magenta)
   (comments     base5)
   (doc-comments base4)
   (constants    violet)
   (functions    magenta)
   (keywords     blue)
   (methods      violet)
   (operators    magenta)
   (type         teal)
   (strings      green)
   (variables    fg-alt)
   (numbers      orange)
   (region       base2)
   (error        red)
   (warning      yellow)
   (success      green)
   (vc-modified  yellow)
   (vc-added     green)
   (vc-deleted   red))

  ((lsp-face-highlight-textual :background base2 :foreground fg-alt :distant-background bg-alt)
   (cursor :background blue)
   (diff-removed                    :foreground red :background palette1F)
   (diff-indicator-removed          :foreground red :background palette1E)
   (magit-diff-removed              :foreground red :background palette1F)
   (magit-diff-our-highlight        :foreground red :background palette1E :weight 'bold)
   (magit-diff-removed-highlight    :foreground red :background palette1E :weight 'bold)
   (diff-refine-removed             :foreground bg-alt :background red :weight 'bold)
   (whitespace-tab                  :foreground base3 :background bg)

   (markdown-code-face               :inherit 'fixed-pitch :foreground strings)
   (markdown-inline-code-face        :inherit 'fixed-pitch :foreground strings)
   (markdown-html-entity-face        :inherit 'fixed-pitch :foreground blue)
   (markdown-html-tag-name-face      :inherit 'fixed-pitch :foreground dark-blue)
   (markdown-html-tag-delimiter-face :inherit 'fixed-pitch :foreground blue)
   (markdown-html-attr-name-face     :inherit 'fixed-pitch :foreground magenta)
   (markdown-html-attr-value-face    :inherit 'fixed-pitch :foreground strings)
   (markdown-math-face               :inherit 'fixed-pitch :foreground strings)
   (org-verbatim                     :inherit 'fixed-pitch :foreground strings)
   (org-code                         :inherit 'fixed-pitch :foreground orange)
   (org-block                        :inherit 'fixed-pitch :background bg-alt :extend t)
   (org-block-begin-line             :inherit 'fixed-pitch :background bg-alt :foreground comments :extend t)
   (org-block-end-line               :inherit 'fixed-pitch :background bg-alt :foreground comments :extend t)
   (org-inline-src-block             :inherit 'fixed-pitch :background bg-alt :foreground comments)
   (org-table                        :inherit 'fixed-pitch :foreground builtin)
   (org-table-header                 :inherit 'fixed-pitch :foreground builtin)
   (org-meta-line                    :foreground comments)
   (org-tag                          :inherit 'fixed-pitch :foreground doc-comments)
   (org-tag-group                    :inherit 'fixed-pitch :foreground doc-comments)))
