;; Anything related to string completion in Emacs.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Ido - Complete file names in file open dialog.
(ido-mode 1)

;; Smex - Ido-style autocomplete for M-x.
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-S-x") 'smex-major-mode-commands)
