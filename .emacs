;; Emacs configuration file

;; AUTHOR: Pete Vieira

(setq inhibit-startup-message t)	;don't show splash page

;;;;;;;;;;;;;;;;
;; appearance ;;
;;;;;;;;;;;;;;;;

(setq frame-title-format (concat invocation-name "@" system-name ": %b"))

;; use dark background
(add-to-list 'default-frame-alist '(background-mode . dark))

;; unclutter gui
;(tool-bar-mode -1)			;no toolbar
(set-scroll-bar-mode nil)		;no scoll bars

;;;;;;;;;;;;
;;  FONT  ;;
;;;;;;;;;;;;

(set-face-background 'region               "#555555")
(set-face-foreground 'modeline             "white")
(set-face-background 'modeline             "#333333")

(set-face-foreground 'default              "green")


(add-to-list 'default-frame-alist '(background-mode . dark))

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(set-face-background 'default              "#002b36") ; background dark blue
(set-face-attribute 'default nil :family "Menlo" :height 120)
(set-face-attribute 'font-lock-comment-face nil :foreground "#657b83") ; cyan
(set-face-attribute 'font-lock-string-face nil :foreground "#00afaf")
(set-face-attribute 'font-lock-constant-face nil :foreground "#4f004f")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#00003f")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#00003f")
(set-face-attribute 'font-lock-type-face nil :foreground "#000000")

;base02    #073642 ;dark cyan background
;base01    #586e75 ;light cyan
;base00    #657b83 ;dark grey
;base0     #839496 ;light gray
;base1     #93a1a1 ;light gray
;base2     #eee8d5 ;very light purple
;base3     #fdf6e3 ;very light pink
;yellow    #b58900
;orange    #cb4b16
;red       #dc322f
;magenta   #d33682
;violet    #6c71c4
;blue      #268bd2
;cyan      #2aa198
;green     #859900
