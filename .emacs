;; ~/.emacs@foobar - Prashanth <munichlinux@gmail.com> -*- emacs-lisp -*-
;; Time-stamp: "2012-02-12 17:25:03 prashanthgopinath"

;; ---------------------
;; General Customisation
;; ---------------------
(defvar *home-dir* "/Users/prashanthgopinath/")

(setq inhibit-startup-message t)
(add-to-list 'load-path (concat *home-dir* ".emacs.d/"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/color-theme"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/git-emacs"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/yasnippet"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/lisp"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/git-emacs"))
(add-to-list 'load-path (concat *home-dir* ".emacs.d/jade-mode"))

(setq font-lock-maximum-decoration t)
(setq require-final-newline t)
(setq resize-minibuffer-frame t)
(setq column-number-mode t)
(setq-default transient-mark-mode t)
(setq next-line-add-newlines nil)
(setq blink-matching-paren t)
(setq blink-matching-delay .25)
(global-font-lock-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(show-paren-mode t)
(set-scroll-bar-mode 'nil)
(savehist-mode 1)
(setq truncate-partial-width-windows nil)
(setq x-select-enable-clipboard t)

;; ----------------------
;; Final newline handling
;; ----------------------
(setq require-final-newline t)
(setq next-line-extends-end-of-buffer nil)
(setq next-line-add-newlines nil)

;; -------------------
;; Everything in UTF-8
;; -------------------
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)
(set-default-coding-systems             'utf-8)
(setq file-name-coding-system           'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq coding-system-for-write           'utf-8)
(set-keyboard-coding-system             'utf-8)
(set-terminal-coding-system             'utf-8)
(set-clipboard-coding-system            'utf-8)
(set-selection-coding-system            'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq mac-allow-anti-aliasing nil)
(set-frame-font "-apple-inconsolata-medium-r-normal--19-120-172-172-m-120-iso10646-1")

;; -----------
;; Frame Setup
;; -----------
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; ---------
;; TAB Setup
;; ---------

(setq-default tab-width 4
              standard-indent 4
              indent-tabs-mode nil
              tab-width 8)


;; -----------------
;; Insert time stamp
;; -----------------

(defun insert-date ()
  "Insert current date and time."
  (interactive "*")
  (insert (current-time-string)))

;; ----------------------------------------
;; Kill current buffer without confirmation
;; ----------------------------------------

(global-set-key "\C-xk" 'kill-current-buffer)
(defun kill-current-buffer ()
  "Kill the current buffer, without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))



;; -------------
;; Custom colors
;; -------------

(require 'color-theme)
(color-theme-clarity)

;; --------------------
;; Several useful hooks
;; --------------------
(add-hook 'before-save-hook 'time-stamp)

;; ------
;; Python
;; ------

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq-default py-indent-offset 4)

(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)
                               (setq-default py-indent-offset 1)))

(defvar python-indent-offset 1
"*Indentation increment in Python mode")

;;;;;;;;;;;;
;;java script
;;;;;;;;;;;

;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


(require 'ido)
(ido-mode t)

;;;
;Template
;;


(require 'template)
(template-initialize)


 (require 'uniquify)

 (setq uniquify-buffer-name-style 'forward)



;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
   [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-cm" 'replace-ctrlms)


(defun mac-toggle-max-window ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))

(global-set-key (kbd "<C-M-return>") 'mac-toggle-max-window)


;;;;;;;
;;YASNIPPET
;;;;;;;




(require 'django-html-mode)
(require 'django-mode)


(autoload 'django-html-mode "django-html-mode")
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . django-html-mode))


(defun django-insert-trans (from to &optional buffer)
 (interactive "*r")
 (save-excursion
   (save-restriction
     (narrow-to-region from to)
     (goto-char from)
     (iso-iso2sgml from to)
     (insert "{% trans \"")
     (goto-char (point-max))
     (insert "\" %}")
     (point-max))))
(defun django-insert-transpy (from to &optional buffer)
 (interactive "*r")
 (save-excursion
   (save-restriction
     (narrow-to-region from to)
     (goto-char from)
     (iso-iso2sgml from to)
     (insert "_(")
     (goto-char (point-max))
     (insert ")")
     (point-max))))
(add-hook 'sgml-mode-hook
        (lambda ()
          (local-set-key "\C-c\C-g" 'django-insert-trans)
          (setq indent-tabs-mode nil)
          ))
(add-hook 'python-mode-hook
        '(lambda ()
           (outline-minor-mode 1)
           (setq
            tab-width 4
            python-indent 4
            outline-regexp py-outline-regexp
            outline-level 'py-outline-level)
           (local-set-key "\C-c\C-t" 'django-insert-transpy)
           ))


(setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)


(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


(global-set-key (kbd "C-x cp") 'my-put-file-name-on-clipboard)




(require 'git-emacs)



(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
