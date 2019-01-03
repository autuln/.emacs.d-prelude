(provide 'setup-files)

;;;;;;;;;
;; group: Files
(setq large-file-warning-threshold 100000000) ;; 바이트 크기

;;;;;;;;;
;; group: Files -> Back up
;;(defvar backup-directory "~/.backups")
;;(if (not (file-exists-p backup-directory))
;;    (make-directory backup-directory t))
;;(setq
;; make-backup-files t	; 처음 저장할 때 백업파일
;; backup-directory-alist '((".*" . ,backup-directory))	;~/.backups에 백업파일을 저장
;; backup-by-copying t	; 백업 디렉토리에 현재 파일을 복사
;; version-control t		; 백업 파일에 대한 버전 번호
;; delete-old-versions t	; 필요하지 않은 버전 삭제
;; kept-old-versions 6	; 새로운 번호로된 백업이 만들어졋을 때 남겨둘 지나간 버전 (default: 2)
;; kept-new-versions 9	; 새 번호로된 백업이 만들어졋을 때 유지할 최신 버전 (default: 2)
;; auto-save-default t	; 파일을 방문한 모든 버퍼를 자동저장
;; auto-save-timeout 20	; 자동 저장 전에 유휴시간(초) (default: 30)
;; auto-save-interval 200	; 자동 저장 사이에 keystrokes의 수 (default: 300)
;; )

;;;;;;;;;
;; group: Files -> dired
(setq
 dired-dwim-target t		; 만약 다른 Dired buffer이 다른 윈도우에 표시되고 있다면, Rename,Copy를 위한 타겟으로 그 디렉토리를 사용
 dired-recursive-copies 'always	; "always"는 질문하지 않음을 의미
 dired-recursive-deletes 'top	; "top"은 최상위 디렉토리에 한번 요청하는 것을 의미합니다.
 dired-listing-switches "-lha"	; 사림이 읽을 수 있는 목록
 )

;; 변경이 있을 때 dired buffer를 자동적으로 새로고침
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; 만약 윈도우가 아니라면, 다음 목록으로 전환해서 사용
(when (not (eq system-type 'windows-nt))
  (setq dired-listing-switches "-lha --group-directories-first"))

;;; 키 바인딩
;;(define-key ctl-x-map "\C-j" 'dired-jump)
;;(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)
;;(define-key dired-mode-map "\C-x\M-o" 'dired-omit-mode)
;;(define-key dired-mode-map "*0" 'dired-mark-omitted)
;;(define-key dired-mode-map "\M-(" 'dired-mark-sexp)
;;(define-key dired-mode-map "*(" 'dired-mark-sexp)
;;(define-key dired-mode-map "*." 'dired-mark-extension)
;;(define-key dired-mode-map "\M-!" 'dired-smart-shell-command)
;;(define-key dired-mode-map "\M-G" 'dired-goto-subdir)
;;(define-key dired-mode-map "F" 'dired-do-find-marked-files)
;;(define-key dired-mode-map "Y" 'dired-do-relsymlink)
;;(define-key dired-mode-map "%Y" 'dired-do-relsymlink-regexp)
;;(define-key dired-mode-map "V" dired-do-run-mail)
;;(require 'dired-x) ; provide extra commands for Dired

;;;;;;;;;
;; group: Files -> Dired -> Wdired
;; wdired는 dired를 편집하고 디스크에 변경내용을 저장할 수 있게 해 줍니다.
;; - C-x C-q로 wdired로 전환
;; - Dired buffer를 편집, 예 파일이름 변경
;; - C-c C-c로 commit, C-c C-k로 취소
(require 'wdired)
(setq
 wdired-allow-to-change-permissions t	; 퍼미션 비트 편집 허용
 wdired-allow-to-redirect-links t		; 심볼릭링크 편집 허용
 )

;;;;;;;;;
;; group: Files -> Recentf
;;(recentf-mode)
;;(setq
;; recentf-max-menu-items 30
;; recentf-max-saved-items 5000
;; )

(prelude-require-package 'ztree) ; text-tree 응용프로그램 구현
;; ztree-diff : 디렉토리 비교, ztree-dir : 디렉토리 탐색


;;;;;;;;;
;; group: Files -> Vlf
(prelude-require-package 'vlf) ; View Large Files In emacs
(setq vlf-application 'dont-ask) ;; 파일이 large-file-warning-threshold를 초과할 때 큰 파일에 자동적으로 vlf를 사용
