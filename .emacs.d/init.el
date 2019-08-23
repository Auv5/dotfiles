;; Root file for my Emacs configuration - Mostly delegates to other files.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Remove the startup screen.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)

;; Add the home folder to the load-path? Currently not needed.
;; (add-to-list 'load-path "~/.emacs.d")

;; Packaging administration stuff.
(load "~/.emacs.d/packaging.el")

;; Core utility defuns
(load "~/.emacs.d/defuns.el")

;; Apperance tweaks
(load "~/.emacs.d/appearance.el")

;; Modeline tweaks
(load "~/.emacs.d/modeline.el")

;; Commands/keybinds
(load "~/.emacs.d/commands.el")

;; Code style
(load "~/.emacs.d/style.el")

;; Autocompletion of any kind (Ido, Smex, Auto-Complete.el)
(load "~/.emacs.d/completion.el")

(load "~/.emacs.d/modes.el")

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode helm-codesearch fzf helm-projectile zenburn-theme smex smartparens rust-mode projectile processing-mode markdown-mode magit cmake-mode auto-complete ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
