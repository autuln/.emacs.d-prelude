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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;customize start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "Loading setup's list...")
(add-to-list 'load-path "~/.emacs.d/personal/custom/customize/")
;; the setup stuff
(require 'setup-applicatoins)
(require 'setup-async)
(require 'setup-beacon)
(require 'setup-communication)
(require 'setup-convenience)
(require 'setup-data)
(require 'setup-development)
(require 'setup-editing)
(require 'setup-environment)
(require 'setup-external)
(require 'setup-faces)
(require 'setup-files)
(require 'setup-help)
(require 'setup-local)
(require 'setup-multimedia)
(require 'setup-programming)
(require 'setup-text)
(message "Complite setup's list...")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;customize end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;package start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "Loading package's list...")
(add-to-list 'load-path "~/.emacs.d/personal/custom/package/")
;; the package stuff
(require 'package-use-package) ;; package-install use-package
;;(require 'package-helm) ;; package-install helm
;;(require 'package-web-mode) ;; package-install web-mode
(require 'package-magit) ;; package-install magit
;;(require 'package-workgroups) ;; package-install workgroups2

(message "Complite package's list...")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;package end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;install start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "custom install start...")


(message "custom install end")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;install end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; macOS specific settings
;; (when (eq system-type 'darwin)
;;  (setq mac-command-modifier 'control)
;;  (setq mac-control-modifier 'command))

;; Linux specific settings
;; (when (eq system-type 'gnu/linux)
;;   (require 'prelude-linux))


;; Windows 환경에서 Emacs를 사용할 경우, ssh 프로토콜을 통해 tramp를 사용하고 싶다면 putty의 plink를 사용해야 한다.
;; 다운 받은 plink.exe를 실행 PATH가 걸려 있는 적절한 위치에 넣어 준다
(when (eq system-type 'windows-nt)
  (when (executable-find "plink")
    (require 'tramp)
    (setq-default tramp-default-method "plink")))


(setq evil-default-state 'emacs) ;; changes default state to emacs


(message "custom config end")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;config end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
