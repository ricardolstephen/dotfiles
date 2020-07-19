(unless (version< emacs-version "25.1")
  (add-to-list 'package-selected-packages 'markdown-mode)
  (add-to-list 'package-selected-packages 'groovy-mode)
  
  ;; (add-to-list 'package-selected-packages 'fill-column-indicator)
  ;; (require 'fill-column-indicator)
  ;; (define-global-minor-mode global-fci-mode fci-mode
  ;;   (lambda () (when (and (not (string-match "^\*.*\*$" (buffer-name)))
  ;;                         (not (equal major-mode 'dired-mode))
  ;;                         (not (equal major-mode 'scratch-mode)))
  ;;                (fci-mode 1))))
  ;; (global-fci-mode)
  )
