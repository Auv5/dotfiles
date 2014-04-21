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
