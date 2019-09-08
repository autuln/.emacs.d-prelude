(provide 'setup-applicatoins)

;;;;;;;;;
;; group: Applications-> Eshell
(require 'eshell)
(require 'em-alias)
(require 'cl)

;; 하나의 파일 이상을 승인하도록 find-file-other-window에 통지(advice)
(defadvice find-file-other-window (around find-files activate)
  "Also find all files within a list of files. This even works recursively."
  (if (listp filename)
      (loop for f in filename do (find-file-other-frame f wildcards))
    ad-do-it))

;; Eshell에서, 여러분은 M-x에서 명령을 실행할 수 있는데
;; 여기에 명령들의 별명이 있습니다.
;; $*은 모든 인수를 받아들임의 의미합니다.
;;(eshell/alias "o" "")
;;(eshell/alias "o" "find-file-other-window $*")
;;(eshell/alias "vi" "find-file-other-window $*")
;;(eshell/alias "vim" "find-file-other-window $*")
;;(eshell/alias "emacs" "find-file-other-window $*")
;;(eshell/alias "em" "find-file-other-window $*")

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

;; OS에 기반한 목록 변경 스위치
;;(when (not (eq system-type 'windows-nt))
;;  (eshell/alias "ls" "ls --color -h --group-directories-first $*"))
