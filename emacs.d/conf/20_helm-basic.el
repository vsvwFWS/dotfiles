;; Helm Settings
(require 'evil)                         ; for evil key-mappin

(require 'helm-config)
(require 'helm-descbinds)
(require 'helm-gtags)

(define-key global-map (kbd "C-c h m") #'helm-mini)
(define-key global-map (kbd "C-c h x") #'helm-M-x)
(define-key global-map (kbd "C-c h f") #'helm-for-files)
(define-key global-map (kbd "M-y")     #'helm-show-kill-ring)
;; (define-key global-map (kbd "C-c h F") #'helm-find-files)

;; M-x を helm に M-g M-x を通常の M-x に設定
(define-key global-map (kbd "M-x")     #'helm-M-x)
(define-key global-map (kbd "M-g M-x") #'execute-extended-command)

;; helm-gtags-mode mappings
(add-hook 'c-mode-common-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)

(evil-define-key 'motion helm-gtags-mode-map (kbd "M-]") #'helm-gtags-find-tag-from-here)
(evil-define-key 'motion helm-gtags-mode-map (kbd "M-t") 'helm-gtags-pop-stack)
(evil-define-key 'motion helm-gtags-mode-map (kbd "g M-]") 'helm-gtags-find-tag-other-window)

(helm-mode 0)
