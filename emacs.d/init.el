;; -*- lexical-binding: t -*-

;; ガベージコレクションの間隔 (Default: 800000B=800kB)
(setq gc-cons-threshold (* 10 1024 1024))

;; Initialize el-get environment.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle init-loader)

;; 設定ファイル分割設定
(require 'init-loader)
(setq init-loader-directory "~/.emacs.d/conf") ; \d\d-[[:filename:]].elc?$ を読み込む
(init-loader-load)

;;;; 環境による設定変更
;; system-type : os の種類
;; window-system : CUI or GUI (terminal の場合 nil)
;; emacs-(minor|major)-version : Emacs のバージョン

;;;; End of package installing.

;;;; require, autoload
(require 'cl)

(require 'open-junk-file)
(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

;; Find file at point [C-x C-f] の強化
(ffap-bindings)
;; dired wdired
(require 'dired-x)
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; Folding 
(require 'hideshow)                     ; Standard
(require 'fold-dwim)                    ; Option

(require 'recentf-ext)
(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 200)
(setq recentf-exclude '("GR?TAGS$" "/var/tmp/" "GPATH$"))

;;;;################################################################################
;;;; Basic settings
;;;;################################################################################
;;; Environment
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(defun mc-use-tab-for-indent ()
  (setq indent-tabs-mode t)) 

;;; Hide Tool bar
(tool-bar-mode -1)
(scroll-bar-mode 0)
(menu-bar-mode 0)
;; 行番号の表示
(global-linum-mode 1)
;; 行のハイライト
;; (global-hl-line-mode 0)

;; 対応する括弧のハイライト
(show-paren-mode 1)

;; Enable saving of minibuffer history
(savehist-mode 1)
;; Save cursor position in each file.
(setq-default save-place t)
(require 'saveplace)

;; ログの記録行数 (Default: 1000)
(setq message-log-max 10000)
;; 履歴の保存数 (Default: 100)

;; キーストロークをエコーエリアにすぐに表示 (Default: 1)
(setq echo-keystrokes 0.1)
;; 大きいファイルを開くときの警告表示 (Default: 10MiB)
(setq large-file-warning-threshold (* 25 1024 1024))
;; 非可視文字の表示
;; (global-whitespace-mode 0)

(fset 'yes-or-no-p 'y-or-n-p)

;;;; Theme
(load-theme 'molokai t t)
(enable-theme 'molokai)

;;;; Written by Emacs. 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
