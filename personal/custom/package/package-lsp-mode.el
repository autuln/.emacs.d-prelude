(provide 'package-lsp-mode)
;;; package-lsp-mode.el --- autuln's configuration entry point.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :hook (c++-mode . lsp)
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;base end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook 'java-mode-hook #'lsp)
