(provide 'init-req-package)
;;; init-req-package.el --- autuln's configuration entry point.


;; (use-package req-package
;;  :ensure t)

;; https://github.com/edvorg/req-package
;; https://melpa.org/#/req-package

;; req-package provides dependency management for use-package.
;; This allows to write simple and modular configs. Migration from use-package is simple and syntax is almost same.

;; Usage begin ;;;;;;;;;;;;;;;;;

;; Load req-package:
;; (require 'req-package)

;; (req-package el-get ;; prepare el-get (optional)
;;              :force t ;; load package immediately, no dependency resolution
;;              :config
;;              (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
;;              (el-get 'sync))
;; Define required packages with dependencies using :require.
;; Use :force t if you want to avoid dependency management and load right now.
;; Use :el-get t or :el-get package-name if you want to install from el-get.

;; init-dired.el
;; (req-package dired) ;; this form is optional as it doesn't have any configuration
;; (req-package dired-single
;;              :require dired ;; depends on dired
;;              :config (...))
;; init-lua.el
;; (req-package lua-mode
;;              :config (...))
;; init-flymake.el
;; (req-package flymake
;;              :config (...))
;; (req-package flymake-custom
;;              :require flymake
;;              :load-path "/path/to/file/directory"
;;              :config (...))

;; Solve dependencies, install and load packages in right order:
;; order doesn't matter here
;; (require 'init-dired)
;; (require 'init-lua)
;; (require 'init-flymake)
;; (req-package-finish)

;; Usage end ;;;;;;;;;;;;;;;;;

;; Logging
;; You can use req-package--log-open-log to see, what is happening with your configuration.
;; You can choose log level in req-package group by req-package-log-level custom.
;; These log levels are supported: fatal, error, warn, info, debug, trace.

;; Migrate from use-package
;; Just replace all (use-package ...) with (req-package [:require DEPS] ...)
;; and add (req-package-finish) at the end of your configuration file.
;; There is a :force keyword which simulates plain old use-package behavior.

;; Note
;; More complex req-package usage example can be found at https://github.com/edvorg/emacs-configs.
;; Use load-dir package to load all *.el files in a dir (e.g ~/.emacs.d/init.d)



;;
;; C-h f req-package for help
;;
;; (req-package package-name
;;   [:keyword [option]]...)
;; :ensure 문 -> Loads the package using package.el if necessary.
;; :disabled 문 -> The package is ignored completely if this keyword is present.
;; :if 문 -> 패키지를 (require) 하는 조건을 명시.
;; :init 문 -> 패키지를 로드하기 전에 할 것들을 설정, hook 걸기 등을 설정.
;; :config 문 -> 패키지를 로드한 후에 할 것들을 설정.


;; example
;;
;; (req-package function-args
;;   :ensure t
;;   :disabled t
;;   :if (not (eq system-type 'ms-dos))
;;   :init
;;   (add-hook 'c++-mode-hook 'function-args-mode)
;;   (add-hook 'c-mode-hook 'function-args-mode)
;;   :config
;;   (fa-config-default)
;;   (set-default 'semantic-case-fold t))
