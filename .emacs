1(setq backup-directory-alist '(("." . "~/.emacsBackup")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;;(add-to-list 'package-archives
  ;;           '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
  
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
  (add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
  ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )

;;;
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))


(show-paren-mode t)
(global-linum-mode)
(column-number-mode)

;; 高亮选择文本
(transient-mark-mode t)
(idle-highlight-mode t)

;; scroll one line at a time (less "jumpy" than defaults)
    
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; (add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete//ac-dict")
(defun ac-common-setup ()
    (add-to-list 'ac-sources 'ac-source-filename))
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

;;; 
;;(require 'helm-config)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (helm-mode 1)

;;;projectile config
(projectile-global-mode)
(setq projectile-enable-caching t)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)

;;python
(setq exec-path (cons "/usr/local/Cellar/python3/3.4.3/bin" exec-path))

;; elpy
(elpy-enable)

;; yasnippets
(yas-global-mode 1)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; go lang
(add-hook 'go-mode-hook (lambda ()
			 (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
						  (local-set-key (kbd "M-.") 'godef-jump)))

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
		    :underline t :foreground "green"
		                        :weight 'bold)

(require 'go-autocomplete)

;;; end golang

;;; Ruby
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(eval-after-load "ruby-mode"
      '(add-hook 'ruby-mode-hook 'ruby-electric-mode))

;;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;;;projectile

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(elpy-rpc-python-command "python3")
 '(mediawiki-site-alist
   (quote
	(("Wikipedia" "http://en.wikipedia.org/w/" "username" "password" "Main Page")
	 ("KmiWiki" "http://192.168.80.70/mediawiki/" "guotianqi" "gtq" "Main Page"))))
 '(show-paren-mode t)
 '(sr-speedbar-right-side nil)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'monokai-theme)
