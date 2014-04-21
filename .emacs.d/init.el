;; Root file for my Emacs configuration - Mostly delegates to other files.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Initialize the Emacs package manager and load some repos.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; TODO: Test this on Emacs 23 or earlier.
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Remove the startup screen.
(setq inhibit-startup-message t)

;; Add the home folder to the load-path? Currently not needed.
;; (add-to-list 'load-path "~/.emacs.d")

;; Core utility defuns
(load "~/.emacs.d/defuns.el")

;; Apperance tweaks
(load "~/.emacs.d/appearance.el")

;; Modeline tweaks
(load "~/.emacs.d/modeline.el")

;; Commands/keybinds
(load "~/.emacs.d/commands.el")

;; Autocompletion of any kind (Ido, Smex, Auto-Complete.el)
(load "~/.emacs.d/completion.el")
