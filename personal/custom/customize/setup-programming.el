(provide 'setup-programming)
;; group: Programing -> Languages -> C

;; 사용가능한 C 스타일:
;; 'gnu': GNU 프로젝트를 위한 기본 스타일
;; "K&r": C의 저자들이 그들의 책에서 사용한, Kernighan 와 Ritchie라는 것.
;; "bsd": Eric Allman 후에 일명 "Allman 스타일"이란, BSD 개발자들이 사용하는 것
;; "whitesmith": 초기 상업용 C 컴파일러인 Whitesmiths C와 함게 제공되는 예제로 유명해진
;; "Stroustrup": C++의 저자가 그의 책에서 사용한, stroustrup라는 것
;; "ellemtel": Erik Nyquist 및 Mats Henricson, Ellemtel이 "C++ 프로그래밍, 규칙 및 권장 사항" 에서 정의한 인기있는 C++ 코딩 표준
;; "linux": Linux 개발자들이 커널 개발을 위해 사용한 것
;; "python": 파이썬 개발자들의 확장 모듈을 위해 사용한 것
;; "java": (아래 보이는)java-mode를 위한 기본 스타일
;; "user": 여러분 자신의 스타일을 정희하고 싶을 때
(setq c-default-style "linux"	; "linux"로 스타일 설정
      c-basic-offset 4)

;;;;;;;;;
;; group: Programming -> Tools -> Gdb
(setq gdb-many-windows t	; 기본값으로 gdb-many-widnows를 사용
      gdb-show-main t)		; Non-nil은 시작시에 메인 루틴을 포함하는 파일을 포함하는 소스 파일을 표시하는 것을 의미

;;;;;;;;
;;group: Programming -> Tools -> Compilation

;; Emacs에서 Compilation
(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;;grep-mode, ack, ag, 등과 같은 자식 모드를 망가트리고 싶지 않습니다.
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min ) (point-max)))))

;; 'compile' 명령에 따라 사용되는 compilation-mode 설정
(require 'compile)
(setq compilation-ask-about-save nil		; 컴파일 하기 전에 그냥 저장
      compilation-always-kill t				; 새로운 것을 시작하기 전에 지난 컴파일 프로세스 삭제
      compilation-scroll-output 'first-error)	; 처음으로 자동적으로 스크롤
(global-set-key (kbd "<f5>") 'compile)

;;;;;;;;;
;; group: Programming -> Tools -> MakeFile
;; takenn from prelude-c.el:48: https://github.com/bbatsov/prelude/blob/master/modules/prelude-c.el
(defun prelude-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'prelude-makefile-mode-hook)))

;;;;;;;;;
;; group: Programming -> Tools ->Ediff
(setq ediff-diff-options "-w"
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

;;;;;;;;;
;; group: Programming -> Tools -> Flycheck
;;(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
