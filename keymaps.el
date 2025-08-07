;;; keymaps.el -*- lexical-binding: t; -*-

(map! :nvo "d" #'evil-backward-char    ;; was h
      :nvo "h" #'evil-next-line        ;; was j
      :nvo "t" #'evil-previous-line    ;; was k
      :nvo "n" #'evil-forward-char     ;; was l
      :nvo "H" #'evil-join             ;; delete
      :nvo "j" #'evil-delete
      :nvo "J" #'evil-delete-line
      ;; Ctrl D and Ctrl U recenter
      :nvo [remap evil-scroll-down] (cmd! (evil-scroll-down (/ (window-body-height) 2)) (recenter))
      :nvo [remap evil-scroll-up]   (cmd! (evil-scroll-up (/ (window-body-height) 2)) (recenter))
      ;; unmap
      :n "D" nil
      :n "k" nil)

;; key-chord usage for exiting insert state
(use-package! key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" #'evil-normal-state))

 ;;  and S to :
(map!
 :n "s" #'evil-ex
 :n "S" #'evil-ex)

(map!
 :n "l" #'evil-ex-search-next
 :n "L" #'evil-ex-search-previous)
