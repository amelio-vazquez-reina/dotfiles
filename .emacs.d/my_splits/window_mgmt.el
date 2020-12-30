;;Moving buffers around
(require 'buffer-move)
;; --- Toggling maximization of buffers
(defun toggle-maximize-buffer ()
  "Toggle maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn
        (set-window-configuration my-saved-window-configuration)
        (goto-char my-saved-point))
    (setq my-saved-window-configuration (current-window-configuration)
          my-saved-point (point))
    (delete-other-windows)))

(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
    (set-window-configuration my-saved-window-configuration)
    (progn
      (setq my-saved-window-configuration (current-window-configuration))
      (delete-other-windows))))

(print "Overriding keys for moving between windows")
; ################################################################

; ################################################################
; OVERRIDE KEYBOARD MAPPINGS WITH THIS (Sept. 8, 2014)
; For more see: http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
; ################################################################
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "C-M-j") 'windmove-left)
(define-key my-keys-minor-mode-map (kbd "C-M-l") 'windmove-right)
(define-key my-keys-minor-mode-map (kbd "C-M-i") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-M-k") 'windmove-down)
(define-key my-keys-minor-mode-map (kbd "C-M-y") 'toggle-maximize-buffer)

;; Resizing windows ("bufers")
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
; ################################################################
