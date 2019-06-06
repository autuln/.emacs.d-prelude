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

;;;;;;;;;;;;;;;;;;;;;; rsm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;; macOS specific settings
;; (when (eq system-type 'darwin)
;;  (setq mac-command-modifier 'control)
;;  (setq mac-control-modifier 'command))

;;;;;;;;;;;;;;;;;;;;;; Linux specific settings
;; (when (eq system-type 'gnu/linux)
;;   (require 'prelude-linux))

;;;;;;;;;;;;;;;;;;;;;; Windows specific settings
;; Windows 환경에서 Emacs를 사용할 경우, ssh 프로토콜을 통해 tramp를 사용하고 싶다면 putty의 plink를 사용해야 한다.
;; 다운 받은 plink.exe를 실행 PATH가 걸려 있는 적절한 위치에 넣어 준다
(when (eq system-type 'windows-nt)
  (when (executable-find "plink")
    (require 'tramp)
    (setq-default tramp-default-method "plink")))
	
;; for linux like environment in windows
;; http://ohyecloudy.com/emacsian/2017/04/08/windows-gcc-git-for-windows-sdk/
;; http://ohyecloudy.com/emacsian/2014/01/26/bash-shell-on-windows/
;; base : choco install -y msys2
;; setting : (base-dir "C:/tools/msys64")
(when (eq system-type 'windows-nt)
  (let* ((combine-path (lambda (dir dir-or-file)
                         (concat (file-name-as-directory dir) dir-or-file)))
         (base-dir "C:/tools/msys64")
         (msys2-bin-dir (funcall combine-path base-dir "usr/bin"))
         (mingw64-bin-dir (funcall combine-path base-dir "mingw64/bin"))
         (bash-path (funcall combine-path msys2-bin-dir "bash.exe")))
    (add-to-list 'exec-path msys2-bin-dir)
    (add-to-list 'exec-path mingw64-bin-dir)
    (setq explicit-shell-file-name bash-path)
    (setq shell-file-name bash-path)
    (setenv "SHELL" bash-path)
    (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
    (setenv "PATH" (concat mingw64-bin-dir path-separator
                           (concat msys2-bin-dir path-separator
                                   (getenv "PATH"))))))