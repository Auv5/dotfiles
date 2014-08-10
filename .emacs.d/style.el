(setq c-default-style "bsd")

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4
				  tab-width 4
				  indent-tabs-mode t)))

(add-hook 'c-mode-hook (lambda ()
			 (setq c-basic-offset 2
			       tab-width 2
			       indent-tabs-mode nil)))

(add-hook 'c++-mode-hook (lambda ()
			   (setq c-basic-offset 4
				 tab-width 4
				 indent-tabs-mode t)))

;; Backup file location
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
