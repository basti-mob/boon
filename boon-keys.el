;;; boon-keys.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:

;; This module defines various keymaps and portions of keymaps, common
;; to all keyboard layouts.

;;; Code:

(require 'boon-core)

(define-key boon-x-map "x" 'execute-extended-command)

(define-key boon-moves-map  (kbd "<left>") 'left-char)
(define-key boon-moves-map  (kbd "<right>") 'right-char)
(define-key boon-moves-map  (kbd "<up>") 'previous-line)
(define-key boon-moves-map  (kbd "<down>") 'next-line)

(define-key boon-command-map "'" 'boon-toggle-mark)
(define-key boon-command-map [(return)] 'undefined)
(define-key boon-command-map (kbd "<RET>") 'undefined)
(define-key boon-command-map [(backspace)] 'undefined)
(define-key boon-command-map (kbd "<DEL>") 'undefined)
(define-key boon-command-map "`" 'boon-toggle-case)

(dolist (number '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
  (define-key boon-command-map number 'digit-argument))

(defcustom boon-quit-key [escape] "Key to go back to command
state and generally exit local states and modes." :group 'boon
:type 'key-sequence)

(define-key boon-command-map " " 'boon-drop-mark)
(define-key boon-command-map boon-quit-key 'boon-quit)

;; Special mode rebinds
(define-key boon-special-map "`" 'boon-quote-character)
(define-key boon-special-map "'" 'boon-quote-character)
(define-key boon-special-map "x" boon-x-map)
(define-key boon-special-map boon-quit-key 'boon-set-command-state)

;;  Insert mode rebinds
;; (define-key boon-insert-map [remap newline] 'boon-newline-dwim)
(define-key boon-insert-map boon-quit-key 'boon-set-command-state)

;; Global rebinds
(define-key global-map boon-quit-key 'keyboard-quit)
(define-key minibuffer-local-map boon-quit-key 'keyboard-quit)
(define-key minibuffer-local-ns-map boon-quit-key 'keyboard-quit)
(define-key minibuffer-local-completion-map boon-quit-key 'keyboard-quit)
(define-key minibuffer-local-must-match-map boon-quit-key 'keyboard-quit)
(define-key isearch-mode-map boon-quit-key 'isearch-abort)


(provide 'boon-keys)
;;; boon-keys.el ends here
