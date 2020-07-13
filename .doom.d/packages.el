;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.
(package! pkgbuild-mode)
(package! evil-smartparens)
(package! jinja2-mode)
(package! prettier-js)
(package! org-plus-contrib)
(package! beacon)
(package! typo)
(package! ob-async)
(package! jinja2-mode)
(package! counsel-tramp)


;; [[file:config.org::*Prettification][Prettification:1]]
(package! prettify-utils ; simplify messing with prettify-mode
  :recipe (:host github :repo "Ilazki/prettify-utils.el") :pin "8b783d316c23bffdf2b9e6f52635482c4812ee43")
;; Prettification:1 ends here

;; [[file:config.org::*Window management][Window management:1]]
(package! rotate :pin "091b5ac4fc310773253efb317e3dbe8e46959ba6")
;; Window management:1 ends here

;; [[file:config.org::*Fun][Fun:1]]
(package! xkcd :pin "66e928706fd660cfdab204c98a347b49c4267bdf")
;; Fun:1 ends here

;; [[file:config.org::*Fun][Fun:2]]
(package! selectric-mode :pin "bb9e66678f34e9bc23624ff6292cf5e7857e8e5f")
;; Fun:2 ends here


;; [[file:config.org::*Fun][Fun:4]]
(package! spray :pin "00638bc916227f2f961013543d10e85a43a32e29")
;; Fun:4 ends here

;; [[file:config.org::*Fun][Fun:5]]
(package! theme-magic :pin "844c4311bd26ebafd4b6a1d72ddcc65d87f074e3")
;; Fun:5 ends here

;; [[file:config.org::*Fun][Fun:6]]
(package! elcord :pin "01b26d1af2f33a7c7c5a1c24d8bfb6d40115a7b0")
;; Fun:6 ends here

;; [[file:config.org::*Fun][Fun:7]]
(package! keycast :pin "038475c178e90c7bad64d113db26d42cad60e149")
;; Fun:7 ends here

;; [[file:config.org::*Flyspell-lazy][Flyspell-lazy:1]]
(package! flyspell-lazy :pin "3ebf68cc9eb10c972a2de8d7861cbabbbce69570")
;; Flyspell-lazy:1 ends here


;; [[file:config.org::*ESS][ESS:1]]
(package! ess-view :pin "d4e5a340b7bcc58c434867b97923094bd0680283")
;; ESS:1 ends here


;; [[file:config.org::*Info colours][Info colours:1]]
(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5")
;; Info colours:1 ends here

;; [[file:config.org::*Email][Email:1]]
(package! org-msg)
;; Email:1 ends here


;; [[file:config.org::*LaTeX][LaTeX:1]]
(package! evil-tex :recipe (:host github :repo "itai33/evil-tex")
                            :pin "4826bffa28fde3ace3ec0bd66b2838d44539d016")
;; LaTeX:1 ends here


;; [[file:config.org::*Improve agenda/capture][Improve agenda/capture:1]]
(package! org-super-agenda :pin "dd0d104c269fab9ebe5af7009bc1dd2a3a8f3c12")
;; Improve agenda/capture:1 ends here

;; [[file:config.org::*Improve agenda/capture][Improve agenda/capture:2]]
(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "9be788f9e3db45610a9e3489d4bba70b3b5de1f0")
;; Improve agenda/capture:2 ends here

;; [[file:config.org::*Visuals][Visuals:1]]
(package! org-pretty-table-mode
  :recipe (:host github :repo "Fuco1/org-pretty-table") :pin "88380f865a79bba49e4f501b7fe73a7bfb03bd1a")
;; Visuals:1 ends here

;; [[file:config.org::*Visuals][Visuals:2]]
(package! org-fragtog :pin "3eea7f17087a0165280e9c7b7a39a4b8d91c684d")
;; Visuals:2 ends here

;; [[file:config.org::*Visuals][Visuals:3]]
(package! org-pretty-tags :pin "40fd72f3e701e31813f383fb429d30bb88cee769")
;; Visuals:3 ends here

;; [[file:config.org::*Extra functionality][Extra functionality:1]]
(package! ox-gfm :pin "99f93011b069e02b37c9660b8fcb45dab086a07f")
;; Extra functionality:1 ends here


;; [[file:config.org::*Extra functionality][Extra functionality:3]]
(package! org-graph-view :recipe (:host github :repo "alphapapa/org-graph-view") :pin "13314338d70d2c19511efccc491bed3ca0758170")
;; Extra functionality:3 ends here

;; [[file:config.org::*Extra functionality][Extra functionality:4]]
(package! org-chef :pin "1dd73fd3db0e9382fa34d3b48c8ec608e65f3bdc")
;; Extra functionality:4 ends here


;; [[file:config.org::*Extra functionality][Extra functionality:6]]
(package! org-roam-server :pin "7617ac01a1b7bad61407916ef03eda95c17da7c9")
;; Extra functionality:6 ends here

;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))
