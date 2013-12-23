;; Emacs configuration file

;; AUTHOR: Pete Vieira

;;;;;;;;;;;;;;
;; packages ;;
;;;;;;;;;;;;;;

;; Marmalade package manager for emacs
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;
;; appearance ;;
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


;; Solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;;;;;;;;;;;;
;;  FONT  ;;
;;;;;;;;;;;;

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;;;;;;;;;;;;;;;;;;;
;; Auto-Complete ;;
;;;;;;;;;;;;;;;;;;;

;; http://cx4a.org/software/auto-complete/manual.html#Installation
;; make install DIR=$HOME/.emacs.d/

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;
;; ROS-EMACS ;;
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

(setq-default tab-width 4)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(set-face-attribute 'default nil :height 105)

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
