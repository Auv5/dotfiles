(setq-default c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

;; Backup file location
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Turn off annoying bell
(setq visible-bell nil
      ring-bell-function 'do-nothing)

(defun do-nothing ())

(setq-default fill-column 80)
