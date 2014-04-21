;; Defines appearance tweaks for my Emacs configuration.
;; An appearance tweak for the purpose of organization is defined as something that changes the main frame (not the modeline)
;; of Emacs for a purely visual (non-utilitarian) purpose.
;; NOTE: Should be included relatively early in init.el so change isn't seen.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Things I don't use that take up screen real estate.
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Set the default theme.
(load-theme 'zenburn t)
;; Size 17 normal Inconsolata.
(set-face-font 'default "-unknown-Inconsolata-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
