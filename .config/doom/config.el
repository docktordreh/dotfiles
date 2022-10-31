;;; config.el -*- lexical-binding: t; -*-

;; [[file:config.org::*Personal information][Personal information:1]]
(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")
;; Personal information:1 ends here

;; [[file:config.org::*Personal information][Personal information:2]]
(setq auth-sources '("~/.config/auth/authinfo.gpg")
      auth-source-cache-expiry nil) ; default is 7200 (2h)
;; Personal information:2 ends here

;; [[file:config.org::*Personal information][Personal information:3]]
(setq calendar-week-start-day 1)
;; Personal information:3 ends here

;; [[file:config.org::*Fontset][Fontset:1]]
(setq doom-font (font-spec
                    :family "Iosevka"
                    :size 22
                    :weight 'extralight)
      doom-variable-pitch-font (font-spec
                                :family "Iosevka"
                                :weight 'extralight
                                :size 22)
      doom-big-font (font-spec
                     :family "Iosevka"
                     :weight 'light
                     :size 24)
      doom-serif-font (font-spec
                       :family "Iosevka"
                       :weight 'extralight
                       :size 22))
;; Fontset:1 ends here

;; [[file:config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-moonlight)
;; Theme:1 ends here

;; [[file:config.org::*Theme][Theme:2]]
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
;; Theme:2 ends here

;; [[file:config.org::*Line numbering][Line numbering:1]]
(setq display-line-numbers-type 'relative)
;; Line numbering:1 ends here

;; [[file:config.org::*Nyan Mode][Nyan Mode:1]]
(nyan-mode 0)
(use-package! nyan-mode
  :config
  (setq nyan-animate-nyancat t)
  (setq nyan-wavy-trail t))
;; Nyan Mode:1 ends here

;; [[file:config.org::*Poke-Line][Poke-Line:1]]
(use-package! poke-line
  :config
  (poke-line-global-mode 1)
  (poke-line-set-pokemon "magikarp"))
;; Poke-Line:1 ends here

;; [[file:config.org::*Default encoding][Default encoding:1]]
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; Default encoding:1 ends here

;; [[file:config.org::*Tabs vs whitespaces?!][Tabs vs whitespaces?!:1]]
(setq  indent-tabs-mode nil)
;; Tabs vs whitespaces?!:1 ends here

;; [[file:config.org::*Window Layout][Window Layout:1]]
(setq window-combination-resize t)
;; Window Layout:1 ends here

;; [[file:config.org::*Better Undo][Better Undo:1]]
(setq evil-want-fine-undo t)
;; Better Undo:1 ends here

;; [[file:config.org::*Autosaving][Autosaving:1]]
(setq auto-save-default t)
;; Autosaving:1 ends here

;; [[file:config.org::*Better ellipsis][Better ellipsis:1]]
(setq truncate-string-ellipsis "…")
;; Better ellipsis:1 ends here

;; [[file:config.org::*Final newline in files?!][Final newline in files?!:1]]
(setq require-final-newline nil)
;; Final newline in files?!:1 ends here

;; [[file:config.org::*Mouse-pasting][Mouse-pasting:1]]
(setq mouse-yank-at-point t)
;; Mouse-pasting:1 ends here

;; [[file:config.org::*Autocompletion][Autocompletion:1]]
(setq company-idle-delay nil)
;; Autocompletion:1 ends here

;; [[file:config.org::*Whitespace Mode][Whitespace Mode:1]]
(add-hook 'prog-mode-hook #'whitespace-mode)
;; Whitespace Mode:1 ends here

;; [[file:config.org::*Rainbows][Rainbows:1]]
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)
;; Rainbows:1 ends here

;; [[file:config.org::*Rainbows][Rainbows:2]]
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; Rainbows:2 ends here

;; [[file:config.org::*Visual Line][Visual Line:1]]
(global-visual-line-mode +1)
;; Visual Line:1 ends here

;; [[file:config.org::*Modeline settings][Modeline settings:1]]
(display-time-mode +1)
(display-battery-mode +1)
;; Modeline settings:1 ends here

;; [[file:config.org::*Modeline settings][Modeline settings:2]]
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)
;; Modeline settings:2 ends here

;; [[file:config.org::*Treemacs][Treemacs:1]]
(after! treemacs
  (defvar treemacs-file-ignore-extensions '()
    "File extension which 'treemacs-ignore-filter' will ensure are ignored")
  (defvar treemacs-file-ignore-globs '()
    "Globs which will are transformed to 'treemacs-file-ignore-regexps' which 'treemacs-ignore-filter' will ensure are ignored")
  (defvar treemacs-file-ignore-regexps '()
    "RegExps to be tested to ignore files, generated from 'treeemacs-file-ignore-globs'")
  (defun treemacs-file-ignore-generate-regexps ()
    "Generate 'treemacs-file-ignore-regexps' from 'treemacs-file-ignore-globs'"
    (setq treemacs-file-ignore-regexps (mapcar 'dired-glob-regexp treemacs-file-ignore-globs)))
  (if (equal treemacs-file-ignore-globs '()) nil (treemacs-file-ignore-generate-regexps))
  (defun treemacs-ignore-filter (file full-path)
    "Ignore files specified by 'treemacs-file-ignore-extensions', and 'treemacs-file-ignore-regexps'"
    (or (member (file-name-extension file) treemacs-file-ignore-extensions)
        (let ((ignore-file nil))
          (dolist (regexp treemacs-file-ignore-regexps ignore-file)
            (setq ignore-file (or ignore-file (if (string-match-p regexp full-path) t nil)))))))
  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-filter))
;; Treemacs:1 ends here

;; [[file:config.org::*Treemacs Blocklist][Treemacs Blocklist:1]]
(setq treemacs-file-ignore-extensions '(;; LaTeX
                                        "aux"
                                        "ptc"
                                        "fdb_latexmk"
                                        "bbl"
                                        "fls"
                                        "synctex.gz"
                                        "toc"
                                        ;; LaTeX - glossary
                                        "glg"
                                        "glo"
                                        "gls"
                                        "glsdefs"
                                        "ist"
                                        "acn"
                                        "acr"
                                        "alg"
                                        ;; LaTeX - pgfplots
                                        "mw"
                                        ;; LaTeX - pdfx
                                        "pdfa.xmpi"
                                        ;; Python Compiled
                                        "pyc"
                                        ;; Elisp compiled
                                        "elc"
                                        ))
(setq treemacs-file-ignore-globs '(;; LaTeX
                                   "*/_minted-*"
                                   ;; AucTeX
                                   "*/.auctex-auto"
                                   "*/_region_.log"
                                   "*/_region_.tex"))
;; Treemacs Blocklist:1 ends here

;; [[file:config.org::*Org][Org:1]]
(setq org-directory "~/Nextcloud/org/"
      org-archive-location (concat org-directory ".archive/$s::"))
;; Org:1 ends here

;; [[file:config.org::*Symbol mapping][Symbol mapping:1]]
(use-package! org
;; Symbol mapping:1 ends here

;; [[file:config.org::*Configuring org][Configuring org:1]]
:config
;; Configuring org:1 ends here

;; [[file:config.org::*Org Style][Org Style:1]]
(setq
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("✿" "■" "◆" "▲" "#")
  org-priority-highest ?A
  org-priority-lowest ?E
  org-priority-faces
  '((?A . 'all-the-icons-red)
    (?B . 'all-the-icons-orange)
    (?C . 'all-the-icons-yellow)
    (?D . 'all-the-icons-green)
    (?E . 'all-the-icons-blue)))
;; Org Style:1 ends here

;; [[file:config.org::*Org Style][Org Style:2]]
(setq global-org-pretty-table-mode t)
;; Org Style:2 ends here

;; [[file:config.org::*Org Style][Org Style:3]]
(setq org-use-property-inheritance t)
;; Org Style:3 ends here

;; [[file:config.org::*Org Style][Org Style:4]]
(custom-set-faces!
  '(outline-1 :weight extra-bold :height 1.25)
  '(outline-2 :weight bold :height 1.15)
  '(outline-3 :weight bold :height 1.12)
  '(outline-4 :weight semi-bold :height 1.09)
  '(outline-5 :weight semi-bold :height 1.06)
  '(outline-6 :weight semi-bold :height 1.03)
  '(outline-8 :weight semi-bold)
  '(outline-9 :weight semi-bold))
;; Org Style:4 ends here

;; [[file:config.org::*Org Style][Org Style:5]]
(custom-set-faces!
    '(org-document-title :height 1.2))
;; Org Style:5 ends here

;; [[file:config.org::*Org Style][Org Style:6]]
(setq org-hide-leading-stars t)
;; Org Style:6 ends here

;; [[file:config.org::*Org Style][Org Style:7]]
(setq org-src-fontify-natively t)
;; Org Style:7 ends here

;; [[file:config.org::*Org Style][Org Style:8]]
(add-hook! 'org-mode-hook #'+org-pretty-mode
           'org-fragtog-mode
           'mixed-pitch-mode)
(setq global-org-pretty-table-mode t)
(setq
 org-fontify-whole-heading-line t
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t)
;; Org Style:8 ends here

;; [[file:config.org::*Org Style][Org Style:9]]
(setq org-agenda-breadcrumbs-seperator " ❱ ")
;; Org Style:9 ends here

;; [[file:config.org::*Org Style][Org Style:10]]
(setq org-hide-emphasis-markers t)
;; Org Style:10 ends here

;; [[file:config.org::*Org Style][Org Style:11]]
(appendq! +ligatures-extra-symbols
            `(:checkbox      "☐"
              :pending       "◼"
              :checkedbox    "☑"
              :list_property "∷"
              :results       ""
              :property      "☸"
              :properties    "⚙"
              :end           "∎"
              :options       "⌥"
              :title         "𝙏"
              :subtitle      "𝙩"
              :author        "𝘼"
              :date          "𝘿"
              :latex_header  "⇥"
              :latex_class   "🄲"
              :beamer_header "↠"
              :begin_quote   "❮"
              :end_quote     "❯"
              :begin_export  "⬇"
              :end_export    "⬆"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
              :em_dash       "—"))
    (plist-put +ligatures-extra-symbols
               :name "›")
  (set-ligatures! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[x]"
    :list_property "::"
    :results       "#+results:"
    :property      "#+property:"
    :property      ":properties:"
    :end           ":end:"
    :options       "#+options:"
    :title         "#+title:"
    :subtitle      "#+subtitle:"
    :author        "#+author:"
    :date          "#+date:"
    :latex_class   "#+latex_class:"
    :latex_header  "#+latex_header:"
    :beamer_header "#+beamer_header:"
    :begin_quote   "#+begin_quote"
    :end_quote     "#+end_quote"
    :begin_export  "#+begin_export"
    :end_export    "#+end_export"
    :priority_a    "[#a]"
    :priority_b    "[#b]"
    :priority_c    "[#c]"
    :priority_d    "[#d]"
    :priority_e    "[#e]"
    :em_dash       "---")
;; Org Style:11 ends here

;; [[file:config.org::*Lines][Lines:1]]
(remove-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)
;; Lines:1 ends here

;; [[file:config.org::*Lines][Lines:2]]
(add-hook 'org-mode-hook '(lambda () (setq fill-column 70)))
(add-hook 'org-mode-hook 'auto-fill-mode)
;; Lines:2 ends here

;; [[file:config.org::*TODOs][TODOs:1]]
(setq org-enforce-todo-dependencies t)
(setq org-insert-heading-respect-content nil)
(setq org-reverse-note-order nil)
(setq org-deadline-warning-days 7)
(setq org-blank-before-new-entry (quote ((heading . t)
                                         (plain-list-item . nil))))
;; TODOs:1 ends here

;; [[file:config.org::*Smart parentheses][Smart parentheses:1]]
(sp-local-pair
     '(org-mode)
     "<<" ">>"
     :actions '(insert))
;; Smart parentheses:1 ends here

;; [[file:config.org::*Refile][Refile:1]]
(global-set-key (kbd "C-c o")
  (lambda () (interactive) (find-file (concat org-directory "refile.org"))))
;; Refile:1 ends here

;; [[file:config.org::*Org Super Agenda][Org Super Agenda:1]]
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :todo "TODAY"
                                :scheduled today
                                :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                                 :todo "NEXT"
                                 :order 1)
                          (:name "Important"
                                 :tag "Important"
                                 :priority "A"
                                 :order 6)
                          (:name "Due Today"
                                 :deadline today
                                 :order 2)
                          (:name "Due Soon"
                                 :deadline future
                                 :order 8)
                          (:name "Overdue"
                                 :deadline past
                                 :face error
                                 :order 7)
                          (:name "Assignments"
                                 :tag "Assignment"
                                 :order 10)
                          (:name "Issues"
                                 :tag "Issue"
                                 :order 12)
                          (:name "Emacs"
                                 :tag "Emacs"
                                 :order 13)
                          (:name "Projects"
                                 :tag "Project"
                                 :order 14)
                          (:name "Research"
                                 :tag "Research"
                                 :order 15)
                          (:name "To read"
                                 :tag "Read"
                                 :order 30)
                          (:name "Waiting"
                                 :todo "WAITING"
                                 :order 20)
                          (:name "University"
                                 :tag "uni"
                                 :order 32)
                          (:name "Trivial"
                                 :priority<= "E"
                                 :tag ("Trivial" "Unimportant")
                                 :todo ("SOMEDAY" )
                                 :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))
;; Org Super Agenda:1 ends here

;; [[file:config.org::*Org Chef][Org Chef:1]]
(use-package! org-chef
  :commands (org-chef-insert-recipe org-chef-get-recipe-from-url)
  :after org)
;; Org Chef:1 ends here

;; [[file:config.org::*Org Ref][Org Ref:1]]
(use-package! org-ref
  :after org
  :config
  (require 'bibtex)
  (require 'ivy-bibtex)
  (setq bibtex-completion-library 'org-ref-ivy-cite))
;; Org Ref:1 ends here

;; [[file:config.org::*Org Ref][Org Ref:2]]
(setq
 bibtex-completion-pdf-field "pdf"
 bibtex-completion-bibliography "~/Nextcloud/org/papers/references.bib"
 bibtex-completion-library-path "~/Nextcloud/org/papers/bibtex-pdfs"
 bibtex-completion-notes-path "~/Nextcloud/org/papers/notes"
 bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

 bibtex-completion-additional-search-fields '(keywords)
 bibtex-completion-display-formats
'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
    (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
    (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
    (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
    (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
 bibtex-completion-pdf-open-function
 (lambda (fpath)
    (start-process "zathura" "*bibtex-zathura*" "/usr/bin/zathura" fpath))
 bibtex-autokey-year-length 4
 bibtex-autokey-name-year-separator "-"
 bibtex-autokey-year-title-separator "-"
 bibtex-autokey-titleword-separator "-"
 bibtex-autokey-titlewords 2
 bibtex-autokey-titlewords-stretch 1
 bibtex-autokey-titleword-length 5
)
;; Org Ref:2 ends here

;; [[file:config.org::*Org Ref][Org Ref:3]]
(setq org-ref-default-citation-link "footcite")
;; Org Ref:3 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:1]]
(setq org-latex-prefer-user-labels t)
;; Org-Latex:1 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:2]]
(setq org-export-with-smart-quotes t)
;; Org-Latex:2 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:3]]
(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))
(ox-extras-activate '(latex-header-blocks ignore-headlines))
;; Org-Latex:3 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:4]]
(setq
 org-latex-pdf-process
 '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "biber %b"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Org-Latex:4 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:5]]
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
;; Org-Latex:5 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:6]]
(after! ox-latex
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[ngerman,12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
;; Org-Latex:6 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:7]]
(add-to-list 'org-latex-classes
             '("mimosis"
               "\\documentclass{mimosis}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\mboxparagraph{%s}" . "\\mboxparagraph*{%s}")
               ("\\mboxsubparagraph{%s}" . "\\mboxsubparagraph*{%s}")))
;; Org-Latex:7 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:8]]
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
;; Org-Latex:8 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:9]]
(add-to-list 'org-latex-classes
             '("koma-book"
               "\\documentclass{scrbook}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\mboxparagraph{%s}" . "\\mboxparagraph*{%s}")
               ("\\mboxsubparagraph{%s}" . "\\mboxsubparagraph*{%s}")))
;; Org-Latex:9 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:10]]
(add-to-list 'org-latex-classes
 '("fancy-article"
                 "\\documentclass{scrartcl}\n\
\\usepackage[T1]{fontenc}\n\
\\usepackage[osf,largesc,helvratio=0.9]{newpxtext}\n\
\\usepackage[scale=0.92]{sourcecodepro}\n\
\\usepackage[varbb]{newpxmath}\n\

\\usepackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=2000]{microtype}\n\
\\usepackage{xcolor}\n\
\\usepackage{booktabs}

\\usepackage{subcaption}
\\usepackage[hypcap=true]{caption}
\\setkomafont{caption}{\\sffamily\\small}
\\setkomafont{captionlabel}{\\upshape\\bfseries}
\\captionsetup{justification=raggedright,singlelinecheck=true}
\\setcapindent{0pt}

\\setlength{\\parskip}{\\baselineskip}\n\
\\setlength{\\parindent}{0pt}\n\

\\usepackage{pifont}
\\newcommand{\\checkboxUnchecked}{$\\square$}
\\newcommand{\\checkboxTransitive}{\\rlap{\\raisebox{0.0ex}{\\hspace{0.35ex}\\Large\\textbf -}}$\\square$}
\\newcommand{\\checkboxChecked}{\\rlap{\\raisebox{0.2ex}{\\hspace{0.35ex}\\scriptsize \\ding{56}}}$\\square$}

\\newenvironment{warning}
    {\\begin{center}
    \\begin{tabular}{rp{0.9\\textwidth}}
    \\ding{82} & \\textbf{Warning} \\\\ &
    }
    {
    \\end{tabular}
    \\end{center}
    }
"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; Org-Latex:10 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:11]]
(setq org-latex-listings 'minted)
;; Org-Latex:11 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:12]]
(defun scimax-org-latex-fragment-justify (justification)
    "Justify the latex fragment at point with JUSTIFICATION.
JUSTIFICATION is a symbol for 'left, 'center or 'right."
    (interactive
     (list (intern-soft
            (completing-read "Justification (left): " '(left center right)
                             nil t nil nil 'left))))
    (let* ((ov (ov-at))
           (beg (ov-beg ov))
           (end (ov-end ov))
           (shift (- beg (line-beginning-position)))
           (img (overlay-get ov 'display))
           (img (and (and img (consp img) (eq (car img) 'image)
                          (image-type-available-p (plist-get (cdr img) :type)))
                     img))
           space-left offset)
      (when (and img
                 ;; This means the equation is at the start of the line
                 (= beg (line-beginning-position))
                 (or
                  (string= "" (s-trim (buffer-substring end (line-end-position))))
                  (eq 'latex-environment (car (org-element-context)))))
        (setq space-left (- (window-max-chars-per-line) (car (image-size img)))
              offset (floor (cond
                             ((eq justification 'center)
                              (- (/ space-left 2) shift))
                             ((eq justification 'right)
                              (- space-left shift))
                             (t
                              0))))
        (when (>= offset 0)
          (overlay-put ov 'before-string (make-string offset ?\ ))))))

  (defun scimax-org-latex-fragment-justify-advice (beg end image imagetype)
    "After advice function to justify fragments."
    (scimax-org-latex-fragment-justify (or (plist-get org-format-latex-options :justify) 'left)))


  (defun scimax-toggle-latex-fragment-justification ()
    "Toggle if LaTeX fragment justification options can be used."
    (interactive)
    (if (not (get 'scimax-org-latex-fragment-justify-advice 'enabled))
        (progn
          (advice-add 'org--format-latex-make-overlay :after 'scimax-org-latex-fragment-justify-advice)
          (put 'scimax-org-latex-fragment-justify-advice 'enabled t)
          (message "Latex fragment justification enabled"))
      (advice-remove 'org--format-latex-make-overlay 'scimax-org-latex-fragment-justify-advice)
      (put 'scimax-org-latex-fragment-justify-advice 'enabled nil)
      (message "Latex fragment justification disabled")))
;; Org-Latex:12 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:13]]
(setq org-highlight-latex-and-related '(native script entities))


(setq org-format-latex-header "\\documentclass{scrarticle}
\\usepackage[usenames]{color}

\\usepackage[T1]{fontenc}
\\usepackage{mathtools}
\\usepackage{textcomp,amssymb}
\\usepackage[makeroom]{cancel}

\\usepackage{booktabs}

\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}
% my custom stuff
\\usepackage{arev}
\\usepackage{arevmath}")
;; Org-Latex:13 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:14]]
(after! ox
  (defvar ox-chameleon-base-class "fancy-article"
    "The base class that chameleon builds on")

  (defvar ox-chameleon--p nil
    "Used to indicate whether the current export is trying to blend in. Set just before being accessed.")

  ;; (setf (alist-get :filter-latex-class
  ;;                  (org-export-backend-filters
  ;;                   (org-export-get-backend 'latex)))
  ;;       'ox-chameleon-latex-class-detector-filter)

  ;; (defun ox-chameleon-latex-class-detector-filter (info backend)
  ;;   ""
  ;;   (setq ox-chameleon--p (when (equal (plist-get info :latex-class)
  ;;                                      "chameleon")
  ;;                           (plist-put info :latex-class ox-chameleon-base-class)
  ;;                           t)))

  ;; TODO make this less hacky. One ideas was as follows
  ;; (map-put (org-export-backend-filters (org-export-get-backend 'latex))
  ;;           :filter-latex-class 'ox-chameleon-latex-class-detector-filter))
  ;; Never seemed to execute though
  (defadvice! ox-chameleon-org-latex-detect (orig-fun info)
    :around #'org-export-install-filters
    (setq ox-chameleon--p (when (equal (plist-get info :latex-class)
                                       "chameleon")
                            (plist-put info :latex-class ox-chameleon-base-class)
                            t))
    (funcall orig-fun info))

  (defadvice! ox-chameleon-org-latex-export (orig-fn info &optional template snippet?)
    :around #'org-latex-make-preamble
    (funcall orig-fn info)
    (if (not ox-chameleon--p)
        (funcall orig-fn info template snippet?)
      (concat (funcall orig-fn info template snippet?)
              (ox-chameleon-generate-colourings))))

  (defun ox-chameleon-generate-colourings ()
    (apply #'format
           "%% make document follow Emacs theme
\\definecolor{bg}{HTML}{%s}
\\definecolor{fg}{HTML}{%s}

\\definecolor{red}{HTML}{%s}
\\definecolor{orange}{HTML}{%s}
\\definecolor{green}{HTML}{%s}
\\definecolor{teal}{HTML}{%s}
\\definecolor{yellow}{HTML}{%s}
\\definecolor{blue}{HTML}{%s}
\\definecolor{dark-blue}{HTML}{%s}
\\definecolor{magenta}{HTML}{%s}
\\definecolor{violet}{HTML}{%s}
\\definecolor{cyan}{HTML}{%s}
\\definecolor{dark-cyan}{HTML}{%s}

\\definecolor{level1}{HTML}{%s}
\\definecolor{level2}{HTML}{%s}
\\definecolor{level3}{HTML}{%s}
\\definecolor{level4}{HTML}{%s}
\\definecolor{level5}{HTML}{%s}
\\definecolor{level6}{HTML}{%s}
\\definecolor{level7}{HTML}{%s}
\\definecolor{level8}{HTML}{%s}

\\definecolor{link}{HTML}{%s}
\\definecolor{cite}{HTML}{%s}
\\definecolor{itemlabel}{HTML}{%s}
\\definecolor{code}{HTML}{%s}
\\definecolor{verbatim}{HTML}{%s}

\\pagecolor{bg}
\\color{fg}

\\addtokomafont{section}{\\color{level1}}
\\newkomafont{sectionprefix}{\\color{level1}}
\\addtokomafont{subsection}{\\color{level2}}
\\newkomafont{subsectionprefix}{\\color{level2}}
\\addtokomafont{subsubsection}{\\color{level3}}
\\newkomafont{subsubsectionprefix}{\\color{level3}}
\\addtokomafont{paragraph}{\\color{level4}}
\\newkomafont{paragraphprefix}{\\color{level4}}
\\addtokomafont{subparagraph}{\\color{level5}}
\\newkomafont{subparagraphprefix}{\\color{level5}}

\\renewcommand{\\labelitemi}{\\textcolor{itemlabel}{\\textbullet}}
\\renewcommand{\\labelitemii}{\\textcolor{itemlabel}{\\normalfont\\bfseries \\textendash}}
\\renewcommand{\\labelitemiii}{\\textcolor{itemlabel}{\\textasteriskcentered}}
\\renewcommand{\\labelitemiv}{\\textcolor{itemlabel}{\\textperiodcentered}}

\\renewcommand{\\labelenumi}{\\textcolor{itemlabel}{\\theenumi.}}
\\renewcommand{\\labelenumii}{\\textcolor{itemlabel}{(\\theenumii)}}
\\renewcommand{\\labelenumiii}{\\textcolor{itemlabel}{\\theenumiii.}}
\\renewcommand{\\labelenumiv}{\\textcolor{itemlabel}{\\theenumiv.}}

\\DeclareTextFontCommand{\\texttt}{\\color{code}\\ttfamily}
\\makeatletter
\\def\\verbatim@font{\\color{verbatim}\\normalfont\\ttfamily}
\\makeatother
%% end customisations
"
           (mapcar (doom-rpartial #'substring 1)
                   (list
                    (face-attribute 'solaire-default-face :background)
                    (face-attribute 'default :foreground)
                    ;;
                    (doom-color 'red)
                    (doom-color 'orange)
                    (doom-color 'green)
                    (doom-color 'teal)
                    (doom-color 'yellow)
                    (doom-color 'blue)
                    (doom-color 'dark-blue)
                    (doom-color 'magenta)
                    (doom-color 'violet)
                    (doom-color 'cyan)
                    (doom-color 'dark-cyan)
                    ;;
                    (face-attribute 'outline-1 :foreground)
                    (face-attribute 'outline-2 :foreground)
                    (face-attribute 'outline-3 :foreground)
                    (face-attribute 'outline-4 :foreground)
                    (face-attribute 'outline-5 :foreground)
                    (face-attribute 'outline-6 :foreground)
                    (face-attribute 'outline-7 :foreground)
                    (face-attribute 'outline-8 :foreground)
                    ;;
                    (face-attribute 'link :foreground)
                    (or (face-attribute 'org-ref-cite-face :foreground) (doom-color 'yellow))
                    (face-attribute 'org-list-dt :foreground)
                    (face-attribute 'org-code :foreground)
                    (face-attribute 'org-verbatim :foreground)
                    ))))
  )
;; Org-Latex:14 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:15]]
)
;; Org-Latex:15 ends here

;; [[file:config.org::*Org Capture][Org Capture:1]]
(use-package! doct
  :commands (doct))

(require 'org-roam-protocol)
;; Org Capture:1 ends here

;; [[file:config.org::*Org Capture][Org Capture:2]]
(after! org-capture
  (defun org-capture-select-template-prettier (&optional keys)
    "Select a capture template, in a prettier way than default
  Lisp programs can force the template by setting KEYS to a string."
    (let ((org-capture-templates
           (or (org-contextualize-keys
                (org-capture-upgrade-templates org-capture-templates)
                org-capture-templates-contexts)
               '(("t" "Task" entry (file+headline "" "Tasks")
                  "* TODO %?\n  %u\n  %a")))))
      (if keys
          (or (assoc keys org-capture-templates)
              (error "No capture template referred to by \"%s\" keys" keys))
        (org-mks org-capture-templates
                 "Select a capture template\n━━━━━━━━━━━━━━━━━━━━━━━━━"
                 "Template key: "
                 `(("q" ,(concat (all-the-icons-octicon "stop" :face 'all-the-icons-red :v-adjust 0.01) "\tAbort")))))))


  (advice-add 'org-capture-select-template :override #'org-capture-select-template-prettier)

  (defun org-mks-pretty (table title &optional prompt specials)
    "Select a member of an alist with multiple keys. Prettified.

  TABLE is the alist which should contain entries where the car is a string.
  There should be two types of entries.

  1. prefix descriptions like (\"a\" \"Description\")
     This indicates that `a' is a prefix key for multi-letter selection, and
     that there are entries following with keys like \"ab\", \"ax\"…

  2. Select-able members must have more than two elements, with the first
     being the string of keys that lead to selecting it, and the second a
     short description string of the item.

  The command will then make a temporary buffer listing all entries
  that can be selected with a single key, and all the single key
  prefixes.  When you press the key for a single-letter entry, it is selected.
  When you press a prefix key, the commands (and maybe further prefixes)
  under this key will be shown and offered for selection.

  TITLE will be placed over the selection in the temporary buffer,
  PROMPT will be used when prompting for a key.  SPECIALS is an
  alist with (\"key\" \"description\") entries.  When one of these
  is selected, only the bare key is returned."
    (save-window-excursion
      (let ((inhibit-quit t)
      (buffer (org-switch-to-buffer-other-window "*Org Select*"))
      (prompt (or prompt "Select: "))
      case-fold-search
      current)
        (unwind-protect
      (catch 'exit
        (while t
          (setq-local evil-normal-state-cursor (list nil))
          (erase-buffer)
          (insert title "\n\n")
          (let ((des-keys nil)
          (allowed-keys '("\C-g"))
          (tab-alternatives '("\s" "\t" "\r"))
          (cursor-type nil))
      ;; Populate allowed keys and descriptions keys
      ;; available with CURRENT selector.
      (let ((re (format "\\`%s\\(.\\)\\'"
            (if current (regexp-quote current) "")))
            (prefix (if current (concat current " ") "")))
        (dolist (entry table)
          (pcase entry
            ;; Description.
            (`(,(and key (pred (string-match re))) ,desc)
             (let ((k (match-string 1 key)))
         (push k des-keys)
         ;; Keys ending in tab, space or RET are equivalent.
         (if (member k tab-alternatives)
             (push "\t" allowed-keys)
           (push k allowed-keys))
         (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) (propertize "›" 'face 'font-lock-comment-face) "  " desc "…" "\n")))
            ;; Usable entry.
            (`(,(and key (pred (string-match re))) ,desc . ,_)
             (let ((k (match-string 1 key)))
         (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) "   " desc "\n")
         (push k allowed-keys)))
            (_ nil))))
      ;; Insert special entries, if any.
      (when specials
        (insert "─────────────────────────\n")
        (pcase-dolist (`(,key ,description) specials)
          (insert (format "%s   %s\n" (propertize key 'face '(bold all-the-icons-red)) description))
          (push key allowed-keys)))
      ;; Display UI and let user select an entry or
      ;; a sub-level prefix.
      (goto-char (point-min))
      (unless (pos-visible-in-window-p (point-max))
        (org-fit-window-to-buffer))
      (let ((pressed (org--mks-read-key allowed-keys prompt)))
        (setq current (concat current pressed))
        (cond
         ((equal pressed "\C-g") (user-error "Abort"))
         ;; Selection is a prefix: open a new menu.
         ((member pressed des-keys))
         ;; Selection matches an association: return it.
         ((let ((entry (assoc current table)))
            (and entry (throw 'exit entry))))
         ;; Selection matches a special entry: return the
         ;; selection prefix.
         ((assoc current specials) (throw 'exit current))
         (t (error "No entry available")))))))
    (when buffer (kill-buffer buffer))))))
  (advice-add 'org-mks :override #'org-mks-pretty)



  (defun +doct-icon-declaration-to-icon (declaration)
    "Convert :icon declaration to icon"
    (let ((name (pop declaration))
          (set  (intern (concat "all-the-icons-" (plist-get declaration :set))))
          (face (intern (concat "all-the-icons-" (plist-get declaration :color))))
          (v-adjust (or (plist-get declaration :v-adjust) 0.01)))
      (apply set `(,name :face ,face :v-adjust ,v-adjust))))

  (defun +doct-iconify-capture-templates (groups)
    "Add declaration's :icon to each template group in GROUPS."
    (let ((templates (doct-flatten-lists-in groups)))
      (setq doct-templates (mapcar (lambda (template)
                                     (when-let* ((props (nthcdr (if (= (length template) 4) 2 5) template))
                                                 (spec (plist-get (plist-get props :doct) :icon)))
                                       (setf (nth 1 template) (concat (+doct-icon-declaration-to-icon spec)
                                                                      "\t"
                                                                      (nth 1 template))))
                                     template)
                                   templates))))

  (setq doct-after-conversion-functions '(+doct-iconify-capture-templates))

  (add-transient-hook! 'org-capture-select-template
    (setq org-capture-templates
          (doct `(("Personal todo" :keys "t"
                   :icon ("checklist" :set "octicon" :color "green")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "%i %a")
                   )
                  ("Personal note" :keys "n"
                   :icon ("sticky-note-o" :set "faicon" :color "green")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* %?"
                              "%i %a")
                   )
                  ("Email" :keys "e"
                   :icon ("envelope" :set "faicon" :color "blue")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %^{type|reply to|contact} %\\3 %? :email:"
                              "Send an email %^{urgancy|soon|ASAP|anon|at some point|eventually} to %^{recipiant}"
                              "about %^{topic}"
                              "%U %i %a"))
                  ("Interesting" :keys "i"
                   :icon ("eye" :set "faicon" :color "lcyan")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Interesting"
                   :type entry
                   :template ("* [ ] %{desc}%? :%{i-type}:"
                              "%i %a")
                   :children (("Webpage" :keys "w"
                               :icon ("globe" :set "faicon" :color "green")
                               :desc "%(org-cliplink-capture) "
                               :i-type "read:web"
                               )
                              ("Article" :keys "a"
                               :icon ("file-text" :set "octicon" :color "yellow")
                               :desc ""
                               :i-type "read:reaserch"
                               )
                              ("\tRecipie" :keys "r"
                               :icon ("spoon" :set "faicon" :color "dorange")
                               :file +org-capture-recipies
                               :headline "Unsorted"
                               :template "%(org-chef-get-recipe-from-url)"
                               )
                              ("Information" :keys "i"
                               :icon ("info-circle" :set "faicon" :color "blue")
                               :desc ""
                               :i-type "read:info"
                               )
                              ("Idea" :keys "I"
                               :icon ("bubble_chart" :set "material" :color "silver")
                               :desc ""
                               :i-type "idea"
                               )))
                  ("Tasks" :keys "k"
                   :icon ("inbox" :set "octicon" :color "yellow")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Tasks"
                   :type entry
                   :template ("* TODO %? %^G%{extra}"
                              "%i %a")
                   :children (("General Task" :keys "k"
                               :icon ("inbox" :set "octicon" :color "yellow")
                               :extra ""
                               )
                              ("Task with deadline" :keys "d"
                               :icon ("timer" :set "material" :color "orange" :v-adjust -0.1)
                               :extra "\nDEADLINE: %^{Deadline:}t"
                               )
                              ("Scheduled Task" :keys "s"
                               :icon ("calendar" :set "octicon" :color "orange")
                               :extra "\nSCHEDULED: %^{Start time:}t"
                               )
                              ))
                ("Project" :keys "p"
                 :icon ("repo" :set "octicon" :color "silver")
                   :prepend t
                   :type entry
                   :headline "Inbox"
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :file ""
                   :custom (:time-or-todo "")
                   :children (("Project-local todo" :keys "t"
                               :icon ("checklist" :set "octicon" :color "green")
                               :time-or-todo "TODO"
                               :file +org-capture-project-todo-file)
                              ("Project-local note" :keys "n"
                               :icon ("sticky-note" :set "faicon" :color "yellow")
                               :time-or-todo "%U"
                               :file +org-capture-project-notes-file)
                              ("Project-local changelog" :keys "c"
                               :icon ("list" :set "faicon" :color "blue")
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-project-changelog-file))
                   )
                  ("\tCentralised project templates"
                   :keys "o"
                   :type entry
                   :prepend t
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :children (("Project todo"
                               :keys "t"
                               :prepend nil
                               :time-or-todo "TODO"
                               :heading "Tasks"
                               :file +org-capture-central-project-todo-file)
                              ("Project note"
                               :keys "n"
                               :time-or-todo "%U"
                               :heading "Notes"
                               :file +org-capture-central-project-notes-file)
                              ("Project changelog"
                               :keys "c"
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-central-project-changelog-file))
                   ))))))
;; Org Capture:2 ends here

;; [[file:config.org::*Org Capture][Org Capture:3]]
(defun org-capture-select-template-prettier (&optional keys)
  "Select a capture template, in a prettier way than default
Lisp programs can force the template by setting KEYS to a string."
  (let ((org-capture-templates
         (or (org-contextualize-keys
              (org-capture-upgrade-templates org-capture-templates)
              org-capture-templates-contexts)
             '(("t" "Task" entry (file+headline "" "Tasks")
                "* TODO %?\n  %u\n  %a")))))
    (if keys
        (or (assoc keys org-capture-templates)
            (error "No capture template referred to by \"%s\" keys" keys))
      (org-mks org-capture-templates
               "Select a capture template\n━━━━━━━━━━━━━━━━━━━━━━━━━"
               "Template key: "
               `(("q" ,(concat (all-the-icons-octicon "stop" :face 'all-the-icons-red :v-adjust 0.01) "\tAbort")))))))
(advice-add 'org-capture-select-template :override #'org-capture-select-template-prettier)

(defun org-mks-pretty (table title &optional prompt specials)
  "Select a member of an alist with multiple keys. Prettified.

TABLE is the alist which should contain entries where the car is a string.
There should be two types of entries.

1. prefix descriptions like (\"a\" \"Description\")
   This indicates that `a' is a prefix key for multi-letter selection, and
   that there are entries following with keys like \"ab\", \"ax\"…

2. Select-able members must have more than two elements, with the first
   being the string of keys that lead to selecting it, and the second a
   short description string of the item.

The command will then make a temporary buffer listing all entries
that can be selected with a single key, and all the single key
prefixes.  When you press the key for a single-letter entry, it is selected.
When you press a prefix key, the commands (and maybe further prefixes)
under this key will be shown and offered for selection.

TITLE will be placed over the selection in the temporary buffer,
PROMPT will be used when prompting for a key.  SPECIALS is an
alist with (\"key\" \"description\") entries.  When one of these
is selected, only the bare key is returned."
  (save-window-excursion
    (let ((inhibit-quit t)
    (buffer (org-switch-to-buffer-other-window "*Org Select*"))
    (prompt (or prompt "Select: "))
    case-fold-search
    current)
      (unwind-protect
    (catch 'exit
      (while t
        (setq-local evil-normal-state-cursor (list nil))
        (erase-buffer)
        (insert title "\n\n")
        (let ((des-keys nil)
        (allowed-keys '("\C-g"))
        (tab-alternatives '("\s" "\t" "\r"))
        (cursor-type nil))
    ;; Populate allowed keys and descriptions keys
    ;; available with CURRENT selector.
    (let ((re (format "\\`%s\\(.\\)\\'"
          (if current (regexp-quote current) "")))
          (prefix (if current (concat current " ") "")))
      (dolist (entry table)
        (pcase entry
          ;; Description.
          (`(,(and key (pred (string-match re))) ,desc)
           (let ((k (match-string 1 key)))
       (push k des-keys)
       ;; Keys ending in tab, space or RET are equivalent.
       (if (member k tab-alternatives)
           (push "\t" allowed-keys)
         (push k allowed-keys))
       (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) (propertize "›" 'face 'font-lock-comment-face) "  " desc "…" "\n")))
          ;; Usable entry.
          (`(,(and key (pred (string-match re))) ,desc . ,_)
           (let ((k (match-string 1 key)))
       (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) "   " desc "\n")
       (push k allowed-keys)))
          (_ nil))))
    ;; Insert special entries, if any.
    (when specials
      (insert "─────────────────────────\n")
      (pcase-dolist (`(,key ,description) specials)
        (insert (format "%s   %s\n" (propertize key 'face '(bold all-the-icons-red)) description))
        (push key allowed-keys)))
    ;; Display UI and let user select an entry or
    ;; a sub-level prefix.
    (goto-char (point-min))
    (unless (pos-visible-in-window-p (point-max))
      (org-fit-window-to-buffer))
    (let ((pressed (org--mks-read-key allowed-keys prompt)))
      (setq current (concat current pressed))
      (cond
       ((equal pressed "\C-g") (user-error "Abort"))
       ;; Selection is a prefix: open a new menu.
       ((member pressed des-keys))
       ;; Selection matches an association: return it.
       ((let ((entry (assoc current table)))
          (and entry (throw 'exit entry))))
       ;; Selection matches a special entry: return the
       ;; selection prefix.
       ((assoc current specials) (throw 'exit current))
       (t (error "No entry available")))))))
  (when buffer (kill-buffer buffer))))))
(advice-add 'org-mks :override #'org-mks-pretty)


(setf (alist-get 'height +org-capture-frame-parameters) 15)
      ;; (alist-get 'name +org-capture-frame-parameters) "❖ Capture") ;; ATM hardcoded in other places, so changing breaks stuff
(setq +org-capture-fn
      (lambda ()
        (interactive)
        (set-window-parameter nil 'mode-line-format 'none)
        (org-capture)))
;; Org Capture:3 ends here

;; [[file:config.org::*Org Capture][Org Capture:4]]
(setq org-capture-templates `(
    ("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
    ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %? [[%:link][%:description]] \nCaptured On: %U")
))
;; Org Capture:4 ends here

;; [[file:config.org::*Basic Setup][Basic Setup:1]]
(use-package! jupyter)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (jupyter . t)))
;; Basic Setup:1 ends here

;; [[file:config.org::*HTML][HTML:1]]
(use-package! htmlize
  :after ox
  :config
  (setq org-html-htmlize-output-type 'css))
;; HTML:1 ends here

;; [[file:config.org::*Org Anki][Org Anki:1]]
(use-package! anki-editor
  :after org
  :bind (:map org-mode-map
              ("<f12>" . anki-editor-cloze-region-auto-incr)
              ("<f11>" . anki-editor-cloze-region-dont-incr)
              ("<f10>" . anki-editor-reset-cloze-number)
              ("<f9>" . anki-editor-push-tree))
  :hook (org-capture-after-finalize . anki-editor-reset-cloze-number)
  :config
  (setq request-log-level 'debug)
  (setq anki-editor-create-decks t
        anki-editor-org-tags-as-anki-tags t)
  (defun anki-editor-cloze-region-auto-incr (&optional arg)
    "Cloze region without hint and incr card number."
    (interactive)
    (anki-editor-cloze-region  my-anki-editor-cloze-number "")
    (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
    (forward-sexp)
    )
  (defun anki-editor-cloze-region-dont-incr (&optional arg)
    "Cloze region without hint."
    (interactive)
    (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
    (forward-sexp)
    )
  (defun anki-editor-reset-cloze-number (&optional arg)
    "Reset cloze nr to ARG or 1"
    (interactive)
    (setq my-anki-editor-cloze-number (or arg 1))
    )
  (defun anki-editor-push-tree ()
    "Push all notes under a tree."
    (interactive)
    (anki-editor-push-notes '(4))
    (anki-editor-reset-cloze-number)
    )
  (anki-editor-reset-cloze-number)
  )
;; Org Anki:1 ends here

;; [[file:config.org::*Org Functions][Org Functions:1]]
(after! org
  (defun unpackaged/org-element-descendant-of (type element)
    "Return non-nil if ELEMENT is a descendant of TYPE.
TYPE should be an element type, like 'item' or 'paragraph'.
ELEMENT should be a list like that returned by 'org-element-context'."
    ;; MAYBE: Use 'org-element-lineage'.
    (when-let* ((parent (org-element-property :parent element)))
      (or (eq type (car parent))
          (unpackaged/org-element-descendant-of type parent))))

;;;###autoload
  (defun unpackaged/org-return-dwim (&optional default)
    "A helpful replacement for 'org-return-indent'.  With prefix, call 'org-return-indent'.

On headings, move point to position after entry content.  In
lists, insert a new item or end the list, with checkbox if
appropriate.  In tables, insert a new row or end the table."
    ;; Inspired by John Kitchin: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
    (interactive "P")
    (if default
        (org-return t)
      (cond
       ;; Act depending on context around point.

       ((eq 'link (car (org-element-context)))
        ;; Link: Open it.
        (org-open-at-point-global))

       ((org-at-heading-p)
        ;; Heading: Move to position after entry content.
        ;; NOTE: This is probably the most interesting feature of this function.
        (let ((heading-start (org-entry-beginning-position)))
          (goto-char (org-entry-end-position))
          (cond ((and (org-at-heading-p)
                      (= heading-start (org-entry-beginning-position)))
                 ;; Entry ends on its heading; add newline after
                 (end-of-line)
                 (insert "\n\n"))
                (t
                 ;; Entry ends after its heading; back up
                 (forward-line -1)
                 (end-of-line)
                 (when (org-at-heading-p)
                   ;; At the same heading
                   (forward-line)
                   (insert "\n")
                   (forward-line -1))
                 ;; FIXME: looking-back is supposed to be called with more arguments.
                 (while (not (looking-back (rx (repeat 3 (seq (optional blank) "\n")))))
                   (insert "\n"))
                 (forward-line -1)))))

       ((org-at-item-checkbox-p)
        ;; Checkbox: Insert new item with checkbox.
        (org-insert-todo-heading nil))

       ((org-in-item-p)
        ;; Plain list.  Yes, this gets a little complicated...
        (let ((context (org-element-context)))
          (if (or (eq 'plain-list (car context))  ; First item in list
                  (and (eq 'item (car context))
                       (not (eq (org-element-property :contents-begin context)
                                (org-element-property :contents-end context))))
                  (unpackaged/org-element-descendant-of 'item context))  ; Element in list item, e.g. a link
              ;; Non-empty item: Add new item.
              (org-insert-item)
            ;; Empty item: Close the list.
            ;; TODO: Do this with org functions rather than operating on the text. Can't seem to find the right function.
            (delete-region (line-beginning-position) (line-end-position))
            (insert "\n"))))

       ((when (fboundp 'org-inlinetask-in-task-p)
          (org-inlinetask-in-task-p))
        ;; Inline task: Don't insert a new heading.
        (org-return t))

       ((org-at-table-p)
        (cond ((save-excursion
                 (beginning-of-line)
                 ;; See 'org-table-next-field'.
                 (cl-loop with end = (line-end-position)
                          for cell = (org-element-table-cell-parser)
                          always (equal (org-element-property :contents-begin cell)
                                        (org-element-property :contents-end cell))
                          while (re-search-forward "|" end t)))
               ;; Empty row: end the table.
               (delete-region (line-beginning-position) (line-end-position))
               (org-return t))
              (t
               ;; Non-empty row: call 'org-return-indent'.
               (org-return t))))
       (t
        ;; All other cases: call 'org-return-indent'.
        (org-return t))))))

(map!
 :after evil-org
 :map evil-org-mode-map
 :i [return] #'unpackaged/org-return-dwim)
;; Org Functions:1 ends here

;; [[file:config.org::*LSP Support in src blocks][LSP Support in src blocks:1]]
(cl-defmacro lsp-org-babel-enable (lang)
    "Support LANG in org source code block."
    (setq centaur-lsp 'lsp-mode)
    (cl-check-type lang stringp)
    (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
           (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
      `(progn
         (defun ,intern-pre (info)
           (let ((file-name (->> info caddr (alist-get :file))))
             (unless file-name
               (setq file-name (make-temp-file "babel-lsp-")))
             (setq buffer-file-name file-name)
              (lsp-deferred)))
         (put ',intern-pre 'function-documentation
              (format "Enable lsp-mode in the buffer of org source block (%s)."
                      (upcase ,lang)))
         (if (fboundp ',edit-pre)
             (advice-add ',edit-pre :after ',intern-pre)
           (progn
             (defun ,edit-pre (info)
               (,intern-pre info))
             (put ',edit-pre 'function-documentation
                  (format "Prepare local buffer environment for org source block (%s)."
                          (upcase ,lang))))))))
  (defvar org-babel-lang-list
    '("go" "python" "ipython" "bash" "sh" "c"))
  (dolist (lang org-babel-lang-list)
    (eval `(lsp-org-babel-enable ,lang)))
;; LSP Support in src blocks:1 ends here

;; [[file:config.org::*Projects][Projects:1]]
(setq
 projectile-project-search-path '("~/Projekte"))
;; Projects:1 ends here

;; [[file:config.org::*Projects][Projects:2]]
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of 'projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))
;; Projects:2 ends here

;; [[file:config.org::*PATH][PATH:1]]
(setenv "PATH" (concat (getenv "PATH") ":/opt/texlive/2020/bin/x86_64-linuxmusl"))
(setq exec-path (append exec-path '("/opt/texlive/2020/bin/x86_64-linuxmusl")))
;; PATH:1 ends here

;; [[file:config.org::*Authinfo][Authinfo:2]]
(use-package! authinfo-colour-mode
  :mode ("authinfo\\.gpg\\'" . authinfo-colour-mode)
  :config
  (advice-add 'authinfo-mode :override #'authinfo-colour-mode))
;; Authinfo:2 ends here

;; [[file:config.org::*Python][Python:1]]
(setq python-shell-interpreter "python")
;; Python:1 ends here

;; [[file:config.org::*Python][Python:2]]
(setq python-shell-completion-native-enable nil)
;; Python:2 ends here

;; [[file:config.org::*Typescript][Typescript:1]]
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
;; Typescript:1 ends here

;; [[file:config.org::*React Native][React Native:1]]
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; React Native:1 ends here

;; [[file:config.org::*React Native][React Native:2]]
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
;; React Native:2 ends here

;; [[file:config.org::*Snippets][Snippets:1]]
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
(yas-global-mode 1)
;; Snippets:1 ends here

;; [[file:config.org::*Tramp][Tramp:1]]
(eval-after-load 'tramp '(setenv "$SHELL" "/bin/bash"))
;; Tramp:1 ends here

;; [[file:config.org::*Tramp][Tramp:2]]
(setq tramp-default-method "ssh")
;; Tramp:2 ends here

;; [[file:config.org::*Tramp][Tramp:3]]
(define-key global-map (kbd "C-c s") 'counsel-tramp)
;; Tramp:3 ends here

;; [[file:config.org::*Speeding up tramp][Speeding up tramp:1]]
(add-hook 'counsel-tramp-pre-command-hook '(lambda ()
                     (projectile-mode 0)
                     (editorconfig-mode 0)))
;; Speeding up tramp:1 ends here

;; [[file:config.org::*Speeding up tramp][Speeding up tramp:2]]
(add-hook 'counsel-tramp-quit-hook '(lambda () (global-aggressive-indent-mode 1)
                  (projectile-mode 1)
                  (editorconfig-mode 1)))
;; Speeding up tramp:2 ends here

;; [[file:config.org::*Speeding up tramp][Speeding up tramp:3]]
(setq make-backup-files nil)
(setq create-lockfiles nil)
;; Speeding up tramp:3 ends here
