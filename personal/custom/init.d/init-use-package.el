(provide 'init-use-package)
;;; init-use-package.el --- autuln's configuration entry point.

;; (prelude-require-package 'use-package)
;; 패키지 관리용 매크로(require 와 동일한 효과)

(require-package 'use-package)
(require 'use-package)


;;
;; C-h f use-package for help
;;
;; (use-package package-name
;;   [:keyword [option]]...)
;; :ensure 문 -> Loads the package using package.el if necessary.
;; :disabled 문 -> The package is ignored completely if this keyword is present.
;; :if 문 -> 패키지를 (require) 하는 조건을 명시.
;; :init 문 -> 패키지를 로드하기 전에 할 것들을 설정, hook 걸기 등을 설정.
;; :config 문 -> 패키지를 로드한 후에 할 것들을 설정.


;; example
;;
;; (use-package function-args
;;   :ensure t
;;   :disabled t
;;   :if (not (eq system-type 'ms-dos))
;;   :init
;;   (add-hook 'c++-mode-hook 'function-args-mode)
;;   (add-hook 'c-mode-hook 'function-args-mode)
;;   :config
;;   (fa-config-default)
;;   (set-default 'semantic-case-fold t))
