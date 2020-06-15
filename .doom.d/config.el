;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")

(add-to-list 'auto-mode-alist '("'" . org-mode) t)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-hook 'emacs-startup-hook 'delete-other-windows t)

(setq  indent-tabs-mode nil)

(setq message-kill-buffer-on-exit t)

(setq calendar-week-start-day 1)

(setq company-tooltip-align-annotations t)

(setq explicit-shell-file-name "/bin/zsh")

(setq  uniquify-buffer-name-style 'forward)

(setq window-combination-resize t)

(setq undo-limit 80000000)

(setq evil-want-fine-undo t)

(setq auto-save-default t)

(beacon-mode)

(setq inhibit-compacting-font-caches t)

(setq truncate-string-ellipsis "…")

(setq +ivy-buffer-preview t)

(setq company-idle-delay nil)

(setq require-final-newline nil)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(global-whitespace-mode +1)

(global-visual-line-mode +1)

(display-time-mode +1)
(display-battery-mode +1)

(setq fancy-splash-image (concat doom-private-dir "splash.png"))

(setq-default large-file-warning-threshold 100000000)

(setq mouse-yank-at-point t)

(setenv "PATH" (concat (getenv "PATH") ":/opt/texlive/2020/bin/x86_64-linux"))
(setq exec-path (append exec-path '("/opt/texlive/2020/bin/x86_64-linux")))

(setenv "PATH" (concat (getenv "PATH") ":/home/valentin/.cargo/bin"))
(setq exec-path (append exec-path '("/home/valentin/.cargo/bin")))

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "#57c7ff"))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

(add-to-list 'default-frame-alist '(alpha 90 90))

(setq
 doom-font                          (font-spec :family "FiraCode Nerd Font Mono" :size 24)
 doom-big-font                   (font-spec :family "FiraCode Nerd Font Mono" :size 36)
 doom-variable-pitch-font (font-spec :family "ETBembo" :size 36)
 doom-serif-font                (font-spec :family "Liberation Serif" :weight 'light))

(setq doom-theme 'doom-snazzy)

(setq display-line-numbers-type 'relative)

(custom-set-faces! '(doom-modeline-evil-insert-state
                     :weight bold
                     :foreground "#339CDB"))

(map! :map evil-window-map "SPC" #'rotate-layout)

(setq
 projectile-project-search-path '("~/Projekte"))

(setq
 org-directory "~/Daten/cloud/tlaloc/org/"
 org-archive-location (concat org-directory ".archive/$s::")
)

(after! org
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(setq
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("■" "◆" "▲" "▶")
)

 (custom-theme-set-faces
  'user
  '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
  '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

 (custom-theme-set-faces
  'user
  '(org-block ((t (:inherit fixed-pitch))))
  '(org-code ((t (:inherit (shadow fixed-pitch)))))
  '(org-document-info ((t (:foreground "dark orange"))))
  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
  '(org-link ((t (:foreground "royal blue" :underline t))))
  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  '(org-property-value ((t (:inherit fixed-pitch))) t)
  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setq org-hide-leading-stars t)

(setq org-src-fontify-natively t)

(setq org-pretty-entities t)
(add-hook 'org-mode-hook 'variable-pitch-mode)

(add-hook 'org-mode-hook 'variable-pitch-mode)

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(setq
 org-fontify-whole-heading-line t
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t)

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'auto-fill-mode)

(setq org-enforce-todo-dependencies t)
(setq org-insert-heading-respect-content nil)
(setq org-reverse-note-order nil)
(setq org-deadline-warning-days 7)
(setq org-blank-before-new-entry (quote ((heading . t)
                                         (plain-list-item . nil))))

(require 'org-inlinetask)

(defun scimax/org-return (&optional ignore)
  "Add new list item, heading or table row with RET.
A double return on an empty element deletes it.
Use a prefix arg to get regular RET. "
  (interactive "P")
  (if ignore
      (org-return)
    (cond
     ((eq 'line-break (car (org-element-context)))
      (org-return-indent))
     ;; Open links like usual
     ((eq 'link (car (org-element-context)))
      (org-open-at-point-global))
     ;; It doesn't make sense to add headings in inline tasks. Thanks Anders
     ;; Johansson!
     ((org-inlinetask-in-task-p)
      (org-return))
     ;; add checkboxes
     ((org-at-item-checkbox-p)
      (org-insert-todo-heading nil))
     ;; lists end with two blank lines, so we need to make sure we are also not
     ;; at the beginning of a line to avoid a loop where a new entry gets
     ;; created with only one blank line.
     ((and (org-in-item-p) (not (bolp)))
      (if (org-element-property :contents-begin (org-element-context))
          (org-insert-heading)
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")
        (org-return)))
     ;;disabled;; ((org-at-heading-p)
     ;;disabled;;  (if (not (string= "" (org-element-property :title (org-element-context))))
     ;;disabled;;      (progn (org-end-of-meta-data)
     ;;disabled;;             (org-insert-heading))
     ;;disabled;;    (beginning-of-line)
     ;;disabled;;    (setf (buffer-substring
     ;;disabled;;           (line-beginning-position) (line-end-position)) "")))
     ((org-at-table-p)
      (if (-any?
           (lambda (x) (not (string= "" x)))
           (nth
            (- (org-table-current-dline) 1)
            (org-table-to-lisp)))
          (org-return)
        ;; empty row
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")
        (org-return)))
     (t
      (org-return)))))


(define-key org-mode-map (kbd "RET")
  'scimax/org-return)

(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "C-<f5>") 'bh/widen)

(defun bh/widen ()
  "This here widens a restricted subtree"
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (progn
        (org-agenda-remove-restriction-lock)
        (when org-agenda-sticky
          (org-agenda-redo)))
    (widen)))



(defun bh/org-todo (arg)
  "This filters a subtree by todos"
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

(setq deft-extensions '("org"))
(setq deft-directory "~/Daten/cloud/tlaloc/org")

(setq
 org-capture-templates
 '(("i" "Send to inbox" entry (file+headline "~/Daten/cloud/tlaloc/org/inbox.org" "Inbox")
    "* TODO %?\n")))

(global-set-key (kbd "C-c o")
  (lambda () (interactive) (find-file (concat org-directory "refile.org"))))

(setq org-agenda-files (list org-directory))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(setq org-hierarchical-todo-statistics t)

(add-hook 'org-mode-hook
          (lambda ()
            (push '("TODO"  . ?▲) prettify-symbols-alist)
            (push '("DONE"  . ?✓) prettify-symbols-alist)
            (push '("CANCELLED"  . ?✘) prettify-symbols-alist)
            (push '("WAITING"  . ?…) prettify-symbols-alist)
            (push '("SOMEDAY"  . ??) prettify-symbols-alist)))

(setq org-fontify-done-headline t)
(custom-set-faces
 '(org-done ((t (:foreground "PaleGreen"
                 :weight normal
                 :strike-through t))))
 '(org-headline-done
   ((((class color) (min-colors 16) (background dark))
     (:foreground "LightSalmon" :strike-through t)))))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f12>") 'org-agenda-list)

(setq org-agenda-sorting-strategy
  (quote ((agenda time-up priority-down category-up)
          (todo todo-state-up priority-up)
          (tags priority-down))))

  ;; ! => insert timestamp
  ;; @ => insert note
  ;; / => enter state
  ;; (x) => shortcut (after C-c C-t)
  ;; after the |: close todo
(setq  org-todo-keywords '((sequence  "DELEGATED(l@/!)" "SOMEDAY(f)" "IDEA(i@/!)"
  "TODO(t@/!)" "STARTED(s@/!)" "NEXT(n@/!)" "WAITING(w@/!)" "|" "DONE(d@/!)"
  "CANCELED(c@/!)")))

(setq  org-todo-keyword-faces
  '(("IDEA" . (:foreground "GoldenRod" :weight bold))
    ("NEXT" . (:foreground "IndianRed1" :weight bold))
    ("TODO" . (:foreground "Yellow1" :weight bold))
    ("STARTED" . (:foreground "OrangeRed" :weight bold))
    ("WAITING" . (:foreground "coral" :weight bold))
    ("CANCELED" . (:foreground "IndianRed2" :weight bold))
    ("DELEGATED" . (:foreground "ForestGreen" :weight bold))
    ("SOMEDAY" . (:foreground "YellowGreen" :weight bold))
    )
)

(setq
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
)

(setq
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
  )

(setq org-todo-repeat-to-state "NEXT")

(setq
  org-fast-tag-selection-single-key t
  org-use-fast-todo-selection t
)

(setq
 org-ref-default-bibliography "~/Daten/cloud/tlaloc/org/Papers/references.bib"

 org-ref-pdf-directory "~/Daten/cloud/tlaloc/org/Papers/bibtex-pdfs"

 org-ref-bibliography-notes "~/Daten/cloud/tlaloc/org/Papers/notes.org"
 org-ref-open-pdf-function
 (lambda (fpath)
   (start-process "zathura" "*ivy-bibtex-zathura*" "/usr/bin/zathura" fpath))
)

(setq org-ref-default-citation-link "footcite")

(setq org-latex-prefer-user-labels t)

(setq org-export-with-smart-quotes t)

(setq
 org-latex-pdf-process
 '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "biber %b"
   "makeglossaries %f"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

'(org-preview-latex-process-alist
  (quote
   ((dvipng :programs
            ("lualatex" "dvipng")
            :description "dvi > png"
            :message "you need to install the programs: latex and dvipng."
            :image-input-type "dvi"
            :image-output-type "png"
            :image-size-adjust
            (1.0 . 1.0)
            :latex-compiler
            ("lualatex -output-format dvi -interaction nonstopmode -output-directory %o %f")
            :image-converter
            ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))
    (dvisvgm :programs
             ("latex" "dvisvgm")
             :description "dvi > svg"
             :message "you need to install the programs: latex and dvisvgm."
             :use-xcolor t
             :image-input-type "xdv"
             :image-output-type "svg"
             :image-size-adjust
             (1.7 . 1.5)
             :latex-compiler
             ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvisvgm %f -n -b min -c %S -o %O"))
    (imagemagick :programs
                 ("latex" "convert")
                 :description "pdf > png"
                 :message "you need to install the programs: latex and imagemagick."
                 :use-xcolor t
                 :image-input-type "pdf"
                 :image-output-type "png"
                 :image-size-adjust
                 (1.0 . 1.0)
                 :latex-compiler
                 ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                 :image-converter
                 ("convert -density %D -trim -antialias %f -quality 100 %O")))))

(after! ox-latex
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[ngerman,12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-to-list 'org-latex-classes
             '("mimosis"
               "\\documentclass{mimosis}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]
\\newcommand{\\mboxparagraph}[1]{\\paragraph{#1}\\mbox{}\\\\}
\\newcommand{\\mboxsubparagraph}[1]{\\subparagraph{#1}\\mbox{}\\\\}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\mboxparagraph{%s}" . "\\mboxparagraph*{%s}")
               ("\\mboxsubparagraph{%s}" . "\\mboxsubparagraph*{%s}")))

;; Elsarticle is Elsevier class for publications.
(add-to-list 'org-latex-classes
             '("elsarticle"
               "\\documentclass{elsarticle}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-default-packages-alist
      '(
        ("" "float" nil)
        ("" "booktabs" nil)
        ("" "lscape" nil)
        ("" "hyphenat" nil)
        ;; drawing
        ("" "microtype" nil)
        ("" "tikz" nil)
        ;; this is for having good fonts
        ("" "lmodern" nil)
        ;; This makes standard margins
        ("left=3.0cm, right=3.0cm,top=2.5cm,bottom=3cm" "geometry" nil)
        ("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "wrapfig" nil)      ;makes it possible to wrap text around figures
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ;; These provide math symbols
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "amssymb" t)
        ("" "amsmath" t)
        ("theorems, skins" "tcolorbox" t)
        ;; used for marking up chemical formulars
        ("version=3" "mhchem" t)
        ("numbers,super,sort&compress" "natbib" nil)
        ("" "natmove" nil)
        ("" "url" nil)
        ;; this is used for syntax highlighting of code
        ("cache=false" "minted" nil)
        ("" "listings" nil)
        ("linktocpage,pdfstartview=FitH,colorlinks,
linkcolor=blue,anchorcolor=blue,
citecolor=blue,filecolor=blue,menucolor=blue,urlcolor=blue"
         "hyperref" nil)
        ("onehalfspacing" "setspace" nil)
        ;; enables you to embed files in pdfs
        ("" "attachfile" nil)
    ))

(setq
 org-export-in-background t
 org-export-async-init-file (concat doom-private-dir "init-org-async.el"))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(setq magit-repository-directories '(("~/Projekte" . 2)))

(setq
 magit-save-repository-buffers nil
 magit-inhibit-save-previous-winfconf t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(flycheck-add-mode 'javascript-eslint 'web-mode)

(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
(yas-global-mode 1)
