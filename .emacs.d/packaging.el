;; Packaging configuration for my Emacs configuration.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Initialize the Emacs package manager and load some repos.
(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")))

(if (< emacs-major-version 24)
    (progn 
      (add-to-list 'load-path "~/.emacs.d/packages")
      (require 'package)))

(package-initialize)

(defconst PACKAGES-TO-INSTALL                '(zenburn-theme smex
					      auto-complete cmake-mode
					      smartparens ag
					      projectile markdown-mode
					      processing-mode magit
                                              rust-mode))

(setq need-update-packages nil)

(dolist (package PACKAGES-TO-INSTALL) 
  (progn
    (if (not (package-installed-p package)) (setq need-update-packages t))))

(if need-update-packages 
    (progn
      (package-refresh-contents)
      (dolist (package PACKAGES-TO-INSTALL) 
	(progn
	  (message (concat "Installing " (symbol-name package)))
	  (condition-case nil
	      (if (not (package-installed-p package)) (package-install package))
	    (error nil))))))
