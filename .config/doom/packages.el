;; -*- no-byte-compile: t; -*-

;; [[file:config.org::*Improve scientifical writing][Improve scientifical writing:1]]
(package! org-ref)
(package! ivy-bibtex)
;; Improve scientifical writing:1 ends here

;; [[file:config.org::*Anki][Anki:1]]
(package! anki-editor)
;; Anki:1 ends here

;; [[file:config.org::*Improve agenda/capture][Improve agenda/capture:1]]
(package! org-super-agenda)
;; Improve agenda/capture:1 ends here

;; [[file:config.org::*Improve agenda/capture][Improve agenda/capture:2]]
(package! doct
  :recipe (:host github :repo "progfolio/doct"))
;; Improve agenda/capture:2 ends here

;; [[file:config.org::*Visuals][Visuals:1]]
(package! org-pretty-table-mode
  :recipe (:host github :repo "Fuco1/org-pretty-table"))
;; Visuals:1 ends here

;; [[file:config.org::*Visuals][Visuals:2]]
(package! org-fragtog)
;; Visuals:2 ends here

;; [[file:config.org::*Visuals][Visuals:3]]
(package! org-pretty-tags)
;; Visuals:3 ends here

;; [[file:config.org::*Visuals][Visuals:4]]
(package! nyan-mode)
(package! poke-line)
;; Visuals:4 ends here

;; [[file:config.org::*Programming][Programming:1]]
(package! jinja2-mode)
(package! prettier-js)
;; Programming:1 ends here

;; [[file:config.org::*Admin][Admin:1]]
(package! counsel-tramp)
;; Admin:1 ends here

;; [[file:config.org::*Speed Typing][Speed Typing:1]]
(package! speed-type)
;; Speed Typing:1 ends here

;; [[file:config.org::*Unpinning doom-themes to get latest themes][Unpinning doom-themes to get latest themes:1]]
(unpin! doom-themes)
;; Unpinning doom-themes to get latest themes:1 ends here
