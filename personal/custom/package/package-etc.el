(provide 'package-etc)
;;; package-etc --- autuln's configuration entry point.


;; smart-mode-line에서 마이너 모드를 숨겨서 모드 라인(mode line) 공간확보
;; smart-mode-line에서 지원한다. 정확히는 rich-minority-mode를 포함하고 있다.
;; http://ohyecloudy.com/emacsian/2017/09/04/package-smart-mode-line-hide-minor-mode/
(use-package smart-mode-line
  :ensure t
  :config
  (add-to-list 'rm-blacklist " WS" t)
  (add-to-list 'rm-blacklist " Undo-Tree" t)
  (add-to-list 'rm-blacklist " Wrap" t))


;; helm-swoop
;; https://github.com/ShingoFukuyama/helm-swoop
;; http://ohyecloudy.com/emacsian/2018/01/07/package-helm-swoop-basic/
(use-package helm-swoop
  :ensure t
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)
   :map
   helm-swoop-map
   ("M-i" . helm-multi-swoop-all-from-helm-swoop)
   ("M-m" . helm-multi-swoop-current-mode-from-helm-swoop)))
