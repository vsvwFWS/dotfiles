;; ag を検索に使用
(el-get-bundle ag)
(el-get-bundle wgrep)

(el-get-bundle auto-complete)
;; (el-get-bundle company-mode)

(el-get-bundle color-moccur)
(el-get-bundle moccur-edit)

(el-get-bundle ctags)

(el-get-bundle 'eldoc-extension)

(el-get-bundle elscreen)

(el-get-bundle evil)
(el-get-bundle evil-matchit)
(el-get-bundle evil-numbers)
(el-get-bundle evil-surround)
(el-get-bundle evil-tabs)
(el-get-bundle evil-visualstar)

(el-get-bundle fold-dwim)

(el-get-bundle lispxmp)

(el-get-bundle helm)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-gtags)

(el-get-bundle open-junk-file)

(el-get-bundle recentf-ext)

(el-get 'sync)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(package-install 'molokai-theme)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
