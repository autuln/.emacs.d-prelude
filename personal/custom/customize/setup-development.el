(provide 'setup-development)

;;;;;;;;;
;; group: Development -> Extensions -> Eldoc

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;
;; group: Development -> Internal

;; Emacs 성능 향상을 위해 100MB마다 garbage 수집 시작
(setq gc-cons-threshold 100000000)
