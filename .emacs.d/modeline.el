;; Modeline tweaks for my Emacs configuration.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

(column-number-mode 1)

;; Set up how the individual parts of the modeline should look.
(setq-default mode-line-modified '(:eval (if (buffer-file-name) (if (file-exists-p (buffer-file-name)) (if (buffer-modified-p) " (Modified) " " (Unmodified) ") " (New) ") "")))
(setq-default mode-line-modes mode-name)

;; Yellow if column > 80, red if column > 100
(setq-default mode-line-position '(:eval (if (< (current-column) 80) "%c" (if (> (current-column) 100) (propertize "%c" 'face '((foreground-color . "red"))) (propertize "%c" 'face '((foreground-color . "yellow")))))))

(setq mode-line-align-left '("%e" mode-line-front-space mode-line-client mode-line-buffer-identification mode-line-modified))
;; For some reason there must be an empty space at the beginning or the position disappears.
(setq mode-line-align-right '("" mode-line-position (vc-mode vc-mode)))

;; source: Emacs Powerline (https://github.com/milkypostman/powerline)
(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))
;; end source


;; Actually set the mode line using the variables above.
;; This will right-align the text in mode-line-align-right with three spaces of padding on the right.
(setq-default mode-line-format (list
   mode-line-align-left
   (mode-line-fill 'mode-line (+ 3 (length (format-mode-line mode-line-align-right))))
   mode-line-align-right
   )
)
