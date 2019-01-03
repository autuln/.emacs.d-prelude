(provide 'setup-local)

;; 한글 글꼴 설정
;; 1234 5678 9012345678901234
;; Dejavu Sans Mono font -> 영문 글꼴은 데비안에 기본적으로 설치 되어 있다.
;; D2Coding font -> 한글 글꼴은 naver에서 코딩 용 글꼴로 나눔하는 D2Coding 을 사용 한다.
;; 둘다 윈도우즈 10 기준으로 설정 잘 된다. 그러나 글자 크기가 너무 커서 주석 처리한다.
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 130)
;; (set-fontset-font nil 'hangul (font-spec :family "D2Coding" :pixelsize 18))
;; (setq face-font-rescale-alist '(("D2Coding" . 1.2)))
;; (setq-default line-spacing 6)


;; Korean-holidays 는 Emacs달력을 위한 단순 패키지
;; package: korean-holidays
(prelude-require-package 'korean-holidays)
(require 'korean-holidays)
;; 만약 'Korean-holidays'를 배타적으로 사용하고 싶다면, init.el에 아래 조각을 추가하십시오.
(setq calendar-holidays korean-holidays)

;; 만약 'Korean-holidays'를 추가적으로 사용하고 싶다면, init.el에 아래 조각을 추가하십시오.
;; (setq calendar-holidays (append calendar-holidays korean-holidays))
