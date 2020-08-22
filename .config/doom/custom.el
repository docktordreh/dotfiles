(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212337" "#ff5c57" "#5af78e" "#f3f99d" "#57c7ff" "#ff6ac1" "#9aedfe" "#f9f9f9"])
 '(custom-safe-themes
   '("bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" default))
 '(fci-rule-color "#e2e4e5")
 '(jdee-db-active-breakpoint-face-colors (cons "#282a36" "#57c7ff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#282a36" "#5af78e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#282a36" "#848688"))
 '(objed-cursor-color "#ff5c57")
 '(package-selected-packages
   '(xcscope nyan-mode poke-mode org-ref auto-dim-other-buffers counsel-tramp sos org-super-agenda org-chef org-bullets beacon avy))
 '(pdf-view-midnight-colors (cons "#f9f9f9" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5c57" "#5af78e" "#f3f99d" "#57c7ff" "#ff6ac1" "#9aedfe" "#f9f9f9"])
 '(safe-local-variable-values
   '((org-export-allow-bind-keywords . t)
     (eval setq flycheck-clang-include-path
           (list
            (expand-file-name "/usr/include")))
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-babel-tangle))
           nil t)))
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#5af78e")
    (cons 40 "#8df793")
    (cons 60 "#c0f898")
    (cons 80 "#f3f99d")
    (cons 100 "#f7e38c")
    (cons 120 "#fbcd7c")
    (cons 140 "#ffb86c")
    (cons 160 "#ff9e88")
    (cons 180 "#ff84a4")
    (cons 200 "#ff6ac1")
    (cons 220 "#ff659d")
    (cons 240 "#ff607a")
    (cons 260 "#ff5c57")
    (cons 280 "#e06663")
    (cons 300 "#c1716f")
    (cons 320 "#a27b7b")
    (cons 340 "#e2e4e5")
    (cons 360 "#e2e4e5")))
 '(vc-annotate-very-old-color nil)
 '(zoom-ignore-predicates
   '((lambda nil
       (>
        (count-lines
         (point-min)
         (point-max))
        20))))
 '(zoom-ignored-buffer-name-regexps '("^*calc"))
 '(zoom-ignored-buffer-names '("zoom.el" "init.el"))
 '(zoom-ignored-major-modes '(dired-mode markdown-mode treemacs-mode))
 '(zoom-mode t t)
 '(zoom-size '(0.618 . 0.618)))
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
