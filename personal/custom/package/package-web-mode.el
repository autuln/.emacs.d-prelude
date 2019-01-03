(provide 'package-web-mode)
;;; package-web-mode.el --- autuln's configuration entry point.

(prelude-require-package 'web-mode) ; web-mode
;;(require 'web-mode)
(setq auto-mode-alist
      (append '(
                ("\\.\\(html\\|xhtml\\|shtml\\tpl\\)\\'" . web-mode)
                ("\\.\\(php\\|phtml\\)\\'" . php-mode)
                )
              auto-mode-alist))
(defun web-mode-hook ()
  "Web 모드를 위한 hook." ()
  ;; 변경 일시 형식을 자동변경
  (setq time-stamp-line-limit -200)
  (if (not (memq 'time-stamp write-file-hooks))
      (setq write-file-hooks
            (cons 'time-stamp write-file-hooks)))
  (setq time-stamp-format " %3a %3b %02d %02H:%02M:%02S %:y %Z")
  (setq time-stamp-start "마지막 변경:")
  (setq time-stamp-end "$")

  ;; Web mode 설정
  (setq web-mode-markup-indent-offset 2)	; 태그 들여쓰기
  (setq web-mode-css-indent-offset 2)  		; css 들여쓰기
  (setq web-mode-code-indent-offset 2)		; 스타일, 스크립트 들여쓰기
  (setq web-mode-style-padding 1)			; 스타일 패딩
  (setq web-mode-script-padding 1)			; 스크립트 패딩
  (setq web-mode-block-padding 0)			; 블록 패딩
  (setq web-mode-comment-style 2)			; 주석 스타일 2
  (setq web-mode-enable-auto-pairing t)		; 자동 짝 만들기 t
  (setq web-mode-enable-css-colorization t)	; css 컬러링 t
  )
(add-hook 'web-mode-hook 'web-mode-hook)
