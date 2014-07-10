;; Initialize the Emacs package manager and load some repos.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; TODO: Test this on Emacs 23 or earlier.
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(defconst PACKAGES-TO-INSTALL '(zenburn-theme smex))

(dolist (package PACKAGES-TO-INSTALL) 
  (if (not (package-installed-p package)) (package-install package)))
