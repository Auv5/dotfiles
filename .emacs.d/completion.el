;; Anything related to string completion in Emacs.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Ido - Complete file names in file open dialog.
(ido-mode 1)

;; Smex - Ido-style autocomplete for M-x.
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-S-x") 'smex-major-mode-commands)

;; Auto-Complete.el completion in code buffers.
(require 'auto-complete)
(require 'auto-complete-config)
(setq ac-ignore-case nil)
(ac-config-default)

;; Save a couple characters with y-or-n instead of yes-or-no.
(defalias 'yes-or-no-p 'y-or-n-p)

(setq projectile-project-search-path '())

(setq projectile-enable-caching t)
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(global-set-key [(control ?x) (control ?f)] (quote helm-find-files))
(global-set-key [(control ?x) (?b)] (quote helm-buffers-list))
(global-set-key [(control ?x) (control ?b)] (quote helm-buffers-list))

;; (require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)

(require 'helm-config)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
