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

(setq org-tag-alist '(("@OFFICE" . ?o)
                      ("@HOME"   . ?h)
                      ("@DEV"    . ?d)))
;; or add org file top
;; #+TAGS: @OFFICE(o) @HOME(h) @DEV(d)
;; etc example)
;; #+TAGS: { @OFFICE(o) @HOME(h) } COMPUTER(c) PHONE(p) READING(r)
;; C-c -c : 태그 추가


;; C-c C-e : 내보내기 메뉴
