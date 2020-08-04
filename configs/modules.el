(unless (version< emacs-version "25.1")
  (add-to-list 'package-selected-packages 'markdown-mode)
  (add-to-list 'package-selected-packages 'groovy-mode)

  (add-to-list 'package-selected-packages 'projectile)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (add-to-list 'package-selected-packages 'dired-subtree)
  (eval-after-load "dired-subtree"
    (lambda () (define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle)))
  (face-spec-set 'dired-subtree-depth-1-face '((t nil)) 'face-defface-spec)
  (face-spec-set 'dired-subtree-depth-2-face '((t nil)) 'face-defface-spec)
  (face-spec-set 'dired-subtree-depth-3-face '((t nil)) 'face-defface-spec)
  (face-spec-set 'dired-subtree-depth-4-face '((t nil)) 'face-defface-spec)
  (face-spec-set 'dired-subtree-depth-5-face '((t nil)) 'face-defface-spec)
  (face-spec-set 'dired-subtree-depth-6-face '((t nil)) 'face-defface-spec)
  
  
  ;; (add-to-list 'package-selected-packages 'fill-column-indicator)
  ;; (require 'fill-column-indicator)
  ;; (define-global-minor-mode global-fci-mode fci-mode
  ;;   (lambda () (when (and (not (string-match "^\*.*\*$" (buffer-name)))
  ;;                         (not (equal major-mode 'dired-mode))
  ;;                         (not (equal major-mode 'scratch-mode)))
  ;;                (fci-mode 1))))
  ;; (global-fci-mode)
  )
