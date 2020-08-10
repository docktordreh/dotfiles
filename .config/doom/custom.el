(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-babel-tangle))
           nil t))))
 '(zoom-mode t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-modified ((t (:foreground "#57c7ff"))))
 '(doom-modeline-evil-insert-state ((t (:weight bold :foreground "#339CDB"))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark violet"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#fe747e" :height 2.0 :underline nil))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#c2e78c" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#fe747e" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#7987ce" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#fec676" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#bf98fe"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#c2e78c"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#81a9fe"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#c7d2f4"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
