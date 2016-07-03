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
