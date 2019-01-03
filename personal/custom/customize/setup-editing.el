(provide 'setup-editing)

;; GROUP: editing -> Editing Basics


(setq global-mark-ring-max 5000		;5000개의 엔트리를 포함하도록 mark ring을 증가
      mode-require-final-newline t	;파일 끝에 newline 추가
      )

;; 하나의 tab을 표시하기 위해 4개의 공백을 기본값으로
(setq-default tab-width 4)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;(set-language-environment "UTF-8")
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

;;(setq default-input-method "Korean-hangul") ; 한글 2벌식을 기본 입력 방식으로 설정,
;; 윈도우즈에선 활성화시 오히려 한글 안됨, 리눅스에서 한글 안되면 활성화 해볼것

;; 밑에 설정이 없어도 윈도우에서 환영전환이 되지만 완벽하지 않다
(global-set-key (kbd "<kana>") 'toggle-input-method);;한영키-한영변환
(global-set-key (kbd "S-SPC") 'toggle-input-method);;shift+space-한영변환


(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;;GROUP: Editing -> killing
(setq
 kill-ring-max 5000	; kill-ring 용량 증가
 kill-whole-line t	; 만약 NIL이면, 전체 행을 제거하고 다음 행을 위로 이동
 )

 ;;diff-mode 에서 중요한 화이트스페이스 보이게 하기
;; (add-hook 'diff-mode-hook (lamda ()
;;                                  (setq-local whitespace-style
;;                                              '(face
;;                                                tabs
;;                                                tab-mark
;;                                                spaces
;;                                                space-mark
;;                                                trailing
;;                                                indentation::space
;;                                                indentation::tab
;;                                                newline
;;                                                newline-mark))
;;                                  (whitespace-mode 1)))

(require 'expand-region)
(global-set-key (kbd "C-&") 'er/expand-region)	;; 기본값 :'C-='
(global-set-key (kbd "C-M-&") 'er/contract-region)
