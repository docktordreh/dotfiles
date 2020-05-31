;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")


;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq
 doom-font (font-spec :family "Fira Mono" :size 22)
 doom-big-font (font-spec :family "Fira Mono" :size 28)

 doom-format-on-save t

 ; since the default org export does not compile bibliography
 org-latex-pdf-process
   '("lualatex -interaction nonstopmode -output-directory %o %f"
     "biber %b"
     "lualatex -interaction nonstopmode -output-directory %o %f"
     "lualatex -interaction nonstopmode -output-directory %o %f")

org-agenda-sorting-strategy
  (quote ((agenda time-up priority-down category-up)
          (todo todo-state-up priority-up)
          (tags priority-down)))

projectile-project-search-path '("~/Projekte")

indent-tabs-mode nil

org-ref-default-bibliography "~/Papers/references.bib"

org-ref-pdf-directory "~/Papers/bibtex-pdfs"

org-ref-bibliography-notes "~/Papers/notes.org"

org-ref-open-pdf-function
(lambda (fpath)
  (start-process "zathura" "*ivy-bibtex-zathura*" "/usr/bin/zathura" fpath))

org-completion-use-ido t
org-ref-default-citation-link "footcite"
org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("NEXT" . (:foreground "IndianRed1" :weight bold))
        ("TODO" . (:foreground "Yellow1" :weight bold))
        ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold))
        ("CANCELED" . (:foreground "IndianRed2" :weight bold))
        ("DELEGATED" . (:foreground "ForestGreen" :weight bold))
        ("SOMEDAY" . (:foreground "YellowGreen" :weight bold))
        )
org-tag-persistent-alist
      '((:startgroup . nil)
        ("HOME" . ?h)
        ("RESEARCH" . ?r)
        ("TEACHING" . ?t)
        ("STUDYING" . ?s)
        (:endgroup . nil)
        (:startgroup . nil)
        ("MGMT" . ?m)
        ("OS" . ?o)
        ("DEV" . ?d)
        ("WWW" . ?w)
        (:endgroup . nil)
        (:startgroup . nil)
        ("EASY" . ?e)
        ("MEDIUM" . ?m)
        ("HARD" . ?a)
        (:endgroup . nil)
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)
        )
org-tag-faces
      '(
        ("HOME" . (:foreground "AquaMarine4" :weight bold))
        ("RESEARCH" . (:foreground "Seagreen4" :weight bold))
        ("TEACHING" . (:foreground "Green4" :weight bold))
        ("STUDYING" . (:foreground "Springgreen4" :weight bold))
        ("OS" . (:foreground "coral4" :weight bold))
        ("DEV" . (:foreground "tomato1" :weight bold))
        ("MGMT" . (:foreground "yellow1" :weight bold))
        ("WWW" . (:foreground "gray0" :weight bold))
        ("URGENT" . (:foreground "Red" :weight bold))
        ("KEY" . (:foreground "Red" :weight bold))
        ("EASY" . (:foreground "Green1" :weight bold))
        ("MEDIUM" . (:foreground "Yellow1" :weight bold))
        ("HARD" . (:foreground "Red1" :weight bold))
        ("BONUS" . (:foreground "GoldenRod" :weight bold))
        ("noexport" . (:foreground "YellowGreen" :weight bold))
        )
org-fast-tag-selection-single-key t
org-use-fast-todo-selection t
org-latex-default-packages-alist '(
                           (#1="" "graphicx" t)
                           (#1# "longtable" t)
                           (#1# "wrapfig" nil)
                           (#1# "rotating" nil)
                           ("normalem" "ulem" t)
                           (#1# "amsmath" t)
                           (#1# "textcomp" t)
                           (#1# "amssymb" t)
                           (#1# "capt-of" nil)
                           (#1# "hyperref" nil)
                           (#1# "csquotes" nil)
                           )
org-export-with-smart-quotes t

org-clock-idle-time 15

;; aligns company annotations to the right side
company-tooltip-align-annotations t

;; localization
calendar-week-start-day 1
explicit-shell-file-name "/bin/zsh"

)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
;;(flycheck-add-mode 'typescript-tslint 'web-mode)

(after! 'typescript-mode #'setup-tide-mode)
(after! 'before-save-hook 'tide-format-before-save)
(after! 'c++-mode-hook #'clang-format-bindings)
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . typescript-mode))
(add-to-list 'default-frame-alist '(alpha 85 85))
(after! 'org-mode-hook #'org-bullets-mode)
(global-visual-line-mode t)
(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (latex . t)
                               (org . t)
                               (shell . t)
                               (ditaa . t)
                               (plantuml . t)
                               (python . t)
                               )
                             )

;; KEY MAP
;; Avy Jump
(define-key evil-normal-state-map (kbd "M-s") #'avy-goto-char-timer)
(define-key evil-normal-state-map (kbd "M-w") #'avy-goto-word-1)
(define-key evil-motion-state-map (kbd "M-w") #'avy-goto-word-1)


(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/org/refile.org")))

;; open agenda at C-c a
(global-set-key (kbd "C-c a") 'org-agenda)
;; org-agenda list
(global-set-key (kbd "<f12>") 'org-agenda-list)
;; org-capture
(global-set-key (kbd "C-c r") 'org-capture)
;; show todo items for this subtree
(global-set-key (kbd "<f5>") 'bh/org-todo)
;; widen subtree
(global-set-key (kbd "C-<f5>") 'bh/widen)

(defun bh/widen ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (progn
        (org-agenda-remove-restriction-lock)
        (when org-agenda-sticky
          (org-agenda-redo)))
    (widen)))



(defun bh/org-todo (arg)
  (interactive "p")
  (if (equal arg 4)
      (save-restriction
        (bh/narrow-to-org-subtree)
        (org-show-todo-tree nil))
    (bh/narrow-to-org-subtree)
    (org-show-todo-tree nil)))

(defun bh/narrow-to-org-subtree ()
  (widen)
  (org-narrow-to-subtree)
  (save-restriction
    (org-agenda-set-restriction-lock)))
(add-to-list 'bibtex-BibTeX-entry-alist
              '("TechReport" "Technical Report"
               (("author")
               ("title" "Title of the technical report (BibTeX converts it to lowercase)")
               ("institution" "Sponsoring institution of the report")
               ("year"))
               )
              )
(add-to-list 'org-latex-classes
          '("koma-article"
            "\\documentclass[ngerman,12pt]{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; note: not a clean solution. just telling emacs to load the colors from xterm
(add-to-list 'term-file-aliases
    '("st-256color" . "xterm-256color"))

(find-file "~/org/todo.org")
