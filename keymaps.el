;; keymaps.el -*- lexical-binding: t; -*-

;; Movement remappings (normal, visual, operator)
(map! :nvo "d" #'evil-backward-char     ;; was h
      :nvo "h" #'evil-next-line        ;; was j
      :nvo "t" #'evil-previous-line    ;; was k
      :nvo "n" #'evil-forward-char     ;; was l
      :nvo "H" #'evil-next-line
      ;; Make "j" an operator (like "d", i.e., evil-delete)
      :nvo "j" #'evil-delete
      ;; "J" as a custom lambda (delete whole line)
      :nvo "J"
      (cmd! (evil-delete nil t)))

;; Scroll and recenter (add if you have these to remap)
(map!
 :nvo [remap evil-scroll-down] (cmd! (evil-scroll-down (/ (window-body-height) 2)) (recenter))
 :nvo [remap evil-scroll-up]   (cmd! (evil-scroll-up (/ (window-body-height) 2)) (recenter)))


;; key-chord usage for exiting insert state
(use-package! key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" #'evil-normal-state))

 ;; s and S to evil-ex
(map!
 :n "s" #'evil-ex
 :n "S" #'evil-ex)

 ;; l and L to search next and previous
(map!
 :n "l" #'evil-ex-search-next
 :n "L" #'evil-ex-search-previous)
