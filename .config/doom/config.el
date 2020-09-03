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
                                :family "Iosevka Sparkle"
                                :weight 'extralight
                                :size 22)
      doom-big-font (font-spec
                     :family "Iosevka"
                     :weight 'light
                     :size 24)
      doom-serif-font (font-spec
                       :family "Iosevka Aile"
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
(setq org-directory "~/Daten/cloud/tlaloc/org/"
      org-archive-location (concat org-directory ".archive/$s::"))
;; Org:1 ends here

;; [[file:config.org::*Org][Org:2]]
(use-package! org
;; Org:2 ends here

;; [[file:config.org::*Configuring org][Configuring org:1]]
  :config
;; Configuring org:1 ends here

;; [[file:config.org::*Org Style][Org Style:1]]
(setq
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("✿" "■" "◆" "▲" "#")
)
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
              :results       "R"
              :property      "P"
              :properties    "P"
              :end           "∎"
              :options       "O"
              :title         "T"
              :subtitle      "ST"
              :author        "A"
              :date          "D"
              :latex_header  "LH"
              :latex_class   "LC"
              :beamer_header "BH"
              :html_head     "HH"
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
  (set-ligatures! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[X]"
    :list_property "::"
    :results       "#+RESULTS:"
    :property      "#+PROPERTY:"
    :property      ":PROPERTIES:"
    :end           ":END:"
    :options       "#+OPTIONS:"
    :title         "#+TITLE:"
    :subtitle      "#+SUBTITLE:"
    :author        "#+AUTHOR:"
    :date          "#+DATE:"
    :latex_class   "#+LATEX_CLASS:"
    :latex_header  "#+LATEX_HEADER:"
    :html_head     "#+HTML_HEAD:"
    :beamer_header "#+BEAMER_HEADER:"
    :begin_quote   "#+BEGIN_QUOTE"
    :end_quote     "#+END_QUOTE"
    :begin_export  "#+BEGIN_EXPORT"
    :end_export    "#+END_EXPORT"
    :priority_a    "[#A]"
    :priority_b    "[#B]"
    :priority_c    "[#C]"
    :priority_d    "[#D]"
    :priority_e    "[#E]"
    :em_dash       "---")
    (plist-put +ligatures-extra-symbols
               :name "›")
;; Org Style:11 ends here

;; [[file:config.org::*Indentation][Indentation:1]]
  (setq org-startup-indented nil)
  (setq org-indent-indentation-per-level 1)
;; Indentation:1 ends here

;; [[file:config.org::*Indentation][Indentation:2]]
  (setq org-adapt-indentation nil)
;; Indentation:2 ends here

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

;; [[file:config.org::*Capture][Capture:1]]
(require 'org-roam-protocol)
(setq org-capture-templates `(
    ("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
    ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %? [[%:link][%:description]] \nCaptured On: %U")
))
;; Capture:1 ends here

;; [[file:config.org::*Refile][Refile:1]]
(global-set-key (kbd "C-c o")
  (lambda () (interactive) (find-file (concat org-directory "refile.org"))))
;; Refile:1 ends here

;; [[file:config.org::*Org Chef][Org Chef:1]]
(use-package! org-chef
  :commands (org-chef-insert-recipe org-chef-get-recipe-from-url)
  :after org)
;; Org Chef:1 ends here

;; [[file:config.org::*Org Ref][Org Ref:1]]
(use-package! org-ref
  :after org
  :config
  (setq org-ref-completion-library 'org-ref-ivy-cite))
;; Org Ref:1 ends here

;; [[file:config.org::*Org Ref][Org Ref:2]]
(setq
 org-ref-default-bibliography "~/Daten/cloud/tlaloc/org/Papers/references.bib"

 org-ref-pdf-directory "~/Daten/cloud/tlaloc/org/Papers/bibtex-pdfs"

 org-ref-bibliography-notes "~/Daten/cloud/tlaloc/org/Papers/notes.org"
 org-ref-open-pdf-function
 (lambda (fpath)
   (start-process "zathura" "*ivy-bibtex-zathura*" "/usr/bin/zathura" fpath))
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
(setq org-export-default-language "de")
;; Org-Latex:4 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:5]]
(setq
 org-latex-pdf-process
 '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "biber %b"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Org-Latex:5 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:6]]
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
;; Org-Latex:6 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:7]]
(after! ox-latex
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[ngerman,12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
;; Org-Latex:7 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:8]]
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
;; Org-Latex:8 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:9]]
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
;; Org-Latex:9 ends here

;; [[file:config.org::*Org-Latex][Org-Latex:10]]
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
  )
;; Org-Latex:13 ends here

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
