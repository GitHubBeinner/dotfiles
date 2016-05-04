;; init.el

;; add lisp to load path

;; (setq url-proxy-services '(("no_proxy" . "work\\.com")
;;                           ("http" . "10.95.103.98:3128")))

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-modeline)
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'idle-require)
(require 'init-elpa) ;; load ELPA
(require 'init-yasnippet) ;; load yasnippet
(require 'init-ido)
(require 'init-smex)
(require 'ace-jump-mode)
(require 'init-orgmode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(require 'magit)

(elpy-enable)

(provide 'init)

;; initial window settings
(setq initial-frame-alist
      '((background-color . "black")))

;; subsequent window settings
(setq default-frame-alist
      '((background-color . "black")))

(load-theme 'wombat t)



;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
;;(defconst emacs-tmp-dir (format "%s/%s/" temporary-file-directory  "emacs" ))
(defconst emacs-tmp-dir (format "~/.%s.tmp/" "emacs" ))
(setq backup-directory-alist
    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
    emacs-tmp-dir)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/git-local/chaoswork/work-records/daily-work/workspace/work.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'sql)
(setq sql-mysql-login-params (append sql-mysql-login-params '(port)))
(defun event-apply-control-shift-modifier (ignore-prompt)
     "\\Add the Control+Shift modifier to the following event.
 For example, type \\[event-apply-control-shift-modifier] SPC to enter Control-Shift-SPC."
     (vector (event-apply-modifier
 	     (event-apply-modifier (read-event) 'shift 25 "S-")
 	     'control 26 "C-")))
 (define-key function-key-map (kbd "C-x @ C") 'event-apply-control-shift-modifier)
;(global-set-key (kbd "<return>") (kbd "RET") )
(global-set-key  (kbd "C-RET") (kbd "C-<return>"))
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

