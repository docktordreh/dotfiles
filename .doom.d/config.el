;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

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

(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

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

(setenv "PATH" (concat (getenv "PATH") ":/home/valentin/.pyenv/bin"))
(setq exec-path (append exec-path '("/home/valentin/.pyenv/bin")))

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
 doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 18)
 doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 24)
 doom-variable-pitch-font (font-spec :family "GaramondNo8" :size 24)
 doom-serif-font (font-spec :family "Liberation Serif" :weight 'light))

(setq doom-theme 'doom-snazzy)

(setq display-line-numbers-type 'relative)

(custom-set-faces! '(doom-modeline-evil-insert-state
                     :weight bold
                     :foreground "#339CDB"))

(global-set-key (kbd "C-c e") 'org-latex-export-to-pdf)

(map! :map evil-window-map "SPC" #'rotate-layout)

(setq
 projectile-project-search-path '("~/Projekte"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (plantuml . t)
   (python . t)
 )
)

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
  org-superstar-headline-bullets-list '("✿" "■" "◆" "▲" "#")
  ;; org-superstar-headline-bullets-list '("✡" "⎈" "✽" "✲" "✱" "✻" "✼" "✽" "✾" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇")
  ;;org-superstar-headline-bullets-list '("#" "◉" "○" "✜" "✿""■" "◆" "▲" "▶" )
)

 (custom-set-faces
  '(org-block
    ((t (:inherit fixed-pitch)))
    )
  '(org-code
    ((t (:inherit (shadow fixed-pitch))))
    )
  '(org-document-info
    ((t (:foreground "dark violet")))
    )
  '(org-document-info-keyword
    ((t (:inherit (shadow fixed-pitch))))
    )
  '(org-indent
    ((t (:inherit (org-hide fixed-pitch))))
    )
  '(org-link
    ((t (:foreground "royal blue" :underline t)))
    )
  '(org-meta-line
    ((t (:inherit (font-lock-comment-face fixed-pitch))))
    )
  '(org-property-value
    ((t (:inherit fixed-pitch)))
    t)
  '(org-special-keyword
    ((t (:inherit (font-lock-comment-face fixed-pitch))))
    )
  '(org-table
    ((t (:inherit fixed-pitch :foreground "#f1f1f0")))
              )
  '(org-tag
    ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8)))
    )
  '(org-verbatim
    ((t (:inherit (shadow fixed-pitch))))
    )
  `(org-level-8 ((t (
                      :inherit default
                      :weight bold
                      :foreground "#ff6ac1"
                      ))))
  `(org-level-7 ((t (
                     :inherit default
                     :weight bold
                     :foreground "#5af78e"))))
  `(org-level-6 ((t (
                     :inherit default
                     :weight bold
                     :foreground "#57c7ff"
                     ))))
  `(org-level-5 ((t (
                     :inherit default
                     :weight bold
                     :foreground "#ff5c57"
                     ))))
  `(org-level-4 ((t (
                     :inherit default
                     :weight bold
                     :foreground "#9aeedf"
                     :height 1.1))))
   `(org-level-3 ((t (
                      :inherit default
                      :weight bold
                      :foreground "#f3f99d"
                      :height 1.25))))
   `(org-level-2 ((t (
                      :inherit default
                      :weight bold
                      :foreground "#ff6ac1"
                      :height 1.5))))
   `(org-level-1 ((t (
                      :inherit default
                      :weight bold
                      :foreground "#5af78e"
                      :height 1.75))))
   `(org-document-title ((t (
                             :inherit default
                             :weight bold
                             :foreground "#57c7ff"
                             :height 2.0
                             :underline nil)))))

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))

(setq org-hide-leading-stars t)

(setq org-src-fontify-natively t)

(setq org-pretty-entities t)
(add-hook 'org-mode-hook 'variable-pitch-mode)

(add-hook 'org-mode-hook 'variable-pitch-mode)

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

     ;; Open links like usual, unless point is at the end of a line.
     ;; and if at beginning of line, just press enter.
     ((or (and (eq 'link (car (org-element-context))) (not (eolp)))
          (bolp))
      (org-return))

     ;; It doesn't make sense to add headings in inline tasks. Thanks Anders
     ;; Johansson!
     ((org-inlinetask-in-task-p)
      (org-return))

     ;; checkboxes too
     ((org-at-item-checkbox-p)
      (org-insert-todo-heading nil))

     ;; lists end with two blank lines, so we need to make sure we are also not
     ;; at the beginning of a line to avoid a loop where a new entry gets
     ;; created with only one blank line.
     ((org-in-item-p)
      (if (save-excursion (beginning-of-line) (org-element-property :contents-begin (org-element-context)))
          (org-insert-heading)
        (beginning-of-line)
        (delete-region (line-beginning-position) (line-end-position))
        (org-return)))

     ;; org-heading
     ((org-at-heading-p)
      (if (not (string= "" (org-element-property :title (org-element-context))))
          (progn (org-end-of-meta-data)
                 (org-insert-heading-respect-content)
                 (outline-show-entry))
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")))

     ;; tables
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

     ;; fall-through case
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

(require 'org-roam-protocol)

(setq org-capture-templates `(
    ("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
    ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %? [[%:link][%:description]] \nCaptured On: %U")
))
;;(setq org-capture-templates
;;      (doct `(("Personal todo" :keys "t"
;;               :icon ("checklist" :set "octicon" :color "green")
;;               :file +org-capture-todo-file
;;               :prepend t
;;               :headline "Inbox"
;;               :type entry
;;               :template ("* TODO %?"
;;                          "%i %a")
;;               )
;;              ("Personal note" :keys "n"
;;               :icon ("sticky-note-o" :set "faicon" :color "green")
;;               :file +org-capture-todo-file
;;               :prepend t
;;               :headline "Inbox"
;;               :type entry
;;               :template ("* %?"
;;                          "%i %a")
;;               )
;;              ("University" :keys "u"
;;               :icon ("graduation-cap" :set "faicon" :color "purple")
;;               :file +org-capture-todo-file
;;                   :headline "University"
;;                   :unit-prompt ,(format "%%^{Unit|%s}" (string-join +org-capture-uni-units "|"))
;;                   :prepend t
;;                   :type entry
;;                   :children (("Test" :keys "t"
;;                               :icon ("timer" :set "material" :color "red")
;;                               :template ("* TODO [#C] %{unit-prompt} %? :uni:tests:"
;;                                          "SCHEDULED: %^{Test date:}T"
;;                                          "%i %a"))
;;                              ("Assignment" :keys "a"
;;                               :icon ("library_books" :set "material" :color "orange")
;;                               :template ("* TODO [#B] %{unit-prompt} %? :uni:assignments:"
;;                                          "DEADLINE: %^{Due date:}T"
;;                                          "%i %a"))
;;                              ("Lecture" :keys "l"
;;                               :icon ("keynote" :set "fileicon" :color "orange")
;;                               :template ("* TODO [#C] %{unit-prompt} %? :uni:lecture:"
;;                                          "%i %a"))
;;                              ("Miscellaneous task" :keys "u"
;;                               :icon ("list" :set "faicon" :color "yellow")
;;                               :template ("* TODO [#D] %{unit-prompt} %? :uni:"
;;                                          "%i %a"))))
;;                  ("Email" :keys "e"
;;                   :icon ("envelope" :set "faicon" :color "blue")
;;                   :file +org-capture-todo-file
;;                   :prepend t
;;                   :headline "Inbox"
;;                   :type entry
;;                   :template ("* TODO %^{type|reply to|contact} %\\3 %? :email:"
;;                              "Send an email %^{urgancy|soon|ASAP|anon|at some point|eventually} to %^{recipiant}"
;;                              "about %^{topic}"
;;                              "%U %i %a"))
;;                  ("Interesting" :keys "i"
;;                   :icon ("eye" :set "faicon" :color "lcyan")
;;                   :file +(or )g-capture-todo-file
;;                   :prepend t
;;                   :headline "Interesting"
;;                   :type entry
;;                   :template ("* [ ] %{desc}%? :%{i-type}:"
;;                              "%i %a")
;;                   :children (("Webpage" :keys "w"
;;                               :icon ("globe" :set "faicon" :color "green")
;;                               :desc "%(org-cliplink-capture) "
;;                               :i-type "read:web"
;;                               )
;;                              ("Article" :keys "a"
;;                               :icon ("file-text" :set "octicon" :color "yellow")
;;                               :desc ""
;;                               :i-type "read:reaserch"
;;                               )
;;                              ("\tRecipie" :keys "r"
;;                               :icon ("spoon" :set "faicon" :color "dorange")
;;                               :file +org-capture-recipies
;;                               :headline "Unsorted"
;;                               :template "%(org-chef-get-recipe-from-url)"
;;                               )
;;                              ("Information" :keys "i"
;;                               :icon ("info-circle" :set "faicon" :color "blue")
;;                               :desc ""
;;                               :i-type "read:info"
;;                               )
;;                              ("Idea" :keys "I"
;;                               :icon ("bubble_chart" :set "material" :color "silver")
;;                               :desc ""
;;                               :i-type "idea"
;;                               )))
;;                  ("Tasks" :keys "k"
;;                   :icon ("inbox" :set "octicon" :color "yellow")
;;                   :file +org-capture-todo-file
;;                   :prepend t
;;                   :headline "Tasks"
;;                   :type entry
;;                   :template ("* TODO %? %^G%{extra}"
;;                              "%i %a")
;;                   :children (("General Task" :keys "k"
;;                               :icon ("inbox" :set "octicon" :color "yellow")
;;                               :extra ""
;;                               )
;;                              ("Task with deadline" :keys "d"
;;                               :icon ("timer" :set "material" :color "orange" :v-adjust -0.1)
;;                               :extra "\nDEADLINE: %^{Deadline:}t"
;;                               )
;;                              ("Scheduled Task" :keys "s"
;;                               :icon ("calendar" :set "octicon" :color "orange")
;;                               :extra "\nSCHEDULED: %^{Start time:}t"
;;                               )
;;                              ))
;;                  ("Project" :keys "p"
;;                   :icon ("repo" :set "octicon" :color "silver")
;;                   :prepend t
;;                   :type entry
;;                   :headline "Inbox"
;;                   :template ("* %{time-or-todo} %?"
;;                              "%i"
;;                              "%a")
;;                   :file ""
;;                   :custom (:time-or-todo "")
;;                   :children (("Project-local todo" :keys "t"
;;                               :icon ("checklist" :set "octicon" :color "green")
;;                               :time-or-todo "TODO"
;;                               :file +org-capture-project-todo-file)
;;                              ("Project-local note" :keys "n"
;;                               :icon ("sticky-note" :set "faicon" :color "yellow")
;;                               :time-or-todo "%U"
;;                               :file +org-capture-project-notes-file)
;;                              ("Project-local changelog" :keys "c"
;;                               :icon ("list" :set "faicon" :color "blue")
;;                               :time-or-todo "%U"
;;                               :heading "Unreleased"
;;                               :file +org-capture-project-changelog-file))
;;                   )
;;                  ("\tCentralised project templates"
;;                   :keys "o"
;;                   :type entry
;;                   :prepend t
;;                   :template ("* %{time-or-todo} %?"
;;                              "%i"
;;                              "%a")
;;                   :children (("Project todo"
;;                               :keys "t"
;;                               :prepend nil
;;                               :time-or-todo "TODO"
;;                               :heading "Tasks"
;;                               :file +org-capture-central-project-todo-file)
;;                              ("Project note"
;;                               :keys "n"
;;                               :time-or-todo "%U"
;;                               :heading "Notes"
;;                               :file +org-capture-central-project-notes-file)
;;                              ("Project changelog"
;;                               :keys "c"
;;                               :time-or-todo "%U"
;;                               :heading "Unreleased"
;;                               :file +org-capture-central-project-changelog-file
;;                               )
;;                              )
;;                   )
;;                  )
;;            )
;;#+END_SRC
;;#+BEGIN_SRC emacs-lisp
;;(setq org-capture-templates
;;      (quote
;;       (("w"
;;         "Default template"
;;         entry
;;         (file+headline (concat org-directory "capture.org") "Notes")
;;         "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
;;         :empty-lines 1)
;;        ;; ... more templates here ...
;;        )))

(setq org-roam-directory (concat org-directory "roam"))

(setq org-protocol-default-template-key "w")

(global-set-key (kbd "C-c o")
  (lambda () (interactive) (find-file (concat org-directory "refile.org"))))

(setq org-agenda-files (list
                        org-directory
                        "~/Daten/cloud/highq/thesis-bachelor/org"))

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

  ;; ! = insert timestamp
  ;; @ = insert note
  ;; / = enter state
  ;; (x) = shortcut (after C-c C-t)
  ;; after the |: close todo
(setq
 org-todo-keywords '(
                     (sequence
                      "DELEGATED(l@/!)"
                      "SOMEDAY(f)"
                      "IDEA(i@/!)"
                      "TODO(t@/!)"
                      "STARTED(s@/!)"
                      "NEXT(n@/!)"
                      "WAITING(w@/!)"
                      "|"
                      "DONE(d@/!)"
                      "CANCELED(c@/!)")
                     )
 )

(setq  org-todo-keyword-faces
  '(("IDEA" . (
               :foreground "light green"
               :weight bold))
    ("NEXT" . (
               :foreground "orange"
               :weight bold))
    ("TODO" . (
               :foreground "yellow"
               :weight bold))
    ("STARTED" . (
                  :foreground "green"
                  :weight bold))
    ("WAITING" . (
                  :foreground "maroon"
                  :weight bold))
    ("CANCELED" . (
                   :foreground "red"
                   :weight bold))
    ("DELEGATED" . (
                    :foreground "sea green"
                    :weight bold))
    ("SOMEDAY" . (
                  :foreground "seashell"
                  :weight bold))
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
    ("HOME" . (
               :foreground "aquamarine"
               :weight bold))
    ("RESEARCH" . (
                   :foreground "SeaGreen4"
                   :weight bold))
    ("TEACHING" . (
                   :foreground "SpringGreen1"
                   :weight bold))
    ("STUDYING" . (
                   :foreground "SpringGreen4"
                   :weight bold))
    ("OS" . (
             :foreground "coral4"
             :weight bold))
    ("DEV" . (
              :foreground "tomato1"
              :weight bold))
    ("MGMT" . (
               :foreground "yellow1"
               :weight bold))
    ("WWW" . (
              :foreground "gray0"
              :weight bold))
    ("URGENT" . (
                 :foreground "red"
                 :weight bold))
    ("KEY" . (
              :foreground "red"
              :weight bold))
    ("EASY" . (
               :foreground "SeaGreen1"
               :weight bold))
    ("MEDIUM" . (
                 :foreground "yellow"
                 :weight bold))
    ("HARD" . (
               :foreground "red"
               :weight bold))
    ("BONUS" . (
                :foreground "goldenrod1"
                :weight bold))
    ("noexport" .(
                  :foreground "DarkBlue"
                  :weight bold))
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

(setq org-export-default-language "de")

(setq
 org-latex-pdf-process
 '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "biber %b"
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

(add-to-list 'org-latex-classes
             '("koma-book"
               "\\documentclass{scrbook}
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

;;(setq org-latex-default-packages-alist
;;      '(
;;        ("" "float" nil)
;;        ("" "booktabs" nil)
;;        ("" "lscape" nil)
;;        ("" "hyphenat" nil)
;;        ;; drawing
;;        ("" "microtype" nil)
;;        ("" "tikz" nil)
;;        ;; this is for having good fonts
;;        ("" "lmodern" nil)
;;        ;; This makes standard margins
;;        ("left=3.0cm, right=3.0cm,top=2.5cm,bottom=3cm" "geometry" nil)
;;        ("" "graphicx" t)
;;        ("" "longtable" nil)
;;        ("" "float" nil)
;;        ("" "wrapfig" nil)      ;makes it possible to wrap text around figures
;;        ("" "rotating" nil)
;;        ("normalem" "ulem" t)
;;        ;; These provide math symbols
;;        ("" "amsmath" t)
;;        ("" "textcomp" t)
;;        ("" "marvosym" t)
;;        ("" "wasysym" t)
;;        ("" "amssymb" t)
;;        ("" "amsmath" t)
;;        ("theorems, skins" "tcolorbox" t)
;;        ;; used for marking up chemical formulars
;;        ("version=3" "mhchem" t)
;;        ("numbers,super,sort&compress" "natbib" nil)
;;        ("" "natmove" nil)
;;        ("" "url" nil)
;;        ;; this is used for syntax highlighting of code
;;        ("cache=false" "minted" nil)
;;        ("" "listings" nil)
;;        ("linktocpage,pdfstartview=FitH,colorlinks,
;;linkcolor=RoyalBlue,anchorcolor=RoyalBlue,
;;citecolor=RoyalBlue,filecolor=RoyalBlue,menucolor=RoyalBlue,urlcolor=RoyalBlue"
;;         "hyperref" nil)
;;        ("onehalfspacing" "setspace" nil)
;;        ;; enables you to embed files in pdfs
;;        ("" "attachfile" nil)
;;    ))

(setq org-latex-listings 'minted)

(setq
 org-export-in-background t
 org-export-async-init-file (concat doom-private-dir "init-org-async.el"))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("LuaLatex + Biber"
                  "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "biber %b"
                  "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f")
                t)
  )
(setq TeX-command-default "LuaLatex + Biber")

(setq magit-repository-directories '(("~/Projekte" . 2)))

(setq magit-save-repository-buffers nil)

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

(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
(yas-global-mode 1)

(after! elfeed
  (setq elfeed-search-filter "@1-month-ago +unread"))
(setq elfeed-feeds
  '("
www.heise.de/rss/heise-top-atom.xml"
    "
www.heise.de/developer/rss/news-atom.xml"))

(defun org-latex-publish-to-pdf (plist filename pub-dir)
  "Publish an Org file to PDF (via LaTeX).

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name."
  ;; Unlike to `org-latex-publish-to-latex', PDF file is generated
  ;; in working directory and then moved to publishing directory.
  (org-publish-attachment
   plist
   ;; Default directory could be anywhere when this function is
   ;; called.  We ensure it is set to source file directory during
   ;; compilation so as to not break links to external documents.
   (let ((default-directory (file-name-directory filename)))
     (org-latex-compile
      (org-publish-org-to
       'latex filename ".tex" plist (file-name-directory filename))))
   pub-dir))
(setq org-publish-timestamp-directory "/tmp/org-timestamps")
(add-to-list 'org-publish-project-alist
             '("publish-bachelorarbeit"
               :base-directory "~/Daten/cloud/highq/thesis-bachelor/"
               :base-extension "org"
               :include ("thesis/thesis.org")
               :exclude "\\.org$"
               :publishing-directory "~/Daten/cloud/highq/AktuellerStand"
               :publishing-function org-latex-publish-to-pdf))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((eval ap/org-call-src-block "configure-fitness-buffer")
     (eval setq-local org-confirm-babel-evaluate
           (lambda
             (lang body)
             (not
              (or
               (string= lang "python")
               (string= lang "emacs-lisp")))))
     (org-export-allow-bind-keywords . t)))))

(require 'org-ref)

(defcustom ox-word-pandoc-executable "pandoc"
  "Path to the pandoc executable.")


(defun ox-export-get-pandoc-version ()
  "Returns the major version of pandoc.
Assumes the version command returns something like \"pandoc
2.7.8\" and extracts the substring."
  (string-to-number
   (substring (shell-command-to-string (format "%s --version" ox-word-pandoc-executable)) 7 8)))


(defun ox-export-call-pandoc-tex-to-docx (biboption csl tex-file docx-file)
  "Run pandoc to convert the exported tex file to docx."
  (let* ((pandoc-version (ox-export-get-pandoc-version))
         (pandoc-command-template
          (if (>= pandoc-version 2)
              "%s -F pandoc-crossref -s %s%s\"%s\" --to=docx -o \"%s\""
            "%s -s -S %s%s\"%s\" -o \"%s\""))
     (pandoc-command (format pandoc-command-template ox-word-pandoc-executable biboption csl tex-file docx-file)))
    (message "Running %S" pandoc-command)
    (shell-command pandoc-command)))


(defun ox-export-call-pandoc-tex-to-html (biboption csl tex-file html-file)
  "Run pandoc to convert the exported tex file to html."
  (let* ((pandoc-version (ox-export-get-pandoc-version))
         (pandoc-command-template
          (if (>= pandoc-version 2)
              "%s -s %s%s\"%s\" --to=html+smart -o \"%s\""
            "%s -s -S %s%s\"%s\" -o \"%s\""))
     (pandoc-command (format pandoc-command-template ox-word-pandoc-executable biboption csl tex-file html-file)))
    (message "running %s" pandoc-command)
    (shell-command pandoc-command)))


(defun ox-export-via-latex-pandoc-to-docx-and-open (&optional async subtreep visible-only body-only options)
  "Export the current org file as a docx via LaTeX."
  (interactive)
  (let* ((bibfiles (mapcar 'expand-file-name (org-ref-find-bibliography)))
     (temp-bib)
     (bibtex-entries)
     biboption
     csl
     ;; this is probably a full path
     (current-file (buffer-file-name))
     (basename (file-name-sans-extension current-file))
     (tex-file (concat basename ".tex"))
     (docx-file (concat basename ".docx")))

    (save-buffer)

    ;; I make a temp bibfile because my big one causes pandoc to choke. This
    ;; should only create a file with the required entries.
    (when bibfiles
      (setq bibtex-entries (let* ((bibtex-files bibfiles)
                  (keys (reverse (org-ref-get-bibtex-keys)))
                  (bibtex-entry-kill-ring-max (length keys))
                  (bibtex-entry-kill-ring '()))

                 (save-window-excursion
                   (cl-loop for key in keys
                    do
                    (bibtex-search-entry key t)
                    (bibtex-kill-entry t)))
                 (mapconcat
                  'identity
                  bibtex-entry-kill-ring
                  "\n\n"))
        temp-bib (make-temp-file "ox-word-" nil ".bib")
        biboption (format " --bibliography=%s " temp-bib))
      (with-temp-file temp-bib
    (insert bibtex-entries)))

    (setq csl (cdr (assoc "PANDOC-CSL"
              (org-element-map (org-element-parse-buffer) 'keyword
                (lambda (key) (cons
                       (org-element-property :key key)
                       (org-element-property :value key)))))))
    (if csl (setq csl (format " --csl=%s " csl))
      (setq csl " "))

    (org-latex-export-to-latex async subtreep visible-only body-only options)
    ;; Now we do some post-processing on the tex-file. pandoc does not seem to
    ;; put numbers on tables and figures. Here we do it manually. If there is a
    ;; better way to get pandoc to do this, I prefer to remove this code! Tables
    ;; first.
    (let* ((table-regex "\\\\begin{table}.*
\\\\caption{\\(?1:\\(?2:.*\\)\\\\label{\\(?3:.*\\)}\\)}")
           (buf (find-file-noselect tex-file))
           (i 0)
           labels)
      (with-current-buffer buf
        (goto-char (point-min))
        (while (re-search-forward table-regex nil t)
          (incf i)
          (push (cons (match-string 3) i) labels)
          (replace-match (format "Table %d. \\2" i) nil nil nil 1))
    ;; Now replace the refs.
    (goto-char (point-min))
    (while (re-search-forward "\\\\ref{\\(?1:.*?\\)}" nil t)
      (when (cdr (assoc (match-string 1) labels))
        (replace-match (format "%d" (cdr (assoc (match-string 1) labels))))))
        (save-buffer))
      (message "done with tables."))

    ;; Now figures. We want to find the labels, and then replace the ref links.
    (let* ((fig-regex "includegraphics.*
\\\\caption{\\(?1:.*\\)\\(?2:\\\\label{\\(?3:.*\\)}\\)"
              ;; "\\includegraphics.*
              ;; \\\\caption{\\(?3:\\(?1:.*\\)\\\\label{\\(?2:.*\\)}\\)}"
              )
       (buf (find-file-noselect tex-file))
       (i 0)
       labels)
      (with-current-buffer buf
    (goto-char (point-min))
    (while (re-search-forward fig-regex nil t)
      (incf i)
      (push (cons (match-string 3) i) labels)
      (replace-match (format "Figure %d. \\1" i) nil nil nil 3))
        ;; Now replace the refs.
        (goto-char (point-min))
        (while (re-search-forward "\\\\ref{\\(?1:.*?\\)}" nil t)
          (when (cdr (assoc (match-string 1) labels))
            (replace-match (format "%d" (cdr (assoc (match-string 1) labels))))))
    (save-buffer)
    (kill-buffer buf)))


    (when (file-exists-p docx-file) (delete-file docx-file))
    (ox-export-call-pandoc-tex-to-docx biboption csl tex-file docx-file)
    (when (file-exists-p temp-bib)
      (delete-file temp-bib))
    (org-open-file docx-file '(16))))


(defun ox-export-via-latex-pandoc-to-html-and-open (&optional async subtreep visible-only body-only options)
  "Export the current org file as a html via LaTeX."
  (interactive)
  (let* ((bibfile (expand-file-name (car (org-ref-find-bibliography))))
     (temp-bib)
     (bibtex-entries)
     biboption
     csl
     ;; this is probably a full path
     (current-file (buffer-file-name))
     (basename (file-name-sans-extension current-file))
     (tex-file (concat basename ".tex"))
     (html-file (concat basename ".html")))

    (save-buffer)

    ;; I make a temp bibfile because my big one causes pandoc to choke. This
    ;; should only create a file with the required entries.
    (when bibfile
      (setq bibtex-entries (let* ((bibtex-files (org-ref-find-bibliography))
                  (keys (reverse (org-ref-get-bibtex-keys)))
                  (bibtex-entry-kill-ring-max (length keys))
                  (bibtex-entry-kill-ring '()))

                 (save-window-excursion
                   (cl-loop for key in keys
                    do
                    (bibtex-search-entry key t)
                    (bibtex-kill-entry t)))
                 (mapconcat
                  'identity
                  bibtex-entry-kill-ring
                  "\n\n"))
        temp-bib (make-temp-file "ox-html-" nil ".bib")
        biboption (format " --bibliography=%s " temp-bib))
      (with-temp-file temp-bib
    (insert bibtex-entries)))

    (setq csl (cdr (assoc "PANDOC-CSL"
              (org-element-map (org-element-parse-buffer) 'keyword
                (lambda (key) (cons
                       (org-element-property :key key)
                       (org-element-property :value key)))))))
    (if csl (setq csl (format " --csl=%s " csl))
      (setq csl " "))

    (org-latex-export-to-latex async subtreep visible-only body-only options)

    (when (file-exists-p html-file) (delete-file html-file))
    (ox-export-call-pandoc-tex-to-html biboption csl tex-file html-file)

    (when (file-exists-p temp-bib)
      (delete-file temp-bib))
    (browse-url html-file)))


(org-export-define-derived-backend 'MSWord 'latex
  :menu-entry
  '(?w "Export to MS Word"
       ((?p "via Pandoc/LaTeX" ox-export-via-latex-pandoc-to-docx-and-open))))


(org-export-define-derived-backend 'pandoc-html 'latex
  :menu-entry
  '(?h "Export to HTML"
       ((?p "via Pandoc/LaTeX" ox-export-via-latex-pandoc-to-html-and-open))))
