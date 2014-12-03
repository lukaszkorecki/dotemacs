;;; init.el --- loads all customizations and packages
;;; Commentary:
;;; Poorly reinventing Cask ;-)

;;; Code:
(load-file "~/.emacs.d/package/init.el")
(load-file "~/.emacs.d/package/evil-init.el")
(load-file "~/.emacs.d/settings/font-face.el")

(projectile-global-mode)

(setq projectile-use-git-grep t)
(setq projectile-completion-system 'grizzl)

;fonts
; line numbers
(global-linum-mode 1)
; colum number s
(column-number-mode 1)
; whitespaces
(whitespace-mode 1)

; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

; set colors
(require 'color-theme)
(load-theme 'sanityinc-tomorrow-night t)

; strip whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default fill-column 78)

(define-key global-map (kbd "RET") 'newline-and-indent)

; highlight current line
(global-hl-line-mode 1)

; no backup files
(setq-default make-backup-files nil)

(when window-system
  (set-fontset-font t 'unicode "Apple Symbols" nil 'prepend)
  (scroll-bar-mode -1)) ; no scrollbars

(menu-bar-mode -1) ; no menu
(tool-bar-mode -1) ; no toolbar

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell nil)

; always match parens
(show-paren-mode t)

; make clipboard work
(setq x-select-enable-clipboard 0)

; load custom abbreviations
(load-file "~/.emacs.d/abbrevs.el")

; language customizations
(load-file "~/.emacs.d/settings/lang.el")

; load flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; customizations file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(lk/normal-font)


; customize the mode-line
(setq-default
 mode-line-format
 (list
; buffername
  '(:eval (propertize "%f " 'face 'font-lock-keyword-face))
; major mode
  '(:eval (propertize "%m " 'face 'font-lock-comment-face))
; list minor modes
  '(:eavl (propertize 'minor-mode-alist 'face 'font-lock-variable-name-face))
; encoding and line ending
  '(:eval (propertize "%z " 'face 'font-lock-string-face))
  ; modified * / RO % / no changes -
  '(:eval (propertize " %*" 'face 'font-lock-warning-face))
))

(provide 'init)

;;; init.el ends here
