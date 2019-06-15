(provide 'package-cpp)
;;; package-cpp --- autuln's configuration entry point.

(if (eq system-type 'windows-nt)
    (require 'package-cpp-irony)
  (require 'package-cpp-rtags))
