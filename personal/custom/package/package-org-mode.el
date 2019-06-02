(provide 'package-org-mode)
;;; package-org-mode.el --- autuln's configuration entry point.

;;;;;;;;;
;; group: Programming -> Tools -> org

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "TODO(t)" "IN-PROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))
;; or add org file top
;; #+TODO: TODO IN-PROGRESS WAITING DONE
;; or add org file top
;; #-*- mode: org -*-
;; #+STARTUP: showall
;; #+TODO: TODO IN-PROGRESS WAITING DONE

(setq org-tag-alist '(("@OFFICE" . ?o)
                      ("@HOME"   . ?h)
                      ("DEV"     . ?d)))
;; or add org file top
;; #+TAGS: @OFFICE(o) @HOME(h) @DEV(d)
;; etc example)
;; #+TAGS: { @OFFICE(o) @HOME(h) } COMPUTER(c) PHONE(p) READING(r)

;; # shortcut
;; C-c -c : 태그 추가
;; C-c C-e : 내보내기 메뉴

;; # command
;; M-x org-reload : 업데이트 후 org-mode를 다시 불러오기
;; M-x org-version : org-mode 버전 확인하기

;; format
;; #-*- mode: org -*-
;; #+STARTUP: showall
;; #+TITLE: Example .org file
;; #+AUTHOR: autuln
;; #+TAGS: { @OFFICE(o) @HOME(h) } COMPUTER(c) PHONE(p) READING(r)
;; #+FILETAGS: :Peter:Boss:Secret:
;; #+DATE: <2019-06-02 Sun>
;; #+TODO: TODO(t) | DONE(d)
;; #+TODO: REPORT(r) BUG(b) KNOWNCAUSE(k) | FIXED(f)
;; #+TODO: | CANCELED(c)
