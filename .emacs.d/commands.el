;; Commands (and keybinds) for my Emacs configuration.
;; (c) Jack McCracken 2014 under GPL v3 unless otherwise stated. See LICENSE.

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;; Steve doesn't really give a license for his .emacs. I should really rewrite this function.
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Toggle of back to indentation and beginning of line.
(defun conditional-back-to-indent ()
  (interactive)
  (setq initial-point (point))
  (back-to-indentation)
  (if (eq (point) initial-point)
      (move-beginning-of-line nil)))

(setq linum-enabled nil)

(defun toggle-linum-mode ()
  (interactive)
  (setq linum-enabled (not linum-enabled))
  (global-linum-mode (if linum-enabled 1 0))
  (linum-mode (if linum-enabled 1 0)))

;; Bind C-c C-c to linum toggle.
(global-set-key (kbd "C-c C-c") 'toggle-linum-mode)

;; Bind to C-a to replace old beginning-of-line command.
(global-set-key (kbd "C-a") 'conditional-back-to-indent)

;; Quicker keybindings of window manipulation functions.
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-o") 'other-window)

;; Make enter automatically indent
(global-set-key (kbd "RET") 'newline-and-indent)
