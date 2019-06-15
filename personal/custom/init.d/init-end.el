(provide 'init-end)
;;; init-end.el --- autuln's configuration entry point.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; start emacs server

 (defconst elisp-dir "~/.emacs.d/personal/custom/elisp.d/")

(require 'req-package)
(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one elisp-dir)
  (req-package-finish)
  (funcall 'select-theme))

;; (load "~/.emacs.d/personal/custom/init.d/init-bindings.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
