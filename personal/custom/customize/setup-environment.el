(provide 'setup-environment)

;;;;;;;;;
;; group: Environment -> Initialization

(setq inhibit-startup-screen t)

;;;;;;;;;
;; group: Environment -> Minibuffer -> Savehist

;; savehist는 기본값으로 미니 버퍼 기록을 저장합니다.
(setq savehist-additional-variables '(search ring regexp-search-ring)	;정규식 검색쿼리도 저장.
      savehist-autosave-interval 60	; 매 분마다 저장
      )

;;;;;;;;;
;; group: Environment -> Windows -> Winner

(winner-mode 1)

;;;;;;;;;
;; group: Environment -> Mode Line

(column-number-mode 1)


;;;;;;;;;;;
;; package: nyan-mode
;; group: Environment -> Frames -> Nyan

;;(prelude-require-package 'nyan-mode)
;;(case window-system
;;  ((x w32) (nyan-mode)))


;;;;;;;;;;;
;; package: golden-ratio
;; group: Environment -> Windows -> golden Ratio
(prelude-require-package 'golden-ratio)
(require 'golden-ratio)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; 다음 모드에서는 golden-raio를 활성화하지 않습니다.
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode"
                                   "dired-mode"
                                   ))
(golden-ratio-mode)
