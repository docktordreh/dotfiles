;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
;; changes modified buffers to be orange in modeline
;; since red looks like an error occured
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)
;; add transparency to emacs. only works with a composition manager
(add-to-list 'default-frame-alist '(alpha 96 96))
(setq
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
 doom-font (font-spec :family "Fira Mono" :size 24)
 doom-big-font (font-spec :family "Fira Mono" :size 36)
 doom-variable-pitch-font (font-spec :family "Overpass" :size 24)
 doom-serif-font (font-spec :family "Overpass" :weight 'light)
 ;; There are two ways to load a theme. Both assume the theme is installed and
 ;; available. You can either set `doom-theme' or manually load a theme with the
 ;; `load-theme' function. This is the default:
 doom-theme 'doom-snazzy
 ;; This determines the style of line numbers in effect. If set to `nil', line
 ;; numbers are disabled. For relative line numbers, set this to `relative'.
 display-line-numbers-type 'relative
 )

(setq
 projectile-project-search-path '("~/Projekte")
 ;; don't keep message buffers around
 message-kill-buffer-on-exit t

 indent-tabs-mode nil
 ;; aligns company annotations to the right side
 company-tooltip-align-annotations t
 ;; localization
 calendar-week-start-day 1
 explicit-shell-file-name "/bin/zsh"
 tramp-chunksize 8192
 tramp-default-method "ssh"
 tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*"
 ; uniquify buffer names
 uniquify-buffer-name-style 'forward
 ; take new window space from all windows not just the active one
 window-combination-resize t
 ; limit undo to 80Mb (default: 400000)
 undo-limit 80000000
 ; by default while in insert changes are one big blob
 ; makes changes more granular and improves undo experience
 evil-want-fine-undo t
 ; non nil = save
 auto-save-default t
 ; keep glyphs in cache when there are a lot
 inhibit-compacting-font-caches t
 ;; Unicode ellispis are nicer than "...", and also save /precious/ space
 truncate-string-ellipsis "…"
 +ivy-buffer-preview t
 )
(setq
 org-export-in-background t
 org-export-async-init-file (concat doom-private-dir "init-org-async.el")
 org-latex-pdf-process
   '("lualatex -interaction nonstopmode -output-directory %o %f"
     "biber %b"
     "lualatex -interaction nonstopmode -output-directory %o %f"
     "lualatex -interaction nonstopmode -output-directory %o %f")

org-agenda-sorting-strategy
  (quote ((agenda time-up priority-down category-up)
          (todo todo-state-up priority-up)
          (tags priority-down)))

  org-ref-default-bibliography "~/Daten/cloud/tlaloc/org/Papers/references.bib"

  org-ref-pdf-directory "~/Daten/cloud/tlaloc/org/Papers/bibtex-pdfs"

  org-ref-bibliography-notes "~/Daten/cloud/tlaloc/org/Papers/notes.org"
  org-ref-open-pdf-function
  (lambda (fpath)
    (start-process "zathura" "*ivy-bibtex-zathura*" "/usr/bin/zathura" fpath))

  org-latex-prefer-user-labels t
  org-ref-default-citation-link "footcite"
  org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
  org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
  ;; ! => insert timestamp
  ;; @ => insert note
  ;; / => enter state
  ;; (x) => shortcut (after C-c C-t)
  ;; after the |: close todo
  org-todo-keywords '((sequence  "DELEGATED(l@/!)" "SOMEDAY(f)" "IDEA(i@/!)" "TODO(t@/!)" "STARTED(s@/!)" "NEXT(n@/!)" "WAITING(w@/!)" "|" "DONE(d@/!)" "CANCELED(c@/!)"))
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
  org-directory "~/Daten/cloud/tlaloc/org/"
  org-archive-location (concat org-directory ".archive/%s::")
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("#")
  )

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/Daten/cloud/tlaloc/org/refile.org")))
(map! :map evil-window-map
      "SPC" #'rotate-layout)
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


;; note: not a clean solution. just telling emacs to load the colors from xterm
(add-to-list 'term-file-aliases
             '("st-256color" . "xterm-256color"))
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))



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
;; opens up switch buffer after splitting
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))
;; KEY MAP
;; Avy Jump
(define-key evil-normal-state-map (kbd "M-s") #'avy-goto-char-timer)
(define-key evil-normal-state-map (kbd "M-w") #'avy-goto-word-1)
(define-key evil-motion-state-map (kbd "M-w") #'avy-goto-word-1)


(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


(after! ox-latex
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[ngerman,12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


(add-to-list 'auto-mode-alist '("\\.js$" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(after! typescript-mode
  (add-hook 'typescript-mode-hook #'tide-mode)
  (add-hook 'typescript-mode-hook #'prettier-js-mode)
  (add-hook 'typescript-mode-hook #'flycheck-mode)
  (setup-tide-mode)
  (setq typescript-indent-level 4))
(after! 'before-save-hook 'tide-format-before-save)

(setq
      ;; IMO, modern editors have trained a bad habit into us all: a burning
      ;; need for completion all the time -- as we type, as we breathe, as we
      ;; pray to the ancient ones -- but how often do you *really* need that
      ;; information? I say rarely. So opt for manual completion:
      ;; can be invoked using C-SPC
 company-idle-delay nil
      )

(setq magit-repository-directories '(("~/Projekte" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t)

(setq require-final-newline nil)
(after! org
  (add-to-list 'org-modules 'org-habit t))

;; I don't need the menu. I know all the shortcuts.
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(after! web-mode
  (add-hook 'web-mode-hook #'flycheck-mode))

'(org-preview-latex-process-alist
       (quote
       ((dvipng :programs
         ("lualatex" "dvipng")
         :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
         (1.0 . 1.0)
         :latex-compiler
         ("lualatex -output-format dvi -interaction nonstopmode -output-directory %o %f")
         :image-converter
         ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))
 (dvisvgm :programs
          ("latex" "dvisvgm")
          :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "xdv" :image-output-type "svg" :image-size-adjust
          (1.7 . 1.5)
          :latex-compiler
          ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
          :image-converter
          ("dvisvgm %f -n -b min -c %S -o %O"))
 (imagemagick :programs
              ("latex" "convert")
              :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
              (1.0 . 1.0)
              :latex-compiler
              ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("convert -density %D -trim -antialias %f -quality 100 %O")))))

(after! centaur-tabs
  (setq centaur-tabs-set-bar 'under)
  ;; Note: If you're not using Spacmeacs, in order for the underline to display
  ;; correctly you must add the following line:
  (setq x-underline-at-descent-line t))

(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
(yas-global-mode 1)

(setenv "PATH" (concat (getenv "PATH") ":/opt/texlive/2020/bin/x86_64-linux"))
(setq exec-path (append exec-path '("/opt/texlive/2020/bin/x86_64-linux")))

(setenv "PATH" (concat (getenv "PATH") ":/home/valentin/.cargo/bin"))
(setq exec-path (append exec-path '("/home/valentin/.cargo/bin")))

(custom-set-faces! '(doom-modeline-evil-insert-state
                     :weight bold
                     :foreground "#339CDB"))
(display-time-mode 1)
(display-battery-mode 1)
(global-whitespace-mode +1)
(global-visual-line-mode t)
(find-file "~/Daten/cloud/tlaloc/org/todo.org")
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
