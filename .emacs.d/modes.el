;; Mode configuration for my Emacs config
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Smartparens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)

;; Markdown mode
(defun general-markdown-hook ()
  (flyspell-mode 1))

(add-hook 'markdown-mode 'general-markdown-hook)
(add-hook 'gfm-mode 'general-markdown-hook)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;; Processing mode
(setq processing-location "/usr/bin/processing-java")
(setq processing-application-dir "/usr/share/processing")
(setq processing-sketchbook-dir "/home/jack/sketchbook")
(setq processing-output-dir "/tmp")

;; Projectile
(add-hook 'c-mode-common-hook 'projectile-mode)
(add-hook 'python-mode-hook 'projectile-mode)
(add-hook 'rust-mode-hook 'projectile-mode)

(defconst SPELL-CHECK-MODE-HOOKS '(markdown-mode-hook org-mode-hook))

(dolist (hook SPELL-CHECK-MODE-HOOKS)
  (add-hook hook 'flyspell-mode))


