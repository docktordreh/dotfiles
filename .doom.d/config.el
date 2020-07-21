;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Personal Information][Personal Information:1]]
(setq user-full-name "Valentin Lechner"
      user-mail-address "valentin_lechner@dismail.de")
;; Personal Information:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:1]]
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;; My defaults:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:2]]
(add-to-list 'auto-mode-alist '("'" . org-mode) t)
;; My defaults:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:3]]
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; My defaults:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:4]]
(add-hook 'emacs-startup-hook 'delete-other-windows t)
;; My defaults:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:5]]
(golden-ratio-mode 1)
;; My defaults:5 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:6]]
(setq  indent-tabs-mode nil)
;; My defaults:6 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:7]]
(setq message-kill-buffer-on-exit t)
;; My defaults:7 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:8]]
(setq calendar-week-start-day 1)
;; My defaults:8 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:9]]
(setq company-tooltip-align-annotations t)
;; My defaults:9 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:10]]
(add-hook 'evil-normal-state-entry-hook #'company-abort)
;; My defaults:10 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:11]]
(set-company-backend! '(text-mode
                        markdown-mode
                        gfm-mode)
  '(:seperate company-ispell
              company-files
              company-yasnippet))

(setq ispell-dictionary "en-custom")
;; My defaults:11 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:12]]
(setq explicit-shell-file-name "/bin/zsh")
;; My defaults:12 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:13]]
(setq  uniquify-buffer-name-style 'forward)
;; My defaults:13 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:14]]
(setq window-combination-resize t)
;; My defaults:14 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:15]]
(setq undo-limit 80000000)
;; My defaults:15 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:16]]
(setq evil-want-fine-undo t)
;; My defaults:16 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:17]]
(setq auto-save-default t)
;; My defaults:17 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:18]]
(beacon-mode)
;; My defaults:18 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:19]]
(setq inhibit-compacting-font-caches t)
;; My defaults:19 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:20]]
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)
;; My defaults:20 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:21]]
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; My defaults:21 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:22]]
(setq truncate-string-ellipsis "…")
;; My defaults:22 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:23]]
(setq +ivy-buffer-preview t)
;; My defaults:23 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:24]]
(after! evil (evil-escape-mode nil))
;; My defaults:24 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:25]]
(setq company-idle-delay nil)
;; My defaults:25 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:26]]
(setq require-final-newline nil)
;; My defaults:26 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:27]]
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
;; My defaults:27 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:28]]
(global-whitespace-mode +1)
;; My defaults:28 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:29]]
(global-visual-line-mode +1)
;; My defaults:29 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:30]]
(display-time-mode +1)
(display-battery-mode +1)
;; My defaults:30 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:31]]
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; My defaults:31 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:32]]
(setq-default large-file-warning-threshold 100000000)
;; My defaults:32 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:33]]
(setq mouse-yank-at-point t)
;; My defaults:33 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*My defaults][My defaults:34]]
(flyspell-lazy-mode 1)
(flyspell-mode 1)
;; My defaults:34 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Reload Theme][Reload Theme:1]]
(add-hook! 'doom-load-theme-hook #'theme-magic-from-emacs)
;; Reload Theme:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Treemacs][Treemacs:1]]
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

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Treemacs Blocklist][Treemacs Blocklist:1]]
(setq treemacs-file-ignore-extensions '(;; LaTeX
                                        "aux"
                                        "ptc"
                                        "fdb_latexmk"
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
                                        ))
(setq treemacs-file-ignore-globs '(;; LaTeX
                                   "*/_minted-*"
                                   ;; AucTeX
                                   "*/.auctex-auto"
                                   "*/_region_.log"
                                   "*/_region_.tex"))
;; Treemacs Blocklist:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*PATH][PATH:1]]
(setenv "PATH" (concat (getenv "PATH") ":/opt/texlive/2020/bin/x86_64-linux"))
(setq exec-path (append exec-path '("/opt/texlive/2020/bin/x86_64-linux")))

(setenv "PATH" (concat (getenv "PATH") ":/home/valentin/.cargo/bin"))
(setq exec-path (append exec-path '("/home/valentin/.cargo/bin")))
;; PATH:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*PATH][PATH:2]]
(setenv "PATH" (concat (getenv "PATH") ":/home/valentin/.pyenv/bin"))
(setq exec-path (append exec-path '("/home/valentin/.pyenv/bin")))
;; PATH:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:1]]
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
;; UI Improvements:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:2]]
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "#57c7ff"))
;; UI Improvements:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:3]]
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)
;; UI Improvements:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:4]]
(add-to-list 'default-frame-alist '(alpha 90 90))
;; UI Improvements:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:5]]
(setq
 doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 18)
 doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 18)
 doom-variable-pitch-font (font-spec :family "EB Garamond 08" :size 28)
 doom-serif-font (font-spec :family "Fira Sans" :size 18))
;; UI Improvements:5 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:6]]
(setq doom-theme 'doom-moonlight)
;; UI Improvements:6 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:7]]
(setq display-line-numbers-type 'relative)
;; UI Improvements:7 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*UI Improvements][UI Improvements:8]]
(custom-set-faces! '(doom-modeline-evil-insert-state
                     :weight bold
                     :foreground "#339CDB"))
;; UI Improvements:8 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*General keymaps][General keymaps:1]]
(global-set-key (kbd "C-c e") 'org-latex-export-to-pdf)
;; General keymaps:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*General keymaps][General keymaps:2]]
(map! :map evil-window-map "SPC" #'rotate-layout)
;; General keymaps:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Projects][Projects:1]]
(setq
 projectile-project-search-path '("~/Projekte"))
;; Projects:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Projects][Projects:2]]
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of 'projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))
;; Projects:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Mode][Org Mode:1]]
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (c . t)
   (sh . t)
   (plantuml . t)
   (python . t)
 )
)
;; Org Mode:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Mode][Org Mode:2]]
(setq
 org-directory "~/Daten/cloud/tlaloc/org/"
 org-archive-location (concat org-directory ".archive/$s::")
)
;; Org Mode:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Mode][Org Mode:3]]
(setq org-use-property-inheritance t)
;; Org Mode:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Mode][Org Mode:4]]
(after! org
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))
;; Org Mode:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:2]]
(setq-hook! org-mode
  org-log-done t
  org-image-actual-width '(700)
  org-clock-into-drawer t
  org-clock-persist t
  org-columns-default-format "%60ITEM(Task) %20TODO %10Effort(Effort){:} %10CLOCKSUM"
  org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                ("STYLE_ALL" . "habit")))
  org-confirm-babel-evaluate nil
  org-duration-format '((special . h:mm))
  org-hide-emphasis-markers t
  org-fontify-done-headline t
  org-fontify-whole-heading-line t
  org-fontify-quote-and-verse-blocks t
  )

(setq org-journal-enable-agenda-integration t)
;; Look and feel:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:3]]
(setq
  org-ellipsis " ▼ "
  org-superstar-headline-bullets-list '("✿" "■" "◆" "▲" "#")
)
;; Look and feel:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:4]]
(evil-define-command evil-buffer-org-new (count file)
  "Creates a new ORG buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new org*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (org-mode)))))
(map! :leader
  (:prefix "b"
    :desc "New empty ORG buffer" "o" #'evil-buffer-org-new))
;; Look and feel:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:5]]
(remove-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)
;; Look and feel:5 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:6]]
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
 '(org-document-title ((t (:inherit default :weight bold :foreground "#57c7ff" :height 2.0 :underline nil))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#5af78e" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#ff6ac1" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#f3f99d" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#9aeedf" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#ff5c57"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#57c7ff"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#5af78e"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#ff6ac1"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:foreground "cyan"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
;; Look and feel:6 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:7]]
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 ()
                                (compose-region
                                 (match-beginning 1)
                                 (match-end 1) "•"
                                 )
                                )
                              )
                           )
                          )
                        )
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([+]\\) "
                           (0 (prog1 ()
                                (compose-region
                                 (match-beginning 1)
                                 (match-end 1) "◦"
                                 )
                                )
                              )
                           )
                          )
                        )
;; Look and feel:7 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:8]]
(setq org-hide-leading-stars t)
;; Look and feel:8 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:9]]
(setq org-src-fontify-natively t)
;; Look and feel:9 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:10]]
(add-hook! 'org-mode-hook #'+org-pretty-mode
           'org-fragtog-mode
           'writeroom-mode
           'mixed-pitch-mode)
(setq global-org-pretty-table-mode t)
(setq
 org-fontify-whole-heading-line t
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t)
;; Look and feel:10 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:11]]
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'auto-fill-mode)
;; Look and feel:11 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:12]]
(setq org-enforce-todo-dependencies t)
(setq org-insert-heading-respect-content nil)
(setq org-reverse-note-order nil)
(setq org-deadline-warning-days 7)
(setq org-blank-before-new-entry (quote ((heading . t)
                                         (plain-list-item . nil))))
;; Look and feel:12 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:13]]
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

       ;; NOTE: I prefer RET to not follow links, but by uncommenting this block, links will be
       ;; followed.

       ;; ((eq 'link (car (org-element-context)))
       ;;  ;; Link: Open it.
       ;;  (org-open-at-point-global))

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
;; Look and feel:13 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Look and feel][Look and feel:14]]
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
;; Look and feel:14 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Smart parentheses][Smart parentheses:1]]
(sp-local-pair
     '(org-mode)
     "<<" ">>"
     :actions '(insert))
;; Smart parentheses:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org-Tags as icons][Org-Tags as icons:1]]
(customize-set-value
    'org-agenda-category-icon-alist
    '(
      ("work" "~/.config/icons/money-bag.svg" nil nil :ascent center)
      ("chore" "~/.config/icons/loop.svg" nil nil :ascent center)
      ("events" "~/.config/icons/calendar.svg" nil nil :ascent center)
      ("todo" "~/.config/icons/checklist.svg" nil nil :ascent center)
      ("walk" "~/.config/icons/walk.svg" nil nil :ascent center)
      ("solution" "~/.config/icons/solution.svg" nil nil :ascent center)
      ("highQ" "~/.config/icons/highQ.svg" nil nil :ascent center)
      ))
;; Org-Tags as icons:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org-Tags as icons][Org-Tags as icons:2]]
(setq org-agenda-breadcrumbs-seperator " ❱ ")
;; Org-Tags as icons:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org-Tags as icons][Org-Tags as icons:3]]
(setq org-hide-emphasis-markers t)
;; Org-Tags as icons:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Chef][Org Chef:1]]
(use-package! org-chef
  :commands (org-chef-insert-recipe org-chef-get-recipe-from-url))
;; Org Chef:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Deft][Deft:1]]
(setq deft-extensions '("org"))
(setq deft-directory "~/Daten/cloud/tlaloc/org")
;; Deft:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Roam][Roam:1]]
(use-package org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8078
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))
;; Roam:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Capture][Capture:1]]
(require 'org-roam-protocol)
;; Capture:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Capture][Capture:2]]
(setq org-capture-templates `(
    ("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
    ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %? [[%:link][%:description]] \nCaptured On: %U")
))
;; Capture:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Refile][Refile:1]]
(global-set-key (kbd "C-c o")
  (lambda () (interactive) (find-file (concat org-directory "refile.org"))))
;; Refile:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:1]]
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator ""
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)
;; Agenda:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:2]]
(setq org-agenda-files (list
                        org-directory
                        "~/Daten/cloud/highq/thesis-bachelor/org"))
;; Agenda:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:3]]
(setq org-deadline-warning-days 7)
;; Agenda:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:4]]
(setq org-agenda-block-separator (string-to-char " "))
(setq org-agenda-custom-commands
      '(("o" "My Agenda"
         ((todo "TODO" (
                      (org-agenda-overriding-header "\n⚡ Do Today:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format " %-2i %-15b")
                      (org-agenda-todo-keyword-format "")
                       ))
          (agenda "" (
                      (org-agenda-start-day "+0d")
                      (org-agenda-span 5)
                      (org-agenda-overriding-header "⚡ Schedule:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-repeating-timestamp-show-all nil)
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format   "  %-3i  %-15b %t%s")
                      (org-agenda-todo-keyword-format " ☐ ")
                      (org-agenda-current-time-string "⮜┈┈┈┈┈┈┈ now")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-time-grid (quote ((daily today remove-match)
                                                    (0900 1200 1500 1800 2100)
                                                    "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                       ))
          ))))
;; Agenda:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:5]]
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(setq org-hierarchical-todo-statistics t)
;; Agenda:5 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:6]]
(add-hook 'org-mode-hook
          (lambda ()
            (push '("TODO"  . ?▲) prettify-symbols-alist)
            (push '("DONE"  . ?✓) prettify-symbols-alist)
            (push '("CANCELLED"  . ?✘) prettify-symbols-alist)
            (push '("WAITING"  . ?…) prettify-symbols-alist)
            (push '("SOMEDAY"  . ??) prettify-symbols-alist)))
;; Agenda:6 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:7]]
(setq org-fontify-done-headline t)

;; Agenda:7 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:8]]
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f12>") 'org-agenda-list)
;; Agenda:8 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:9]]
(setq org-agenda-sorting-strategy
  (quote ((agenda time-up priority-down category-up)
          (todo todo-state-up priority-up)
          (tags priority-down))))
;; Agenda:9 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:10]]
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
;; Agenda:10 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:11]]
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
;; Agenda:11 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:12]]
(setq
  org-tag-persistent-alist
  '((:startgroup . nil)
    ("HOME" . ?h)
    ("RESEARCH" . ?r)
    ("TEACHING" . ?t)
    ("STUDYING" . ?s)
    ("HIGHQ" . ?h)
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
;; Agenda:12 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:13]]
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
    ("HIGHQ" . (
                   :foreground "DeepSkyBlue"
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
;; Agenda:13 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:14]]
(setq org-todo-repeat-to-state "NEXT")
;; Agenda:14 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:15]]
(setq
  org-fast-tag-selection-single-key t
  org-use-fast-todo-selection t
)
;; Agenda:15 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:16]]
(after! org
  (setq org-ellipsis " ▾ "
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue))))
;; Agenda:16 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Agenda][Agenda:17]]
(after! org
  (appendq! +pretty-code-symbols
            '(:checkbox      "☐"
              :pending       "◼"
              :checkedbox    "☑"
              :list_property "∷"
              :results       "🠶"
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
              :begin_export  "⯮"
              :end_export    "⯬"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
              :em_dash       "—"))
  (set-pretty-symbols! 'org-mode
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
    :em_dash       "---"))
(plist-put +pretty-code-symbols :name "›")
;; Agenda:17 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Ref][Org Ref:1]]
(setq
 org-ref-default-bibliography "~/Daten/cloud/tlaloc/org/Papers/references.bib"

 org-ref-pdf-directory "~/Daten/cloud/tlaloc/org/Papers/bibtex-pdfs"

 org-ref-bibliography-notes "~/Daten/cloud/tlaloc/org/Papers/notes.org"
 org-ref-open-pdf-function
 (lambda (fpath)
   (start-process "zathura" "*ivy-bibtex-zathura*" "/usr/bin/zathura" fpath))
)
;; Org Ref:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Ref][Org Ref:2]]
(setq org-ref-default-citation-link "footcite")
;; Org Ref:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LSP Support in src blocks][LSP Support in src blocks:1]]
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
    '("go" "python" "ipython" "bash" "sh"))
  (dolist (lang org-babel-lang-list)
    (eval `(lsp-org-babel-enable ,lang)))
;; LSP Support in src blocks:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX Fragments][LaTeX Fragments:1]]
(after! org
  (setq org-highlight-latex-and-related '(native script entities)))
;; LaTeX Fragments:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Export][Export:1]]
(setq org-latex-prefer-user-labels t)
;; Export:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Export][Export:2]]
(setq org-export-with-smart-quotes t)
;; Export:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Async Export][Org Async Export:1]]
(setq
 org-export-in-background t
 org-export-async-init-file (concat doom-private-dir "init-org-async.el"))
;; Org Async Export:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Languages][Languages:1]]
(setq org-export-default-language "de")
;; Languages:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*View exported file][View exported file:1]]
(after! org
  (map! :map org-mode-map
        :localleader
        :desc "View exported file" "v" #'org-view-output-file)

  (defun org-view-output-file (&optional org-file-path)
    (interactive)
    "Visit buffer open on the first output file (if any) found, using 'org-view-output-file-extensions'"
    (let* ((org-file-path (or org-file-path (buffer-file-name) ""))
           (dir (file-name-directory org-file-path))
           (basename (file-name-base org-file-path))
           (output-file nil))
      (dolist (ext org-view-output-file-extensions)
        (unless output-file
          (when (file-exists-p
                 (concat dir basename "." ext))
                 (setq output-file (concat dir basename "." ext)))))
      (if output-file
        (pop-to-buffer (or (find-buffer-visiting output-file)
                           (find-file-noselect output-file)))
        (message "No exported file found")))))

(defvar org-view-output-file-extensions '("pdf" "md" "rst" "txt" "tex")
  "Search for output files with these extensions, in order, viewing the first that matches")
;; View exported file:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:1]]
(setq
 org-latex-pdf-process
 '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "biber %b"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
   "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; LaTeX:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:2]]
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
;; LaTeX:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:3]]
(after! ox-latex
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[ngerman,12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
;; LaTeX:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:4]]
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
;; LaTeX:4 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:5]]
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
;; LaTeX:5 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:6]]
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
;; LaTeX:6 ends here

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

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:8]]
(setq org-latex-listings 'minted)
;; LaTeX:8 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:9]]
 (after! org
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
       (message "Latex fragment justification disabled"))))
;; LaTeX:9 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Extra header content][Extra header content:1]]
(defadvice! org-html-template-fancier (contents info)
  "Return complete document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options. Adds a few extra things to the body
compared to the default implementation."
  :override #'org-html-template
  (concat
   (when (and (not (org-html-html5-p info)) (org-html-xhtml-p info))
     (let* ((xml-declaration (plist-get info :html-xml-declaration))
      (decl (or (and (stringp xml-declaration) xml-declaration)
          (cdr (assoc (plist-get info :html-extension)
          xml-declaration))
          (cdr (assoc "html" xml-declaration))
          "")))
       (when (not (or (not decl) (string= "" decl)))
   (format "%s\n"
     (format decl
       (or (and org-html-coding-system
          (fboundp 'coding-system-get)
          (coding-system-get org-html-coding-system 'mime-charset))
           "iso-8859-1"))))))
   (org-html-doctype info)
   "\n"
   (concat "<html"
     (cond ((org-html-xhtml-p info)
      (format
       " xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"%s\" xml:lang=\"%s\""
       (plist-get info :language) (plist-get info :language)))
     ((org-html-html5-p info)
      (format " lang=\"%s\"" (plist-get info :language))))
     ">\n")
   "<head>\n"
   (org-html--build-meta-info info)
   (org-html--build-head info)
   (org-html--build-mathjax-config info)
   "</head>\n"
   "<body>\n<input type='checkbox' id='theme-switch'><div id='page'><label id='switch-label' for='theme-switch'></label>"
   (let ((link-up (org-trim (plist-get info :html-link-up)))
   (link-home (org-trim (plist-get info :html-link-home))))
     (unless (and (string= link-up "") (string= link-home ""))
       (format (plist-get info :html-home/up-format)
         (or link-up link-home)
         (or link-home link-up))))
   ;; Preamble.
   (org-html--build-pre/postamble 'preamble info)
   ;; Document contents.
   (let ((div (assq 'content (plist-get info :html-divs))))
     (format "<%s id=\"%s\">\n" (nth 1 div) (nth 2 div)))
   ;; Document title.
   (when (plist-get info :with-title)
     (let ((title (and (plist-get info :with-title)
           (plist-get info :title)))
     (subtitle (plist-get info :subtitle))
     (html5-fancy (org-html--html5-fancy-p info)))
       (when title
   (format
    "<div class='page-header'><div class='page-meta'>%s, %s</div><h1 class=\"title\">%s%s</h1></div>\n"
    (format-time-string "%Y-%m-%d %A %-I:%M%p")
    (org-export-data (plist-get info :author) info)
    (org-export-data title info)
    (if subtitle
        (format
         (if html5-fancy
       "<p class=\"subtitle\">%s</p>\n"
     (concat "\n" (org-html-close-tag "br" nil info) "\n"
       "<span class=\"subtitle\">%s</span>\n"))
         (org-export-data subtitle info))
      "")))))
   contents
   (format "</%s>\n" (nth 1 (assq 'content (plist-get info :html-divs))))
   ;; Postamble.
   (org-html--build-pre/postamble 'postamble info)
   ;; Possibly use the Klipse library live code blocks.
   (when (plist-get info :html-klipsify-src)
     (concat "<script>" (plist-get info :html-klipse-selection-script)
       "</script><script src=\""
       org-html-klipse-js
       "\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\""
       org-html-klipse-css "\"/>"))
   ;; Closing document.
   "</div>\n</body>\n</html>"))
;; Extra header content:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Extra header content][Extra header content:2]]
(defun org-html--build-meta-entry (label identity &optional content-format &rest content-formatters)
  "Construct <meta> tag with LABEL=\"IDENTITY\" and content from CONTENT-FORMAT and CONTENT-FORMATTER."
  (concat "<meta "
          (format "%s=\"%s" label identity)
          (when content-format
            (concat "\" content=\""
                    (replace-regexp-in-string
                     "\"" "&quot;"
                     (org-html-encode-plain-text
                      (if content-formatters
                          (apply #'format content-format content-formatters)
                        content-format)))))
          "\" />\n"))

(defadvice! org-html--build-meta-info-extended (info)
  "Return meta tags for exported document, with more meta than usual.
INFO is a plist used as a communication channel."
  :override #'org-html--build-meta-info
  (let* ((protect-string
          (lambda (str)
            (replace-regexp-in-string
             "\"" "&quot;" (org-html-encode-plain-text str))))
         (title (org-export-data (plist-get info :title) info))
         ;; Set title to an invisible character instead of leaving it
         ;; empty, which is invalid.
         (title (if (org-string-nw-p title) title "&lrm;"))
         (subtitle (org-export-data (plist-get info :subtitle) info))
         (author (and (plist-get info :with-author)
                      (let ((auth (plist-get info :author)))
         ;; Return raw Org syntax.
                        (and auth (org-element-interpret-data auth)))))
         (description (plist-get info :description))
         (keywords (plist-get info :keywords))
         (charset (or (and org-html-coding-system
                           (fboundp 'coding-system-get)
                           (coding-system-get org-html-coding-system
                                              'mime-charset))
                      "iso-8859-1")))
    (concat
     (when (plist-get info :time-stamp-file)
       (format-time-string
        (concat "<!-- "
                (plist-get info :html-metadata-timestamp-format)
                " -->\n")))

     (org-html--build-meta-entry "charset" charset)

     (let ((viewport-options
            (cl-remove-if-not (lambda (cell) (org-string-nw-p (cadr cell)))
                              (plist-get info :html-viewport))))
       (if viewport-options
           (org-html--build-meta-entry "name" "viewport"
                                       (mapconcat
                                        (lambda (elm) (format "%s=%s" (car elm) (cadr elm)))
                                        viewport-options ", "))))

     (format "<title>%s</title>\n" title)

     (org-html--build-meta-entry "name" "generator" "Org Mode")

     (when (org-string-nw-p author)
       (org-html--build-meta-entry "name" "author" author))

     (when (org-string-nw-p description)
       (org-html--build-meta-entry "name" "description" description))

     (when (org-string-nw-p keywords)
       (org-html--build-meta-entry "name" "keywords" keywords))

     (org-html--build-meta-entry "name" "theme-color" "#77aa99")

     (org-html--build-meta-entry "property" "og:title" title)
     (org-html--build-meta-entry "property" "og:type" "article")
     (org-html--build-meta-entry "property" "og:image" "https://tecosaur.com/resources/org/nib.png")
     (when (org-string-nw-p author)
       (org-html--build-meta-entry "property" "og:article:author:first_name" (car (s-split " " author))))
     (when (and (org-string-nw-p author) (s-contains-p " " author))
       (org-html--build-meta-entry "property" "og:article:author:first_name" (cdr (s-split-up-to " " author 2))))
     (org-html--build-meta-entry "property" "og:article:published_time" (format-time-string "%FT%T%z"))
     (when (org-string-nw-p subtitle)
       (org-html--build-meta-entry "property" "og:description" subtitle)))))
;; Extra header content:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Custom CSS/JS][Custom CSS/JS:2]]
(after! org
  (setq org-html-style-default
        (concat (f-read-text (expand-file-name "misc/org-export-header.html" doom-private-dir))
              "<script>\n"
              (f-read-text (expand-file-name "misc/pile-css-theme/main.js" doom-private-dir))
              "</script>\n<style>\n"
              (f-read-text (expand-file-name "misc/pile-css-theme/main.css" doom-private-dir))
              "</style>")
        org-html-htmlize-output-type 'css
        org-html-doctype "html5"
        org-html-html5-fancy t))
;; Custom CSS/JS:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::Src blocks][Src blocks]]
(defadvice! org-html-src-block-collapsable (orig-fn src-block contents info)
  "Wrap the usual <pre> block in a <details>"
  :around #'org-html-src-block
  (let* ((properties (cadr src-block))
         (lang (mode-name-to-lang-name
          (plist-get properties :language)))
         (name (plist-get properties :name))
         (ref (org-export-get-reference src-block info)))
    (format
     "<details id='%s' class='code'%s><summary%s>%s</summary>
<div class='gutter'>
<a href='#%s'>#</a>
<button title='Copy to clipboard' onclick='copyPreToClipdord(this)'>⎘</button>\
</div>
%s
</details>"
     ref
     (if (member (org-export-read-attribute :attr_html src-block :collapsed)
                 '("y" "yes" "t" "true"))
         "" " open")
     (if name " class='named'" "")
     (if (not name) (concat "<span class='lang'>" lang "</span>")
       (format "<span class='name'>%s</span><span class='lang'>%s</span>" name lang))
     ref
     (if name
         (replace-regexp-in-string (format "<pre\\( class=\"[^\"]+\"\\)? id=\"%s\">" ref) "<pre\\1>"
                                   (funcall orig-fn src-block contents info))
       (funcall orig-fn src-block contents info)))))

(defun mode-name-to-lang-name (mode)
  (or (cadr (assoc mode
                   '(("asymptote" "Asymptote")
                     ("awk" "Awk")
                     ("C" "C")
                     ("clojure" "Clojure")
                     ("css" "CSS")
                     ("D" "D")
                     ("ditaa" "ditaa")
                     ("dot" "Graphviz")
                     ("calc" "Emacs Calc")
                     ("emacs-lisp" "Emacs Lisp")
                     ("fortran" "Fortran")
                     ("gnuplot" "gnuplot")
                     ("haskell" "Haskell")
                     ("hledger" "hledger")
                     ("java" "Java")
                     ("js" "Javascript")
                     ("latex" "LaTeX")
                     ("ledger" "Ledger")
                     ("lisp" "Lisp")
                     ("lilypond" "Lilypond")
                     ("lua" "Lua")
                     ("matlab" "MATLAB")
                     ("mscgen" "Mscgen")
                     ("ocaml" "Objective Caml")
                     ("octave" "Octave")
                     ("org" "Org mode")
                     ("oz" "OZ")
                     ("plantuml" "Plantuml")
                     ("processing" "Processing.js")
                     ("python" "Python")
                     ("R" "R")
                     ("ruby" "Ruby")
                     ("sass" "Sass")
                     ("scheme" "Scheme")
                     ("screen" "Gnu Screen")
                     ("sed" "Sed")
                     ("sh" "shell")
                     ("sql" "SQL")
                     ("sqlite" "SQLite")
                     ("forth" "Forth")
                     ("io" "IO")
                     ("J" "J")
                     ("makefile" "Makefile")
                     ("maxima" "Maxima")
                     ("perl" "Perl")
                     ("picolisp" "Pico Lisp")
                     ("scala" "Scala")
                     ("shell" "Shell Script")
                     ("ebnf2ps" "ebfn2ps")
                     ("cpp" "C++")
                     ("abc" "ABC")
                     ("coq" "Coq")
                     ("groovy" "Groovy")
                     ("bash" "bash")
                     ("csh" "csh")
                     ("ash" "ash")
                     ("dash" "dash")
                     ("ksh" "ksh")
                     ("mksh" "mksh")
                     ("posh" "posh")
                     ("ada" "Ada")
                     ("asm" "Assembler")
                     ("caml" "Caml")
                     ("delphi" "Delphi")
                     ("html" "HTML")
                     ("idl" "IDL")
                     ("mercury" "Mercury")
                     ("metapost" "MetaPost")
                     ("modula-2" "Modula-2")
                     ("pascal" "Pascal")
                     ("ps" "PostScript")
                     ("prolog" "Prolog")
                     ("simula" "Simula")
                     ("tcl" "tcl")
                     ("tex" "LaTeX")
                     ("plain-tex" "TeX")
                     ("verilog" "Verilog")
                     ("vhdl" "VHDL")
                     ("xml" "XML")
                     ("nxml" "XML")
                     ("conf" "Configuration File"))))
      mode))
;; Src blocks ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::Example, fixed width, and property blocks][Example, fixed width, and property blocks]]
(after! org
  (defun org-html-block-collapsable (orig-fn block contents info)
    "Wrap the usual block in a <details>"
    (let ((ref (org-export-get-reference block info))
          (type (case (car block)
                  ('property-drawer "Properties")))
          (collapsed-default (case (car block)
                  ('property-drawer t)
                  (t nil)))
          (collapsed-value (org-export-read-attribute :attr_html block :collapsed)))
      (format
       "<details id='%s' class='code'%s>
<summary%s>%s</summary>
<div class='gutter'>\
<a href='#%s'>#</a>
<button title='Copy to clipboard' onclick='copyPreToClipdord(this)'>⎘</button>\
</div>
%s\n
</details>"
       ref
       (if (or (and collapsed-value (member collapsed-value '("y" "yes" "t" "true")))
               collapsed-default)
               "" " open")
       (if type " class='named'" "")
       (if type (format "<span class='type'>%s</span>" type) "")
       ref
       (funcall orig-fn block contents info))))

  (advice-add 'org-html-example-block   :around #'org-html-block-collapsable)
  (advice-add 'org-html-fixed-width     :around #'org-html-block-collapsable)
  (advice-add 'org-html-property-drawer :around #'org-html-block-collapsable))
;; Example, fixed width, and property blocks ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Handle table overflow][Handle table overflow:1]]
(defadvice! org-html-table-wrapped (orig-fn table contents info)
  "Wrap the usual <table> in a <div>"
  :around #'org-html-table
  (let* ((name (plist-get (cadr table) :name))
         (ref (org-export-get-reference table info)))
    (format "<div id='%s' class='table'>
<div class='gutter'><a href='#%s'>#</a></div>
<div class='tabular'>
%s
</div>\
</div>"
            ref ref
            (if name
                (replace-regexp-in-string (format "<table id=\"%s\"" ref) "<table"
                                          (funcall orig-fn table contents info))
              (funcall orig-fn table contents info)))))
;; Handle table overflow:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*TOC as a collapsable tree][TOC as a collapsable tree:1]]
(defadvice! org-html--format-toc-headline-colapseable (orig-fn headline info)
  "Add a label and checkbox to `org-html--format-toc-headline's usual output,
to allow the TOC to be a collapseable tree."
  :around #'org-html--format-toc-headline
  (let ((id (or (org-element-property :CUSTOM_ID headline)
                (org-export-get-reference headline info))))
    (format "<input type='checkbox' id='toc--%s'/><label for='toc--%s'>%s</label>"
            id id (funcall orig-fn headline info))))
;; TOC as a collapsable tree:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*TOC as a collapsable tree][TOC as a collapsable tree:2]]
(defadvice! org-html--toc-text-stripped-leaves (orig-fn toc-entries)
  "Remove label"
  :around #'org-html--toc-text
  (replace-regexp-in-string "<input [^>]+><label [^>]+>\\(.+?\\)</label></li>" "\\1</li>"
                            (funcall orig-fn toc-entries)))
;; TOC as a collapsable tree:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Make verbatim different to code][Make verbatim different to code:1]]
(setq org-html-text-markup-alist
      '((bold . "<b>%s</b>")
        (code . "<code>%s</code>")
        (italic . "<i>%s</i>")
        (strike-through . "<del>%s</del>")
        (underline . "<span class=\"underline\">%s</span>")
        (verbatim . "<kbd>%s</kbd>")))
;; Make verbatim different to code:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Change checkbox type][Change checkbox type:1]]
(after! org
(appendq! org-html-checkbox-types '((html-span .
	  ((on . "<span class='checkbox'></span>")
	  (off . "<span class='checkbox'></span>")
	  (trans . "<span class='checkbox'></span>")))))
(setq org-html-checkbox-type 'html-span))
;; Change checkbox type:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Header anchors][Header anchors:1]]
(after! org
  (defun tec/org-export-html-headline-anchor (text backend info)
    (when (org-export-derived-backend-p backend 'html)
        (replace-regexp-in-string
         "<h\\([0-9]\\) id=\"\\([a-z0-9-]+\\)\">\\(.*[^ ]\\)<\\/h[0-9]>" ; this is quite restrictive, but due to `org-heading-contraction' I can do this
         "<h\\1 id=\"\\2\">\\3<a aria-hidden=\"true\" href=\"#\\2\">#</a> </h\\1>"
         text)))

  (add-to-list 'org-export-filter-headline-functions
               'tec/org-export-html-headline-anchor))
;; Header anchors:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX Rendering][LaTeX Rendering:1]]
(after! org
  (defadvice! org-html-latex-fragment-scaled (latex-fragment _contents info)
    "Transcode a LATEX-FRAGMENT object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
    :override #'org-html-latex-fragment
    (let ((latex-frag (org-element-property :value latex-fragment))
          (processing-type (plist-get info :with-latex))
          (attrs '(:class (concat "latex-fragment"
                                  (if (equal "\\(" (substring latex-frag) 0 2)
                                      "inline" "block")))))
      (when (eq processing-type 'dvipng)
        (plist-put attrs :style (format "transform: scale(%.3f)" (/ 1.0 preview-scale))))
      (cond
       ((memq processing-type '(t mathjax))
        (org-html-format-latex latex-frag 'mathjax info))
       ((memq processing-type '(t html))
        (org-html-format-latex latex-frag 'html info))
       ((assq processing-type org-preview-latex-process-alist)
        (let ((formula-link
               (org-html-format-latex latex-frag processing-type info)))
          (when (and formula-link (string-match "file:\\([^]]*\\)" formula-link))
            (let ((source (org-export-file-uri (match-string 1 formula-link))))
              (org-html--format-image source attrs info)))))
       (t latex-frag))))

  (defadvice! org-html-latex-environment-scaled (latex-environment _contents info)
    "Transcode a LATEX-ENVIRONMENT element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
    :override #'org-html-latex-environment
    (let ((processing-type (plist-get info :with-latex))
          (latex-frag (org-remove-indentation
                       (org-element-property :value latex-environment)))
          (attributes (org-export-read-attribute :attr_html latex-environment))
          (label (and (org-element-property :name latex-environment)
                      (org-export-get-reference latex-environment info)))
          (caption (and (org-html--latex-environment-numbered-p latex-environment)
                        (number-to-string
                         (org-export-get-ordinal
                          latex-environment info nil
                          (lambda (l _)
                            (and (org-html--math-environment-p l)
                                 (org-html--latex-environment-numbered-p l))))))))
      (plist-put attributes :class "latex-environment")
      (when (eq processing-type 'dvipng)
        (plist-put attributes :style (format "transform: scale(%.3f)" (/ 1.0 preview-scale))))
      (cond
       ((memq processing-type '(t mathjax))
        (org-html-format-latex
         (if (org-string-nw-p label)
             (replace-regexp-in-string "\\`.*"
                                       (format "\\&\n\\\\label{%s}" label)
                                       latex-frag)
           latex-frag)
         'mathjax info))
       ((assq processing-type org-preview-latex-process-alist)
        (let ((formula-link
               (org-html-format-latex
                (org-html--unlabel-latex-environment latex-frag)
                processing-type info)))
          (when (and formula-link (string-match "file:\\([^]]*\\)" formula-link))
            (let ((source (org-export-file-uri (match-string 1 formula-link))))
              (org-html--wrap-latex-environment
               (org-html--format-image source attributes info)
               info caption label)))))
       (t (org-html--wrap-latex-environment latex-frag info caption label))))))
;; LaTeX Rendering:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX Rendering][LaTeX Rendering:2]]
;; (setq-default org-html-with-latex `dvisvgm)
;; LaTeX Rendering:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Org Habit][Org Habit:1]]
(after! org
  (add-to-list 'org-modules 'org-habit t))
;; Org Habit:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*LaTeX][LaTeX:1]]
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
;; LaTeX:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Enhance Tex-fold][Enhance Tex-fold:1]]
(after! latex
  (setcar (assoc "⋆" LaTeX-fold-math-spec-list) "★")) ;; make \star bigger

(setq TeX-fold-math-spec-list
      '(;; missing/better symbols
        ("≤" ("le"))
        ("≥" ("ge"))
        ("≠" ("ne"))
        ;; conviniance shorts -- these don't work nicely ATM
        ;; ("‹" ("left"))
        ;; ("›" ("right"))
        ;; private macros
        ("ℝ" ("RR"))
        ("ℕ" ("NN"))
        ("ℤ" ("ZZ"))
        ("ℚ" ("QQ"))
        ("ℂ" ("CC"))
        ("ℙ" ("PP"))
        ("ℍ" ("HH"))
        ("𝔼" ("EE"))
        ("𝑑" ("dd"))
        ;; known commands
        ("" ("phantom"))
        (,(lambda (num den) (if (and (TeX-string-single-token-p num) (TeX-string-single-token-p den))
                           (concat num "／" den)
                         (concat "❪" num "／" den "❫"))) ("frac"))
        (,(lambda (arg) (concat "√" (TeX-fold-parenthesize-as-neccesary arg))) ("sqrt"))
        (,(lambda (arg) (concat "⭡" (TeX-fold-parenthesize-as-neccesary arg))) ("vec"))
        ("‘{1}’" ("text"))
        ;; private commands
        ("|{1}|" ("abs"))
        ("‖{1}‖" ("norm"))
        ("⌊{1}⌋" ("floor"))
        ("⌈{1}⌉" ("ceil"))
        ("⌊{1}⌉" ("round"))
        ("𝑑{1}/𝑑{2}" ("dv"))
        ("∂{1}/∂{2}" ("pdv"))
        ;; fancification
        ("{1}" ("mathrm"))
        (,(lambda (word) (string-offset-roman-chars 119743 word)) ("mathbf"))
        (,(lambda (word) (string-offset-roman-chars 119951 word)) ("mathcal"))
        (,(lambda (word) (string-offset-roman-chars 120003 word)) ("mathfrak"))
        (,(lambda (word) (string-offset-roman-chars 120055 word)) ("mathbb"))
        (,(lambda (word) (string-offset-roman-chars 120159 word)) ("mathsf"))
        (,(lambda (word) (string-offset-roman-chars 120367 word)) ("mathtt"))
        )
      TeX-fold-macro-spec-list
      '(
        ;; as the defaults
        ("[f]" ("footnote" "marginpar"))
        ("[c]" ("cite"))
        ("[l]" ("label"))
        ("[r]" ("ref" "pageref" "eqref"))
        ("[i]" ("index" "glossary"))
        ("..." ("dots"))
        ("{1}" ("emph" "textit" "textsl" "textmd" "textrm" "textsf" "texttt"
            "textbf" "textsc" "textup"))
        ;; tweaked defaults
        ("©" ("copyright"))
        ("®" ("textregistered"))
        ("™"  ("texttrademark"))
        ("[1]:||►" ("item"))
        ("❡❡ {1}" ("part" "part*"))
        ("❡ {1}" ("chapter" "chapter*"))
        ("§ {1}" ("section" "section*"))
        ("§§ {1}" ("subsection" "subsection*"))
        ("§§§ {1}" ("subsubsection" "subsubsection*"))
        ("¶ {1}" ("paragraph" "paragraph*"))
        ("¶¶ {1}" ("subparagraph" "subparagraph*"))
        ;; extra
        ("⬖ {1}" ("begin"))
        ("⬗ {1}" ("end"))
        ))

(defun string-offset-roman-chars (offset word)
  "Shift the codepoint of each charachter in WORD by OFFSET with an extra -6 shift if the letter is lowercase"
    (apply 'string
       (mapcar (lambda (c) (+ (if (>= c 97) (- c 6) c) offset)) word)))

(defun TeX-fold-parenthesize-as-neccesary (tokens &optional suppress-left suppress-right)
  "Add ❪ ❫ parenthesis as if multiple LaTeX tokens appear to be present"
  (if (TeX-string-single-token-p tokens) tokens
    (concat (if suppress-left "" "❪")
            tokens
            (if suppress-right "" "❫"))))

(defun TeX-string-single-token-p (teststring)
  "Return t if TESTSTRING appears to be a single token, nil otherwise"
 (if (string-match-p "^\\\\?\\w+$" teststring) t nil))
;; Enhance Tex-fold:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Authinfo][Authinfo:1]]
(setq authinfo-keywords
      '(("^#.*" . font-lock-comment-face)
        ("^\\(machine\\) \\([^ \t\n]+\\)"
         (1 font-lock-variable-name-face)
         (2 font-lock-builtin-face))
        ("\\(login\\) \\([^ \t\n]+\\)"
         (1 font-lock-keyword-face)
         (2 font-lock-string-face))
        ("\\(password\\) \\([^ \t\n]+\\)"
         (1 font-lock-constant-face)
         (2 font-lock-doc-face))
        ("\\(port\\) \\([^ \t\n]+\\)"
         (1 font-lock-type-face)
         (2 font-lock-type-face))))

(define-derived-mode authinfo-mode fundamental-mode "authinfo"
  "Major mode for editing the authinfo file."
  (font-lock-add-keywords nil authinfo-keywords)
  (setq-local comment-start "#")
  (setq-local comment-end ""))

(provide 'authinfo-mode)
(use-package! authinfo-mode
  :mode ("authinfo\\.gpg\\'" . authinfo-mode))
;; Authinfo:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Magit][Magit:1]]
(setq magit-repository-directories '(("~/Projekte" . 2)))
;; Magit:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Magit][Magit:2]]
(setq magit-save-repository-buffers nil)
;; Magit:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Python][Python:1]]
(setq python-shell-interpreter "python")
;; Python:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Python][Python:2]]
(setq python-shell-completion-native-enable nil)
;; Python:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Typescript][Typescript:1]]
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

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*React Native][React Native:1]]
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; React Native:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*React Native][React Native:2]]
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
;; React Native:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Snippets][Snippets:1]]
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
(yas-global-mode 1)
;; Snippets:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*XKCD][XKCD:1]]
 (use-package! xkcd
   :commands (xkcd-get-json xkcd-download xkcd-get
              ;; now for funcs from my extension of this pkg
              +xkcd-find-and-copy +xkcd-find-and-view
              +xkcd-fetch-info +xkcd-select)
   :config
   (add-to-list 'evil-snipe-disabled-modes 'xkcd-mode)
   :general (:states 'normal
             :keymaps 'xkcd-mode-map
             "<right>" #'xkcd-next
             "n"       #'xkcd-next ; evil-ish
             "<left>"  #'xkcd-prev
             "N"       #'xkcd-prev ; evil-ish
             "r"       #'xkcd-rand
             "a"       #'xkcd-rand ; because image-rotate can interfere
             "t"       #'xkcd-alt-text
             "q"       #'xkcd-kill-buffer
             "o"       #'xkcd-open-browser
             "e"       #'xkcd-open-explanation-browser
             ;; extras
             "s"       #'+xkcd-find-and-view
             "/"       #'+xkcd-find-and-view
             "y"       #'+xkcd-copy))
;; XKCD:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*XKCD][XKCD:2]]
 (after! xkcd
   (require 'emacsql-sqlite)

   (defun +xkcd-select ()
     "Prompt the user for an xkcd using 'ivy-read' and '+xkcd-select-format'. Return the xkcd number or nil"
     (let* (prompt-lines
            (-dummy (maphash (lambda (key xkcd-info)
                               (push (+xkcd-select-format xkcd-info) prompt-lines))
                             +xkcd-stored-info))
            (num (ivy-read (format "xkcd (%s): " xkcd-latest) prompt-lines)))
       (if (equal "" num) xkcd-latest
         (string-to-number (replace-regexp-in-string "\\([0-9]+\\).*" "\\1" num)))))

   (defun +xkcd-select-format (xkcd-info)
     "Creates each ivy-read line from an xkcd info plist. Must start with the xkcd number"
     (format "%-4s  %-30s %s"
             (propertize (number-to-string (plist-get xkcd-info :num))
                         'face 'counsel-key-binding)
             (plist-get xkcd-info :title)
             (propertize (plist-get xkcd-info :alt)
                         'face '(variable-pitch font-lock-comment-face))))

   (defun +xkcd-fetch-info (&optional num)
     "Fetch the parsed json info for comic NUM. Fetches latest when omitted or 0"
     (require 'xkcd)
     (when (or (not num) (= num 0))
       (+xkcd-check-latest)
       (setq num xkcd-latest))
     (let ((res (or (gethash num +xkcd-stored-info)
                    (puthash num (+xkcd-db-read num) +xkcd-stored-info))))
       (unless res
         (+xkcd-db-write
          (let* ((url (format "https://xkcd.com/%d/info.0.json" num))
                 (json-assoc
                  (if (gethash num +xkcd-stored-info)
                      (gethash num +xkcd-stored-info)
                    (json-read-from-string (xkcd-get-json url num)))))
            json-assoc))
         (setq res (+xkcd-db-read num)))
       res))

   ;; since we've done this, we may as well go one little step further
   (defun +xkcd-find-and-copy ()
     "Prompt for an xkcd using '+xkcd-select' and copy url to clipboard"
     (interactive)
     (+xkcd-copy (+xkcd-select)))

   (defun +xkcd-copy (&optional num)
     "Copy a url to xkcd NUM to the clipboard"
     (interactive "i")
     (let ((num (or num xkcd-cur)))
       (gui-select-text (format "https://xkcd.com/%d" num))
       (message "xkcd.com/%d copied to clipboard" num)))

   (defun +xkcd-find-and-view ()
     "Prompt for an xkcd using '+xkcd-select' and view it"
     (interactive)
     (xkcd-get (+xkcd-select))
     (switch-to-buffer "*xkcd*"))

   (defvar +xkcd-latest-max-age (* 60 60) ; 1 hour
     "Time after which xkcd-latest should be refreshed, in seconds")

   ;; initialise 'xkcd-latest' and '+xkcd-stored-info' with latest xkcd
   (add-transient-hook! '+xkcd-select
     (require 'xkcd)
     (+xkcd-fetch-info xkcd-latest)
     (setq +xkcd-stored-info (+xkcd-db-read-all)))

   (add-transient-hook! '+xkcd-fetch-info
     (xkcd-update-latest))

   (defun +xkcd-check-latest ()
     "Use value in 'xkcd-cache-latest' as long as it isn't older thabn '+xkcd-latest-max-age'"
     (unless (and (file-exists-p xkcd-cache-latest)
                  (< (- (time-to-seconds (current-time))
                        (time-to-seconds (file-attribute-modification-time (file-attributes xkcd-cache-latest))))
                     +xkcd-latest-max-age))
       (let* ((out (xkcd-get-json "http://xkcd.com/info.0.json" 0))
              (json-assoc (json-read-from-string out))
              (latest (cdr (assoc 'num json-assoc))))
         (when (/= xkcd-latest latest)
           (+xkcd-db-write json-assoc)
           (with-current-buffer (find-file xkcd-cache-latest)
             (setq xkcd-latest latest)
             (erase-buffer)
             (insert (number-to-string latest))
             (save-buffer)
             (kill-buffer (current-buffer)))))
       (shell-command (format "touch %s" xkcd-cache-latest))))

   (defvar +xkcd-stored-info (make-hash-table :test 'eql)
     "Basic info on downloaded xkcds, in the form of a hashtable")

   (defadvice! xkcd-get-json--and-cache (url &optional num)
     "Fetch the Json coming from URL.
 If the file NUM.json exists, use it instead.
 If NUM is 0, always download from URL.
 The return value is a string."
     :override #'xkcd-get-json
     (let* ((file (format "%s%d.json" xkcd-cache-dir num))
            (cached (and (file-exists-p file) (not (eq num 0))))
            (out (with-current-buffer (if cached
                                          (find-file file)
                                        (url-retrieve-synchronously url))
                   (goto-char (point-min))
                   (unless cached (re-search-forward "^$"))
                   (prog1
                       (buffer-substring-no-properties (point) (point-max))
                     (kill-buffer (current-buffer))))))
       (unless (or cached (eq num 0))
         (xkcd-cache-json num out))
       out))

   (defadvice! +xkcd-get (num)
     "Get the xkcd number NUM."
     :override 'xkcd-get
     (interactive "nEnter comic number: ")
     (xkcd-update-latest)
     (get-buffer-create "*xkcd*")
     (switch-to-buffer "*xkcd*")
     (xkcd-mode)
     (let (buffer-read-only)
       (erase-buffer)
       (setq xkcd-cur num)
       (let* ((xkcd-data (+xkcd-fetch-info num))
              (num (plist-get xkcd-data :num))
              (img (plist-get xkcd-data :img))
              (safe-title (plist-get xkcd-data :safe-title))
              (alt (plist-get xkcd-data :alt))
              title file)
         (message "Getting comic...")
         (setq file (xkcd-download img num))
         (setq title (format "%d: %s" num safe-title))
         (insert (propertize title
                             'face 'outline-1))
         (center-line)
         (insert "\n")
         (xkcd-insert-image file num)
         (if (eq xkcd-cur 0)
             (setq xkcd-cur num))
         (setq xkcd-alt alt)
         (message "%s" title))))

   (defconst +xkcd-db--sqlite-available-p
     (with-demoted-errors "+org-xkcd initialization: %S"
       (emacsql-sqlite-ensure-binary)
       t))

   (defvar +xkcd-db--connection (make-hash-table :test #'equal)
     "Database connection to +org-xkcd database.")

   (defun +xkcd-db--get ()
     "Return the sqlite db file."
     (expand-file-name "xkcd.db" xkcd-cache-dir))

   (defun +xkcd-db--get-connection ()
     "Return the database connection, if any."
     (gethash (file-truename xkcd-cache-dir)
              +xkcd-db--connection))

   (defconst +xkcd-db--table-schema
     '((xkcds
        [(num integer :unique :primary-key)
         (year        :not-null)
         (month       :not-null)
         (link        :not-null)
         (news        :not-null)
         (safe_title  :not-null)
         (title       :not-null)
         (transcript  :not-null)
         (alt         :not-null)
         (img         :not-null)])))

   (defun +xkcd-db--init (db)
     "Initialize database DB with the correct schema and user version."
     (emacsql-with-transaction db
       (pcase-dolist ('(,table . ,schema) +xkcd-db--table-schema)
         (emacsql db [:create-table $i1 $S2] table schema))))

   (defun +xkcd-db ()
     "Entrypoint to the +org-xkcd sqlite database.
 Initializes and stores the database, and the database connection.
 Performs a database upgrade when required."
     (unless (and (+xkcd-db--get-connection)
                  (emacsql-live-p (+xkcd-db--get-connection)))
       (let* ((db-file (+xkcd-db--get))
              (init-db (not (file-exists-p db-file))))
         (make-directory (file-name-directory db-file) t)
         (let ((conn (emacsql-sqlite db-file)))
           (set-process-query-on-exit-flag (emacsql-process conn) nil)
           (puthash (file-truename xkcd-cache-dir)
                    conn
                    +xkcd-db--connection)
           (when init-db
             (+xkcd-db--init conn)))))
     (+xkcd-db--get-connection))

   (defun +xkcd-db-query (sql &rest args)
     "Run SQL query on +org-xkcd database with ARGS.
 SQL can be either the emacsql vector representation, or a string."
     (if  (stringp sql)
         (emacsql (+xkcd-db) (apply #'format sql args))
       (apply #'emacsql (+xkcd-db) sql args)))

   (defun +xkcd-db-read (num)
     (when-let ((res
                 (car (+xkcd-db-query [:select * :from xkcds
                                       :where (= num $s1)]
                                      num
                                      :limit 1))))
       (+xkcd-db-list-to-plist res)))

   (defun +xkcd-db-read-all ()
     (let ((xkcd-table (make-hash-table :test 'eql :size 4000)))
       (mapcar (lambda (xkcd-info-list)
                 (puthash (car xkcd-info-list) (+xkcd-db-list-to-plist xkcd-info-list) xkcd-table))
               (+xkcd-db-query [:select * :from xkcds]))
       xkcd-table))

   (defun +xkcd-db-list-to-plist (xkcd-datalist)
     '(:num ,(nth 0 xkcd-datalist)
       :year ,(nth 1 xkcd-datalist)
       :month ,(nth 2 xkcd-datalist)
       :link ,(nth 3 xkcd-datalist)
       :news ,(nth 4 xkcd-datalist)
       :safe-title ,(nth 5 xkcd-datalist)
       :title ,(nth 6 xkcd-datalist)
       :transcript ,(nth 7 xkcd-datalist)
       :alt ,(nth 8 xkcd-datalist)
       :img ,(nth 9 xkcd-datalist)))

   (defun +xkcd-db-write (data)
     (+xkcd-db-query [:insert-into xkcds
                      :values $v1]
                     (list (vector
                            (cdr (assoc 'num        data))
                            (cdr (assoc 'year       data))
                            (cdr (assoc 'month      data))
                            (cdr (assoc 'link       data))
                            (cdr (assoc 'news       data))
                            (cdr (assoc 'safe_title data))
                            (cdr (assoc 'title      data))
                            (cdr (assoc 'transcript data))
                            (cdr (assoc 'alt        data))
                            (cdr (assoc 'img        data))
                            )))))
;; XKCD:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Extra links][Extra links:1]]
(after! org
  (org-link-set-parameters "xkcd"
                           :image-data-fun #'+org-xkcd-image-fn
                           :follow #'+org-xkcd-open-fn
                           :export #'+org-xkcd-export
                           :complete #'+org-xkcd-complete)

  (defun +org-xkcd-open-fn (link)
    (+org-xkcd-image-fn nil link nil))

  (defun +org-xkcd-image-fn (protocol link description)
    "Get image data for xkcd num LINK"
    (let* ((xkcd-info (+xkcd-fetch-info (string-to-number link)))
           (img (plist-get xkcd-info :img))
           (alt (plist-get xkcd-info :alt)))
      (message alt)
      (+org-image-file-data-fn protocol (xkcd-download img (string-to-number link)) description)))

  (defun +org-xkcd-export (path desc backend _com)
    "Convert xkcd to html/LaTeX form"
    (let* ((xkcd-info (+xkcd-fetch-info (string-to-number path)))
           (img (plist-get xkcd-info :img))
           (alt (plist-get xkcd-info :alt))
           (title (plist-get xkcd-info :title))
           (file (xkcd-download img (string-to-number path))))
      (cond ((org-export-derived-backend-p backend 'html)
             (format "<img src='%s' title=\"%s\" alt='%s'>" img (subst-char-in-string ?\" ?“ alt) title))
            ((org-export-derived-backend-p backend 'latex)
             (format "\\begin{figure}[!htb]
  \\centering
  \\includegraphics[scale=0.4]{%s}
  \\caption*{\\label{xkcd:%s} %s}
\\end{figure}" file path (or desc
                             (format "\\textbf{%s} %s" title alt))))
            (t (format "https://xkcd.com/%s" path)))))

  (defun +org-xkcd-complete (&optional arg)
    "Complete xkcd using '+xkcd-stored-info'"
    (format "xkcd:%d" (+xkcd-select))))
;; Extra links:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Keycast][Keycast:1]]
(use-package! keycast
  :commands keycast-mode
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast-mode-line-update t)
          (add-to-list 'global-mode-string '("" mode-line-keycast " ")))
      (remove-hook 'pre-command-hook 'keycast-mode-line-update)
      (setq global-mode-string (remove '("" mode-line-keycast " ") global-mode-string))))
  (custom-set-faces!
    '(keycast-command :inherit doom-modeline-debug
                      :height 0.9)
    '(keycast-key :inherit custom-modified
                  :height 1.1
                  :weight bold)))
;; Keycast:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Tramp][Tramp:1]]
(eval-after-load 'tramp '(setenv "$SHELL" "/bin/bash"))
;; Tramp:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Tramp][Tramp:2]]
(setq tramp-default-method "ssh")
;; Tramp:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Tramp][Tramp:3]]
(define-key global-map (kbd "C-c s") 'counsel-tramp)
;; Tramp:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Speeding up tramp][Speeding up tramp:1]]
(add-hook 'counsel-tramp-pre-command-hook '(lambda () (global-aggressive-indent-mode 0)
                     (projectile-mode 0)
                     (editorconfig-mode 0)))
;; Speeding up tramp:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Speeding up tramp][Speeding up tramp:2]]
(add-hook 'counsel-tramp-quit-hook '(lambda () (global-aggressive-indent-mode 1)
                  (projectile-mode 1)
                  (editorconfig-mode 1)))
;; Speeding up tramp:2 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Speeding up tramp][Speeding up tramp:3]]
(setq make-backup-files nil)
(setq create-lockfiles nil)
;; Speeding up tramp:3 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Bachelors thesis][Bachelors thesis:1]]
(defun org-latex-publish-to-pdf (plist filename pub-dir)
  "Publish an Org file to PDF (via LaTeX).

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name."
  ;; Unlike to 'org-latex-publish-to-latex', PDF file is generated
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
;; Bachelors thesis:1 ends here

;; [[file:../Projekte/dotfiles/.doom.d/config.org::*Variables I accept][Variables I accept:1]]
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#191a2a" "#ff5c57" "#5af78e" "#f3f99d" "#57c7ff" "#ff6ac1" "#9aedfe" "#f9f9f9"])
 '(custom-safe-themes
   (quote
    ("bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" default)))
 '(fci-rule-color "#e2e4e5")
 '(jdee-db-active-breakpoint-face-colors (cons "#282a36" "#57c7ff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#282a36" "#5af78e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#282a36" "#848688"))
 '(objed-cursor-color "#ff5c57")
 '(package-selected-packages
   (quote
    (org-ref auto-dim-other-buffers counsel-tramp sos org-super-agenda org-chef org-bullets beacon avy)))
 '(pdf-view-midnight-colors (cons "#f9f9f9" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5c57" "#5af78e" "#f3f99d" "#57c7ff" "#ff6ac1" "#9aedfe" "#f9f9f9"])
 '(safe-local-variable-values (quote ((org-export-allow-bind-keywords . t))))
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
 '(vc-annotate-very-old-color nil))
;; Variables I accept:1 ends here
