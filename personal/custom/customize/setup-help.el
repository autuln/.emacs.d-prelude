(provide 'setup-help)

;;;;;;;;;
;; group: Help -> Info+

;;(prelude-require-package) ;; info+ 패키지가 없다(설치가 안된다.)
;;(require 'info+)


;; 현재 Emacs major 모드에 대한 의미와 키 바인딩을 알아냅니다.
;; discover-my-major로 빠르게 메이저 모드 도움말을 얻음
(global-unset-key (kbd "C-h h")) ;; 원래 "C-h h" 는 국가별 언어 "hello world" 리스트를 표시합니다.
(define-key 'help-command (kbd "h m") 'discover-my-major) ; -> C-h h m

;; 색상 이름들과 일치하는 문자열에 배경 색을 설정
;; package: rainbow-mode
;; group: help -> Rainbow
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)


;; package: help+
;; group: Help
;;(prelude-require-package 'help+) ;; help+ 패키지가 없다(설치가 안된다.)
;;(require 'help+)

;; package: help-fns+
;; group: Help
;;(prelude-require-package 'help-fns+) ;; help-fns+ 패키지가 없다(설치가 안된다.)
;;(require 'help-fns+)

;; package: help-mode+
;; group: Help
;;(prelude-require-package 'help-mode+) ;; help-mode+ 패키지가 없다(설치가 안된다.)
;;(require 'help-mode+)
