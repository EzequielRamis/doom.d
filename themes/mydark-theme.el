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
   (cursor :background blue)))
