;; Emacs configuration file

;; AUTHOR: Pete Vieira

;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGER ;;
;;;;;;;;;;;;;;;;;;;;;

;; Marmalade package manager for emacs
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;
;; APPEARANCE ;;
;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq frame-title-format (concat invocation-name "@" system-name ": %b"))

;; unclutter gui
(tool-bar-mode -1)			;no toolbar
(set-scroll-bar-mode nil)		;no scoll bars
(setq inhibit-startup-message t)	;don't show splash page

;; font
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;; tabbing and indenting
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; font size
(set-face-attribute 'default nil :height 105)

;; scrolling behavior (default 2 lines at a time. 5 with shift key, 20 with control key)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 5) ((control) . 20)))
(setq mouse-wheel-progressive-speed nil)

;;;;;;;;;;;;;;;;;;;
;; Auto-Complete ;; Install using marmalade (M-x package-install)
;;;;;;;;;;;;;;;;;;;
;; http://cx4a.org/software/auto-complete/manual.html#Installation
;; make install DIR=$HOME/.emacs.d/
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;
;; SEMANTIC ;; built into Emacs24
;;;;;;;;;;;;;;

(require 'semantic/ia)                  ; more advanced functionality for name completion
(require 'semantic/bovine/gcc)          ; get standard C/C++ headers
(require 'semantic/db)
(require 'semantic/analyze)
(require 'cedet-cscope)
(require 'cedet-global)
(require 'semantic/imenu)
(require 'semantic/idle)

;; IMENU ;; built into Emacs24
(defun my-semantic-hook ()              ; add imenu
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


(setq-mode-local c-mode semanticdb-find-default-throttle ; optimization
                 '(project unloaded system recursive))

;; (when (cedet-gnu-global-version-check t) ; enable support for gnu global
;(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode);)
  ;; (setq semanticdb-default-submodes '(global-semantic-idle-scheduler-mode
  ;;                                     global-semanticdb-minor-mode))

(defun my-add-cedet-bindings ()         ; bind commands to keys
  (local-set-key (kbd "C-<return>") 'ac-complete-semantic) ; show autocomplete popup menu!
  (local-set-key (kbd ">") 'semantic-complete-self-insert)
  (local-set-key (kbd ".") 'semantic-complete-self-insert)
  (local-set-key (kbd "C-c p") 'semantic-ia-show-summary) ; show quick summary of function/type under point
  (local-set-key (kbd "M-.") 'semantic-ia-fast-jump))     ; jump to header of function/type under point
(add-hook 'c-mode-common-hook 'my-add-cedet-bindings)
(add-hook 'c++-mode-common-hook 'my-add-cedet-bindings)

(defun my-c-mode-cedet-hook ()          ; use autocomplete bindings to get names completion
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(semantic-mode 1)                       ; activate semantic-mode
(setq ac-auto-show-menu 0.4)            ; popup delay time
(setq ac-auto-start t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB (Emacs Code Browser) ;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version in Emacs24 doesn't support Cedet 2.0 so I
;; compiled from https://github.com/alexott/ecb into ~/.emacs.d/
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)

(setq ecb-layout-name "left2")          ; use this layout (http://ecb.sourceforge.net/docs/Changing-the-ECB-layout.html)
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-layout-window-sizes           ; set window sizes
      (quote (("left2" (ecb-directories-buffer-name 0.11439114391143912 . 0.4852941176470588)
               (ecb-sources-buffer-name 0.11439114391143912 . 0.5)))))
(setq ecb-options-version "2.40")
(setq ecb-tip-of-the-day nil)           ; don't show tip-of-day on startup
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)) ; use mouse left-click
(setq ecb-source-path (quote "~/myRepos/")) ; default path

;;;;;;;;;;;;;;;
;; Ros-EMACS ;;
;;;;;;;;;;;;;;;

;; Load the library and start it up
;;(require 'rosemacs)
;;(invoke-rosemacs)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
;;(global-set-key "\C-x\C-r" ros-keymap)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOM KEY-BINDINGS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

; comment or uncomment line or region with Meta-'
(defun toggle-comment-or-uncomment-line-or-region ()
  "comment or uncomment current line"
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
)
(global-set-key "\M-'" 'toggle-comment-or-uncomment-line-or-region)
