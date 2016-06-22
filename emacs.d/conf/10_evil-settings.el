;;;; Evil global settings
;;; Values shoud be defined before requiring packages
(setq evil-flash-delay 5)


;;; Enable evil mode
(require 'evil)
(evil-mode 1)
(evil-define-key 'motion global-map (kbd "M-v") #'evil-scroll-up)
;; (evil-define-key 'motion dired-mode-map (kbd "C-z") #'evil-emacs-state)
;; (evil-define-key 'emacs dired-mode-map (kbd "C-z") #'evil-exit-emacs-state)

(evil-set-initial-state 'Info-mode 'emacs)
;; (evil-set-initial-state 'dired-mode 'emacs)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'evil-numbers)
(evil-define-key 'normal global-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(evil-define-key 'normal global-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(evil-define-key 'normal global-map (kbd "C-x C-f") nil)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-tabs)
(elscreen-start)
(global-evil-tabs-mode 1)

(require 'evil-visualstar)
(global-evil-visualstar-mode 1)
