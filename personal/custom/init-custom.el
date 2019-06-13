(provide 'init-custom)
;;; init-custom.el --- autuln's configuration entry point.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;load init-custom.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add to ~/.emacs.d/personal/custom.el below
;;(add-to-list 'load-path "~/.emacs.d/personal/custom/")
;;(require 'init-custom)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this file loading sample;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;reload init.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;M-x load-file RET -> ~/.emacs.d/init.el RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;reload init.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;require fail in prelude-modules.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;M-x package-refresh-contents RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this file loading sample;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;config sample;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; - 패키지 자동 설치 코드
;;If you'd like to add some auto installation of packages in your personal config use the following code:
;;(prelude-require-packages '(some-package some-other-package))
;;If you require just a single package you can also use:
;;(prelude-require-package 'some-package)

;; - 디렉토리 로딩, 아직 정확히 이해 못함
;; preload the personal settings from `prelude-personal-preload-dir'
;; (when (file-exists-p prelude-personal-preload-dir)
;;   (message "Loading personal configuration files in %s..." prelude-personal-preload-dir)
;;   (mapc 'load (directory-files prelude-personal-preload-dir 't "^[^#\.].*el$")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;config sample;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;init.d start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "Loading init.d")
(add-to-list 'load-path "~/.emacs.d/personal/custom/init.d/")

(require 'init-start)

(require 'init-end)
(message "Complite init.d")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;init.d end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;config start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "custom config start...")

;; the custom config
(setq default-directory "~/")
;;(workgroups-mode 1) ;; package-install workgroups2
(cua-mode 1)
;;(linum-mode 1)
;;(smartparens-mode 1)

;;(when (version<= "26.0.50" emacs-version )
;;  (global-display-line-numbers-mode))


;; reload emacs configuration ~/.emacs.d/init.el
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))
;; (global-set-key (kbd "C-c C-l") 'reload-init-file)

;; reload emacs configuration
(defun reload-init-custom-file ()
  (interactive)
  (load-file "~/.emacs.d/personal/custom.el"))
(global-set-key (kbd "C-c C-l") 'reload-init-custom-file)



(setq evil-default-state 'emacs) ;; changes default state to emacs


(message "custom config end")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;config end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
