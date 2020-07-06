;; Spacemacs configuration
(when (boundp 'dotspacemacs-emacs-leader-key)
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda () (when (and (not (string-match "^\*.*\*$" (buffer-name)))
                          (not (equal major-mode 'dired-mode))
                          (not (equal major-mode 'scratch-mode)))
                 (fci-mode 1))))
  (global-fci-mode))

;; Bare emacs configuration
(unless (boundp 'dotspacemacs-emacs-leader-key)
  (package-initialize)
  
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

  ;; https://emacs.stackexchange.com/questions/233
  (add-to-list 'package-selected-packages 'gnu-elpa-keyring-update)

  ;; Disable backup files
  (setq make-backup-files nil)

  (setq custom-file (concat
                     (file-name-directory
                      (directory-file-name
                       (file-name-directory
                        (file-truename load-file-name))))
                     "local/custom.el"))
  (when (file-exists-p custom-file)
    (load-file custom-file)))

;; Delete, kill
(defun my-delete-backward-word (p1) (interactive "*d")
       (if (use-region-p)
           (delete-region (point) (mark))
         (progn (backward-word) (delete-region p1 (point)))))
(defun my-delete-forward-word (p1) (interactive "*d")
       (if (use-region-p)
           (delete-region (point) (mark))
         (progn (forward-word) (delete-region p1 (point)))))
;; (defun my-delete-forward-line () (interactive "*")
;;        (cond ((use-region-p) (delete-region (point) (mark)))
;;              ((eq (point) (line-end-position)) (delete-forward-char 1))
;;              (t (delete-region (point) (line-end-position)))))
;; (defun my-kill-ring-save-line-or-region () (interactive)
;;        (if (use-region-p)
;;            (kill-ring-save (point) (mark))
;;          (kill-ring-save (point) (line-end-position))))
;; (defun my-kill-line-or-region () (interactive "*")
;;        (if (use-region-p)
;;            (kill-region (point) (mark))
;;          (kill-line)))
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-d") 'delete-forward-char)
(define-key global-map (kbd "M-h") 'my-delete-backward-word)
(define-key global-map (kbd "M-d") 'my-delete-forward-word)
;; (define-key global-map (kbd "C-k") 'my-delete-forward-line)
;; (define-key global-map (kbd "M-w") 'my-kill-ring-save-line-or-region)
;; (define-key global-map (kbd "M-k") 'my-kill-line-or-region)

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

;; Navigation
(define-key global-map (kbd "M-n") (lambda () (interactive) (next-line 5)))
(define-key global-map (kbd "M-p") (lambda () (interactive) (next-line -5)))

;; Indentation
(setq-default indent-tabs-mode nil)
;; (setq-default tab-width 2)

;; Commenting
(define-key global-map (kbd "M-;")
  (lambda () (interactive)
    (if (or (use-region-p)
            (equal (string-match-p "^\\s-*$" (thing-at-point 'line)) 0))
        (call-interactively 'comment-dwim)
      (progn (call-interactively 'comment-line) (previous-line)))))

;; Isearch
(with-eval-after-load "isearch"
  (define-key isearch-mode-map (kbd "C-h") 'isearch-del-char))
(add-hook 'isearch-mode-end-hook
          (lambda ()
            (when (and isearch-forward
                       isearch-other-end
                       (not isearch-mode-end-hook-quit))
              (goto-char isearch-other-end))))

;; Dired
;; In macOS, use `gls` instead of `ls`.
;; (when (string= system-type "darwin")
;;   (setq insert-directory-program (executable-find "gls")))
(with-eval-after-load "dired"
  (define-key dired-mode-map (kbd "k") 'dired-kill-subdir))

;; Text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Markdown-mode
(with-eval-after-load "markdown-mode"
  (define-key markdown-mode-map (kbd "M-n")
    (lambda () (interactive) (next-line 5)))
  (define-key markdown-mode-map (kbd "M-p")
    (lambda () (interactive) (next-line -5)))
  (define-key markdown-mode-map (kbd "M-h") 'my-delete-backward-word))

;; Java-mode
(add-hook 'java-mode-hook (lambda () (setq fill-column 100)))

;; Desktop-save
(when (daemonp)
  (desktop-save-mode 1)
  (desktop-read)
  ;; (setq desktop-restore-frames nil)
  (add-hook 'desktop-no-desktop-file-hook (lambda () (desktop-save "~/.emacs.d")))
  (add-hook 'kill-emacs-hook (lambda () (desktop-save "~/.emacs.d"))))
