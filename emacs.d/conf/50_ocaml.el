
;; tuareg settings

(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

;; Load setup files from path added above.
(load "tuareg-site-file")
(autoload 'utop "utop" "Toplevel for Ocaml" t)

(setq utop-command "opam config exec -- utop -emacs")

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))

;; Already added above.
;; (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(require 'merlin)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-ac-setup 'easy)

;; (require 'tuareg)
;; (require 'utop)

;; (add-hook 'tuareg-mode-hook 'tuareg-iemenu-set-imenu)
;; (setq auto-mode-alist
;;       (append '(("\\.ml[ily]?$" . tuareg-mode)
;;                 ("\\.topml$" . tuareg-mode))
;;               auto-mode-alist))
;; (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
;; (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
;; (setq merlin-use-auto-complete-mode t)
;; (setq merlin-error-after-save nil)

;; ;; -- merlin setup --
;; (setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
;; (add-to-list 'load-path (concat opam-share "/emacs/site-list"))
;; (require 'merlin)

;; ;; Enable Merlin for ML buffers
;; (add-hook 'tuareg-mode-hook 'merlin-mode)

;; (require 'auto-complete)
;; (setq merlin-ac-setup 'easy)
;; (add-hook 'tuareg-mode-hook 'auto-complete-mode)

