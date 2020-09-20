;; -*- no-byte-compile: t; -*-

;; [[file:/tmp/config.org.k8z5Fn::*Improve scientifical writing][Improve scientifical writing:1]]
(package! org-ref)
;; Improve scientifical writing:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Improve agenda/capture][Improve agenda/capture:1]]
(package! org-super-agenda :pin "dd0d104c269fab9ebe5af7009bc1dd2a3a8f3c12")
;; Improve agenda/capture:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Improve agenda/capture][Improve agenda/capture:2]]
(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "80d291e5f1cbdabd4eb7f88c917653c59d3f14be")
;; Improve agenda/capture:2 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Visuals][Visuals:1]]
(package! org-pretty-table-mode
  :recipe (:host github :repo "Fuco1/org-pretty-table") :pin "88380f865a79bba49e4f501b7fe73a7bfb03bd1a")
;; Visuals:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Visuals][Visuals:2]]
(package! org-fragtog :pin "92119e3ae7c9a0ae2b5c9d9e4801b5fdc4804ad7")
;; Visuals:2 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Visuals][Visuals:3]]
(package! org-pretty-tags)
;; Visuals:3 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Visuals][Visuals:4]]
(package! nyan-mode)
(package! poke-line)
;; Visuals:4 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Programming][Programming:1]]
(package! jinja2-mode)
(package! prettier-js)
;; Programming:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Admin][Admin:1]]
(package! counsel-tramp)
;; Admin:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Speed Typing][Speed Typing:1]]
(package! speed-type)
;; Speed Typing:1 ends here

;; [[file:/tmp/config.org.k8z5Fn::*Unpinning doom-themes to get latest themes][Unpinning doom-themes to get latest themes:1]]
(unpin! doom-themes)
;; Unpinning doom-themes to get latest themes:1 ends here
