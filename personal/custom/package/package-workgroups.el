(provide 'package-workgroups)
;;; package-workgroups.el --- autuln's configuration entry point.

(prelude-require-package 'workgroups2) ; workgroups-mode
(require 'workgroups2)

;;(setq wg-session-load-on-start t)	; 기본값: (not (daemonp))

;; (WG를 활성화하기 전에) prefix 키를 변경
;;(setq wg-prefix-key (kbd "C-c z"))	; -> 기본값

;; 워크그룹 세션 파일 변경
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")

;; WG의 로드/저장/전환을 위한 여러분 자신의 키보드 바로가기 키를 설정
;; "s" == "Super" 또는 "Win"-key, "S" == shift, "C" == Control
(global-set-key (kbd "<pause>") 'wg-reload-session)
(global-set-key (kbd "C-S-<pause>") 'wg-save-session)
(global-set-key (kbd "s-z") 'wg-switch-to-workgroup)
(global-set-key (kbd "s-/") 'wg-switch-to-previous-workgroup)

;; Emacs를 빠져나가거나 Workgroup-mode를 빠져나갈 때 해야할 것은?
;; (setq wg-emacs-exit-save-behavior 'save)			; Options: 'save 'ask nil
;;(setq wg-workgroups-mode-exit-save-behavior 'save)	; Options: 'save 'ask nil

;; 모드 라인 변경
;; mode-line에 작업그룹을 표시?
(setq wg-mode-line-display-on t)		; 기본값: (not (featurep 'powerline))
(setq wg-flag-modified t)				; 마찬가지로 수정 플래그 표시
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"	; 그것을 감싸는 방법
      wg-mode-line-decor-divider ":")

(workgroups-mode 1)		; .emacs의 맨 아래 이것을 둡니다.
