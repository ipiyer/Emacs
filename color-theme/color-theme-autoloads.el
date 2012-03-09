;;; -*-emacs-lisp-*-

;; Copyright (C) 2002 Free Software Foundation, Inc.

(defvar generated-autoload-file)
(defvar command-line-args-left)
(defun color-theme-generate-autoloads ()
  (interactive)
  (require 'autoload)
  (setq generated-autoload-file (car command-line-args-left))
  (setq command-line-args-left (cdr command-line-args-left))
  (batch-update-autoloads))

(provide 'color-theme-autoloads)
;;; Generated autoloads follow (made by autoload.el).

;;;### (autoloads nil nil ("color-theme.el" "themes/color-theme-example.el"
;;;;;;  "themes/color-theme-library.el") (19460 64618 716718))

;;;***
