(provide 'setup-convenience)

;; GROUP: Convenience -> Revert

;; 파일에 만들어진 어떤 변경 사항을 현재 버퍼에 업데이트
(global-auto-revert-mode)

;; GROUP: Convenience -> HL Line
(global-hl-line-mode)

;; GROUP: Convenience -> Ibuffer
(setq ibuffer-use-other-window t) ;; 항상 다른 윈도우에 ibuffer를 표시

;; GROUP: Convenience -> Linum
;(add-hook 'prog-mode-hook 'linum-mode) ;; 프로그래밍 모드에서만 행번호 표시

;; GROUP: Convenience -> Whitespace
;; 불필요한 whitespace가 생성될 때마다, whitespace를 하이라이트
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; 모든 whitespace 문자들이 보이도록 whitespace-mode를 활성화
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; GROUP: Convenience -> Windmove
;; 더 쉽게 윈도우 탐색
(windmove-default-keybindings)


;; PACKAGE: company
;; 텍스트 완성 프레임워크
;(add-hook 'after-init-hook 'global-company-mode)

