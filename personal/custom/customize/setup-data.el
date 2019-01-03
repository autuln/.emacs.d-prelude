(provide 'setup-data)

;;;;;;;;
;;group: Data -> Saveplace

;; saveplace는 파일들을 저장할 때 파일에서의 위치를 기억합니다.
(require 'saveplace)
(setq-default save-place t)
;; Emaces 24.4 이상에서 (toggle-save-place-globally 1)를 사용
