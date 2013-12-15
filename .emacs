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
