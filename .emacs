(setq backup-directory-alist '(("." . "~/.emacsBackup")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  )

;;;
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(show-paren-mode t)
(global-linum-mode)
(column-number-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 高亮选择文本
(transient-mark-mode t)
(idle-highlight-mode t)

;; scroll one line at a time (less "jumpy" than defaults)
    
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
(setq scroll-step 1) ;; keyboard scroll one line at a
(require 'auto-complete-config)
(defun ac-common-setup ()
    (add-to-list 'ac-sources 'ac-source-filename))
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "M-RET") 'auto-complete)

;;; company-mode
(global-company-mode)
(define-key company-mode-map (kbd "M-/") 'company-complete)

;;; C/C++
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun my-c-setup ()
  (irony-mode))

(add-hook 'c-mode-hook 'my-c-setup)
(add-hook 'c++-mode-hook 'my-c-setup)

(defun my-irony-mode-hook()
  (irony-cdb-autosetup-compile-options)
  (require 'company-irony-c-headers)
  (add-to-list 'company-backends '(company-irony-c-headers company-irony))
  (flycheck-irony-setup)
  (irony-eldoc))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(elpy-rpc-python-command "python3")
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(helm-gtags-prefix-key "g")
 '(helm-gtags-pulse-at-cursor t)
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-use-input-at-cursor t)
 '(mediawiki-site-alist
   (quote
    (("Wikipedia" "http://en.wikipedia.org/w/" "username" "password" "Main Page")
     ("KmiWiki" "http://192.168.80.70/mediawiki/" "guotianqi" "gtq" "Main Page"))))
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil))

;;; sr-speedbar
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-max-width 300)

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
     (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
     (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
     (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)))

;;; 
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

;;;projectile config
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

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

;;; c style
(setq c-default-style "stroustrup")

;;; ace-window
(global-set-key (kbd "M-p") 'ace-window)

;;;
(which-function-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'dark 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

(load-theme 'solarized t)


