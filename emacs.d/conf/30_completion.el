;;;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)
(evil-define-key 'insert ac-mode-map (kbd "C-SPC") 'auto-complete)
;; (setq ac-use-menu-map t) ; C-n, C-p を使用するかどうか
(setq ac-use-fuzzy t)
(setq ac-quick-help-delay 1.0)
