(unless (version< emacs-version "25.1")
  (add-to-list 'package-selected-packages 'groovy-mode)


  (add-to-list 'package-selected-packages 'markdown-mode)
  ;; (add-hook 'markdown-mode-hook 'turn-off-auto-fill)

  (add-to-list 'package-selected-packages 'projectile)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (add-to-list 'package-selected-packages 'dired-subtree)
  (eval-after-load "dired"
    (lambda ()
      (define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle)
      (face-spec-set 'dired-subtree-depth-1-face '((t nil)) 'face-defface-spec)
      (face-spec-set 'dired-subtree-depth-2-face '((t nil)) 'face-defface-spec)
      (face-spec-set 'dired-subtree-depth-3-face '((t nil)) 'face-defface-spec)
      (face-spec-set 'dired-subtree-depth-4-face '((t nil)) 'face-defface-spec)
      (face-spec-set 'dired-subtree-depth-5-face '((t nil)) 'face-defface-spec)
      (face-spec-set 'dired-subtree-depth-6-face '((t nil)) 'face-defface-spec)))

  (add-to-list 'package-selected-packages 'go-mode)
  (add-hook 'go-mode-hook
            (lambda () (setq tab-width 4)))

  ;; (when (require 'projectile nil t)
  ;;   (projectile-mode +1)
  ;;     (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  ;; (add-to-list 'package-selected-packages 'dired-subtree)
  ;; (when (require 'dired-subtree nil t)
  ;;   (lambda () (define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle))
  ;;   (face-spec-set 'dired-subtree-depth-1-face '((t nil)) 'face-defface-spec)
  ;;   (face-spec-set 'dired-subtree-depth-2-face '((t nil)) 'face-defface-spec)
  ;;   (face-spec-set 'dired-subtree-depth-3-face '((t nil)) 'face-defface-spec)
  ;;   (face-spec-set 'dired-subtree-depth-4-face '((t nil)) 'face-defface-spec)
  ;;   (face-spec-set 'dired-subtree-depth-5-face '((t nil)) 'face-defface-spec)
  ;;   (face-spec-set 'dired-subtree-depth-6-face '((t nil)) 'face-defface-spec))
  )
