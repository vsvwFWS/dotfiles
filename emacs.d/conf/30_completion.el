;;;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)
(evil-define-key 'insert ac-mode-map (kbd "C-SPC") 'auto-complete)
(setq ac-use-menu-map t) ; C-n, C-p を使用するかどうか
(setq ac-use-fuzzy t)
(setq ac-quick-help-delay 0.5)

;; Company-mode
;; (require 'company)
;; 
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-idle-delay 0.1)
;; (setq company-minimum-prefix-length 2)
;; (setq company-selection-wrap-around t)
;; (evil-define-key 'insert company-mode-map (kbd "C-SPC") 'company-complete)

;; (require 'pos-tip)
;; (require 'company-quickhelp)
;; (company-quickhelp-mode 1)
;; (setq company-quickhelp-delay 0.5)

