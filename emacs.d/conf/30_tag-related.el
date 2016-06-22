(require 'evil)
;; Ctags and Gtags settings
(require 'ctags)
(setq tags-revert-without-query t)
(setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
;; (global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)

;; Use helm-gtags-mode instead of gtags-mode.
;; (require 'gtags)
;; (add-hook 'c-mode-common-hook 'gtags-mode)
;; (add-hook 'c++-mode-hook 'gtags-mode)
;; (add-hook 'java-mode-hook 'gtags-mode)

;; (evil-define-key 'motion gtags-mode-map (kbd "M-]") 'gtags-find-tag-from-here)
;; (evil-define-key 'motion gtags-mode-map (kbd "M-t") 'gtags-pop-stack)
;; (evil-define-key 'motion gtags-mode-map (kbd "g M-]") 'gtags-find-tag-other-window)

