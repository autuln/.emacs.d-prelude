(provide 'setup-faces)

;; 어떤 bar 나부랭이들도 필요치 않습니다.
;; 화면 자원을 절약하려면 그것을 꺼줍니다.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; 깜빡이는 커서는 아무것도 아니지만, 성가십니다.
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(size-indication-mode t)

;; prelude-ui.el에서 가져온
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                             (abbreviate-file-name (buffer-file-name))
                                           "%b"))))

;; 더 좋아 보이는 텍스트를 위해 Inconsolata로 font를 변경
;; 먼저 Inconsolata 폰트를 설치해야 함을 명심
;; (setq default-frame-alist '((font . "Inconsolata-11")))
;; Emacs는 자동적으로 이탤릭 폰트를 설정
;;(set-face-attribute 'italic nil
;;                    :family "Inconsolata-Italic")
;; 이탤릭체는 한글을 사용 함에있어 의미 없어 보여서 주석처리
;; 한글 글꼴은 setup-local.el로 이동

;;;;;;;;;;;
;; package: highlight-numbers
;; group: Faces -> Number Font Lock
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; package: highlight-symbol
(prelude-require-package 'highlight-symbol)
(require 'highlight-symbol)

(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;; 테마
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'zenburn t)
;; (load-theme 'paganini t) ;;이 테마가 존재 하지 않아 오류 발생

;;;;;;;;;;;
;; package: highlight-numbers
;; group: Faces -> Number Font Lock
(prelude-require-package 'highlight-numbers)
(require 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
