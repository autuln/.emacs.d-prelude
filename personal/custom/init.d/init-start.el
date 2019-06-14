(provide 'init-start)
;;; init-start.el --- autuln's configuration entry point.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; elpa
(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("gnu" . "http://elpa.gnu.org/packages/"))
    (add-to-list 'package-archives
                 '("gnu" . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "https://marmalade-repo.org/packages/"))
;; 경고 뜸

;; require-package
(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; install package
(require 'init-use-package) ;; package-install use-package
(require 'init-req-package) ;; package-install req-package


;; el-get
(require 'req-package)
(req-package el-get ;; prepare el-get (optional)
             :force t ;; load package immediately, no dependency resolution
             :config
             (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
             (el-get 'sync))


;; :el-get keyword for use-package
(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;package start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "Loading package's list...")
(add-to-list 'load-path "~/.emacs.d/personal/custom/package/")
;; the package stuff

;;(require 'package-helm) ;; package-install helm
;;(require 'package-web-mode) ;; package-install web-mode
(require 'package-magit) ;; package-install magit
;;(require 'package-workgroups) ;; package-install workgroups2

(require 'package-treemacs) ;; package-install treemacs

(require 'package-org-mode) ;; package-install org-mode

(require 'package-etc) ;; package-etc

(message "Complite package's list...")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;package end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
