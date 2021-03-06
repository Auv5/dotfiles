;; Defines appearance tweaks for my Emacs configuration.
;; An appearance tweak for the purpose of organization is defined as something that changes the main frame (not the modeline)
;; of Emacs for a purely visual (non-utilitarian) purpose.
;; NOTE: Should be included relatively early in init.el so change isn't seen.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Things I don't use that take up screen real estate.
(if (fboundp 'menu-bar-mode) (menu-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode 0))
;; Make sure we scroll line-by-line.
(setq scroll-step 1)

;; Match parens more visibly
(show-paren-mode 1)

;; Set the default theme.
(load-theme 'zenburn t)
;; Size 17 normal Inconsolata. If the font doesn't exist on this system or we're in a terminal, just
;; let the default be used.
(defconst DEFAULT-FACE-FONT
  "-unknown-Inconsolata-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1")
(if (font-existsp DEFAULT-FACE-FONT) (set-face-font 'default DEFAULT-FACE-FONT))
