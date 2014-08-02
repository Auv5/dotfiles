;; Packaging configuration for my Emacs configuration.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; Initialize the Emacs package manager and load some repos.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; TODO: Test this on Emacs 23 or earlier.
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(defconst PACKAGES-TO-INSTALL                '(zenburn-theme smex
					      auto-complete cmake-mode
					      smartparens ag
					      enh-ruby-mode textmate
					      rinari rhtml-mode
					      markdown-mode flycheck
					      pydoc-info web-mode))

(setq need-update-packages nil)

(dolist (package PACKAGES-TO-INSTALL) 
  (if (not (package-installed-p package)) (setq need-update-packages t)))

(if need-update-packages 
    (progn
      (package-refresh-contents)
      (dolist (package PACKAGES-TO-INSTALL) 
	(if (not (package-installed-p package)) (package-install package)))))
 
