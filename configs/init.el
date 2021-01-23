;;; Package management
;;;;;;;;;;;;;;;;;;;;;;

;; Initialize package management
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; https://emacs.stackexchange.com/questions/233
(add-to-list 'package-selected-packages 'gnu-elpa-keyring-update)


;;; Editor appearance
;;;;;;;;;;;;;;;;;;;;;

;; Enable global line numbers
(global-display-line-numbers-mode)

;; Setup fill column indicator
(setq-default fill-column 80)
;; Enable global fci
(add-to-list 'package-selected-packages 'fill-column-indicator)
(require 'fill-column-indicator)
(define-global-minor-mode global-fci-mode fci-mode
  (lambda () (when (and (not (string-match "^\*.*\*$" (buffer-name)))
                        (not (equal major-mode 'dired-mode))
                        (not (equal major-mode 'scratch-mode)))
               (fci-mode 1))))
(global-fci-mode)

;; Customize the mode line
(column-number-mode)
(which-function-mode)


;;; General editor behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Disable backup files
(setq make-backup-files nil)


;;; Useful commands
;;;;;;;;;;;;;;;;;;;

;; Delete commands
(defun my-delete-backward-word (p1) (interactive "*d")
       (if (use-region-p)
           (delete-region (point) (mark))
         (progn (backward-word) (delete-region p1 (point)))))
(defun my-delete-forward-word (p1) (interactive "*d")
       (if (use-region-p)
           (delete-region (point) (mark))
         (progn (forward-word) (delete-region p1 (point)))))
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-d") 'delete-forward-char)
(define-key global-map (kbd "M-h") 'my-delete-backward-word)
(define-key global-map (kbd "M-d") 'my-delete-forward-word)

;; Navigation
(define-key global-map (kbd "M-n") (lambda () (interactive) (next-line 5)))
(define-key global-map (kbd "M-p") (lambda () (interactive) (next-line -5)))

;; Window management
(defun my-split-and-follow-below () (interactive)
       (split-window-below) (other-window 1))
(defun my-split-and-follow-right () (interactive)
       (split-window-right) (other-window 1))
(defun my-next-window () (interactive) (other-window 1))
(defun my-previous-window () (interactive) (other-window -1))
(defun my-swap-buffers () (interactive)
       (let ((my-buffer-a (current-buffer))
             my-buffer-b)
         (other-window 1)
         (setq my-buffer-b (current-buffer))
         (switch-to-buffer my-buffer-a)
         (other-window -1)
         (switch-to-buffer my-buffer-b)
         (other-window 1)))
(define-key global-map (kbd "C-x 2") 'my-split-and-follow-below)
(define-key global-map (kbd "C-x 3") 'my-split-and-follow-right)
(define-key global-map (kbd "C-x i") 'my-previous-window)
(define-key global-map (kbd "C-c h") 'my-swap-buffers)

;; Indentation
(setq-default indent-tabs-mode nil)
;; (setq-default tab-width 2)

;; Comments
(define-key global-map (kbd "M-;")
  (lambda () (interactive)
    (if (or (use-region-p)
            (equal (string-match-p "^\\s-*$" (thing-at-point 'line)) 0))
        (call-interactively 'comment-dwim)
      (progn (call-interactively 'comment-line) (previous-line)))))

;;; General modes
;;;;;;;;;;;;;;;;;

;; Isearch mode
(eval-after-load "isearch"
  (lambda () (define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)))
(add-hook 'isearch-mode-end-hook
          (lambda ()
            (when (and isearch-forward
                       isearch-other-end
                       (not isearch-mode-end-hook-quit))
              (goto-char isearch-other-end))))

;; Dired mode
;; In macOS, use `gls` instead of `ls`.
;; (when (string= system-type "darwin")
;;   (setq insert-directory-program (executable-find "gls")))
(eval-after-load "dired"
  (lambda ()
    (define-key dired-mode-map (kbd "k") 'dired-kill-subdir)

    ;; https://stackoverflow.com/a/50138457
    (defun dired-subdir-aware (orig-fun &rest args)
      (if (eq major-mode 'dired-mode)
          (let ((default-directory (dired-current-directory)))
            (apply orig-fun args))
        (apply orig-fun args)))
    (advice-add 'find-file-read-args :around 'dired-subdir-aware)
    ))
;; Dired subtree
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

;; Projectile mode
(add-to-list 'package-selected-packages 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Desktop-save
(when (daemonp)
  ;; (desktop-save-mode 1)
  (desktop-read)
  ;; (setq desktop-restore-frames nil)
  (add-hook 'desktop-no-desktop-file-hook (lambda () (desktop-save "~/.emacs.d")))
  (add-hook 'kill-emacs-hook (lambda () (desktop-save "~/.emacs.d"))))


;;; Language modes
;;;;;;;;;;;;;;;;;;

;; Text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Markdown-mode
(add-to-list 'package-selected-packages 'markdown-mode)
(eval-after-load "markdown-mode"
  (lambda ()
    (define-key markdown-mode-map (kbd "M-n")
      (lambda () (interactive) (next-line 5)))
    (define-key markdown-mode-map (kbd "M-p")
      (lambda () (interactive) (next-line -5)))
    (define-key markdown-mode-map (kbd "M-h") 'my-delete-backward-word)))

;; Java mode
(add-hook 'java-mode-hook (lambda () (setq fill-column 100)))

;; Groovy mode
(add-to-list 'package-selected-packages 'groovy-mode)

;; Golang mode
(add-to-list 'package-selected-packages 'go-mode)
(add-hook 'go-mode-hook
          (lambda () (setq tab-width 4)))


;;; Local configs
;;;;;;;;;;;;;;;;;

;; Load configs file
;; (setq custom-file (concat
;;                    (file-name-directory
;;                     (directory-file-name
;;                      (file-name-directory
;;                       (file-truename load-file-name))))
;;                    "local/custom.el"))
;; (when (file-exists-p custom-file)
;;   (load-file custom-file))
