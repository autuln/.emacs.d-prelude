(provide 'package-org-mode)
;;; package-org-mode.el --- autuln's configuration entry point.

;;;;;;;;;
;; group: Programming -> Tools -> org

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
;; or add org file top
;; #+TODO: TODO IN-PROGRESS WAITING DONE
;; or add org file top
;; #-*- mode: org -*-
;; #+STARTUP: showall
;; #+TODO: TODO IN-PROGRESS WAITING DONE
