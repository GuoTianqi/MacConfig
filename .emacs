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
(setq inhibit-splash-screen t)

;;;设置编码
(set-language-environment 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;;
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'chinese-fonts-setup)

;;;hightlight
(global-highlight-parentheses-mode)

(global-linum-mode)
(column-number-mode)
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 高亮选择文本
(transient-mark-mode t)

;;
(setq highlight-thing-delay-seconds 1.5)
(global-highlight-thing-mode)

;;高亮文件被改动的地方
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a

(require 'auto-complete-config)
(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-filename 'ac-source-yasnippet))
(ac-config-default)
(setq ac-auto-start nil)
(setq ac-ignore-case 't)
(setq ac-use-menu-map t)
(setq ac-quick-help-prefer-pos-tip t)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(global-auto-complete-mode)

;;; company-mode
;;(global-company-mode)

;;; C/C++
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; (defun my-c-setup ()
;;   (irony-mode))

;; (add-hook 'c-mode-hook 'my-c-setup)
;; (add-hook 'c++-mode-hook 'my-c-setup)

;; (defun my-irony-mode-hook()
;;   (irony-cdb-autosetup-compile-options)
;;   (require 'company-irony-c-headers)
;;   (add-to-list 'company-backends '(company-irony-c-headers company-irony))
;;   (flycheck-irony-setup)
;;   (irony-eldoc))

;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)

;;; sr-speedbar
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-max-width 300)
(setq sr-speedbar-auto-refresh t)
(setq speedbar-sort-tags t)
(setq speedbar-use-images t)
(setq speedbar-show-unknown-files t)
(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy))

(require 'helm-gtags)
;; Enable helm-gtags-mode
;;(add-hook 'dired-mode-hook 'helm-gtags-mode)
;;(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
;;(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'php-mode-hook 'helm-gtags-mode)

(setq helm-gtags-auto-update t)

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)
     (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
     (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
     (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
     ))

;;; 
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

;;;projectile config
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;; projectile-speedbar
(require 'projectile-speedbar)

;;python
(setq exec-path (cons "/usr/local/Cellar/python3/3.4.3/bin" exec-path))

;; elpy
(elpy-enable)

;; yasnippets
(yas-global-mode 1)

;;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; php
(setq flycheck-php-phpcs-executable "")
(setq flycheck-phpmd-rulesets '("codesize" "design" "naming" "unusedcode"))

;;; go lang
(add-hook 'go-mode-hook (lambda ()
			 (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
						  (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "C-c M-.") 'godef-jump-other-window)))

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
		    :underline t :foreground "green"
		                        :weight 'bold)

(require 'go-autocomplete)

(require 'go-projectile)

;;; end golang

;;; Ruby
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(eval-after-load "ruby-mode"
      '(add-hook 'ruby-mode-hook 'ruby-electric-mode))

(defun my-web-mode-setup ()
  (emmet-mode)
  (require 'ac-emmet)
  (ac-emmet-html-setup)
  (ac-emmet-css-setup)
  (auto-complete-mode t)
  (require 'ac-php)
  (setq ac-sources  '(ac-source-php ))
  (require 'php-auto-yasnippets)
  (payas/ac-setup)
  (php-eldoc-enable)
  (yas-global-mode 1)
  ;;goto define
  (define-key web-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point) 
  ;;go back
  (define-key web-mode-map  (kbd "M-*") 'ac-php-location-stack-back)
  (flycheck-mode t))

;;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-extra-snippets
      '(("erb" . (("toto" . ("<% toto | %>\n\n<% end %>"))))
        ("php" . (("dowhile" . ("<?php do { ?>\n\n<?php } while (|); ?>"))
                  ("debug" . ("<?php error_log(__LINE__); ?>"))))
        ))
  (setq web-mode-enable-heredoc-fontification t)
  (my-web-mode-setup))

(add-hook 'web-mode-hook  'my-web-mode-hook)

;;;无法放在hook里面的设置
;;(setq web-mode-enable-current-element-highlight t)

(setq web-mode-ac-sources-alist
      '(("php" . (ac-source-words-in-buffer ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-php ac-source-php-template ac-source-yasnippet ac-source-php-auto-yasnippets))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-words-in-buffer ac-source-css-property ac-source-emmet-css-snippets))))
;; xdebug geben
(setq geben-dbgp-default-port 10000)

;;; php
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (php-eldoc-enable)
             (php-refactor-mode)
             (yas-global-mode 1)
             (require 'php-auto-yasnippets)
             (payas/ac-setup)
             (require 'ac-php)
             (setq ac-php-use-cscope-flag t)
             (require 'php-ext)
             (setq ac-sources  '(ac-source-php ac-source-abbrev ac-source-php-auto-yasnippets ac-source-gtags ac-source-words-in-buffer ac-source-filename))
             ;; company补全
             (company-mode t)
             ;;(add-to-list 'ac-sources 'ac-source-php)

             (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
             (define-key helm-gtags-mode-map (kbd "M-*") nil)
             (define-key helm-gtags-mode-map (kbd "M-.") nil)
             (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point) ;;goto define
             (define-key php-mode-map  (kbd "M-*") 'ac-php-location-stack-back) ;;go back
             (define-key php-mode-map  (kbd "C-q") 'ac-php-show-tip) ;;显示文档
             (define-key php-mode-map  (kbd "C-c u t") 'ac-php-remake-tags) ;;更新tag
             ))

;;;js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;You may also want to hook it in for shell scripts running via node.js:
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))


;;; c/++ style
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-google-cpplint)
;;      ;; Add Google C++ Style checker.
;;      ;; In default, syntax checked by Clang and Cppcheck.
;;      (flycheck-add-next-checker 'c/c++-clang
;;                                 'c/c++-googlelint 'append)))
(setq c-default-style "stroustrup")

;;; ace-window
(global-set-key (kbd "M-p") 'ace-window)

;;;
(which-function-mode)

;;; CMake
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;;; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")  

;;; dash
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;;; org
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfs--fontsize-steps (quote (4 4 4)) t)
 '(org-export-backends (quote (ascii html icalendar latex md))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
