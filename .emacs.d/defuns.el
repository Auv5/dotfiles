;; Defuns that can be used anywhere in the configuration. Note that these are non-interactive functions,
;; and thus not the same as those in commands.el.

;; source: ScottVokes on EmacsWiki (http://www.emacswiki.org/emacs/SetFonts)
;; All of EmacsWiki is licensed under GPL v2 (which is compatible with GPL v3), so this declaration should be enough.
;; TODO: Test this on Windows.
(defun font-existsp (font)
    (if (null (x-list-fonts font))
        nil t))
