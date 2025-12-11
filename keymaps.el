;;; keymaps.el -*- lexical-binding: t; -*-
(map! :nvo"d" #'evil-backward-char    ;; was h
      :nvo "h" #'evil-next-visual-line        ;; was j, also for wrapped multi-line lines to be treated like separate lines
      :nvo "t" #'evil-previous-visual-line    ;; was k, also for wrapped multi-line lines to be treated like separate lines
      :nvo "n" #'evil-forward-char     ;; was l
      :nvo "H" #'evil-join             ;; delete
      :nvo "j" #'evil-delete
      :nvo "J" #'evil-delete-line
      :nvo "-" #'evil-end-of-line
      :nvo "_" #'evil-beginning-of-line
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

;; org mode specific remap
;; universal mappings for org functionalities
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; unmaps d due to org specific keymaps
(after! evil-org
  (evil-define-key 'normal evil-org-mode-map (kbd "d") nil))

