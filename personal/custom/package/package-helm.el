(provide 'package-helm)
;;; package-helm.el --- autuln's configuration entry point.

(require 'helm)
(require 'helm-config)

;; 기본값 "C-x c는 Emacs를 종료하는 "C-x C-c"와 아주 가깝습니다.
;; 주의 : 일단 'helm-config'가 로드되면 우리는 'helm-command-prefix-key'를
;; 변경할 수 없기 때문에 전역적으로 "C-c h"를 설정해야만 합니다.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x) ;; helm 버전 M-x 단축키
(setq helm-M-x-fuzzy-match t) ;; Helm-M-x을 위한 선택적인 퍼지 매칭
(global-set-key (kbd "M-y") 'helm-show-kill-ring) ;; helm 버전 kill-ring 단축키
(global-set-key (kbd "C-x b") 'helm-mini) ;; helm 버전 minibuffer 단축키
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t) ;; helm-mini 을 위한 퍼지 맞춤 활성화
(global-set-key (kbd "C-x C-f") 'helm-find-files) ;; helm 버전 find-files 단축키

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; persistent action 실행을 tab에 리바인드
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; 터미널에서 TAB 작동
(define-key helm-map (kbd "C-z") 'helm-select-action) ; C-z를 사용해서 액션 나열

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)

(global-set-key (kbd "C-c h o") 'helm-occur) ;; helm 버전 occur 단축키

(setq helm-apropos-fuzzy-match t) ;; apropos 퍼지 매칭 활성화

(setq helm-lisp-fuzzy-completion t) ;; helm-lisp-completion fuzzy 활성화

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings) ;; helm 버전 mark-rings 단축키

(global-set-key (kbd "C-c h x") 'helm-register)

(global-set-key (kbd "C-c h g") 'helm-google-suggest)

(global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(when (executable-find "ack-grep") ;; grep를 대체하기 위해 ack-grep를 사용
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(setq helm-split-window-in-side-p t ; 다른 창을 점유하지 않고, 현재 창 안에 helm버퍼를 염.
      helm-move-to-line-cycle-in-source t ; 소스의 top 또는 bottom에 도달할 때 소스가 시작하는 또는 끝으로 이동
      helm-ff-search-library-in-sexp t ; 'require' 와 'declare-function' sexp에 있는 라이브러리에 대한 검색
      helm-scroll-amount 8 ; M-<next>/M-<prior>를 사용해서 다른 윈도우를 8행 스크롤
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line ad input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     '(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;(require 'helm-eshell)
;(add-hook 'eshell-mode-hook
;          #'(lambda()
;              (define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring) ;; M-x shell 을 위한 명령.
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history) ;; helm 미니버퍼 history 관리 명령.

(require 'helm-descbinds) ;; package-install helm-descbinds
(helm-descbinds-mode) ;; 패키지 활성화(C-h b -> describe-bindings)

(helm-mode 1)
