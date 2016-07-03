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

(setq recentf-max-saved-items 1000)
(setq recentf-max-menu-items 200)
(setq recentf-exclude '("GR?TAGS$" "/var/tmp/" "GPATH$" "bookmarks"))
(require 'recentf-ext)

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

;; バックアップ・オートセーブ
(let ((backup-target-directory "~/.emacs.d/backups/"))
  (unless (file-directory-p backup-target-directory)
    (make-directory backup-target-directory))
  (add-to-list 'backup-directory-alist
               (cons ".*" backup-target-directory))

  (add-to-list 'auto-save-file-name-transforms
               (list ".*" (expand-file-name backup-target-directory) t)))
