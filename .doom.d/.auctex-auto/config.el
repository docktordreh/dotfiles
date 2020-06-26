(TeX-add-style-hook
 "config"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt") ("scrartcl" "ngerman" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "left=3.0cm" "right=3.0cm" "top=2.5cm" "bottom=3cm") ("ulem" "normalem") ("tcolorbox" "theorems" "skins") ("mhchem" "version=3") ("natbib" "numbers" "super" "sort&compress") ("minted" "cache=false") ("hyperref" "linktocpage" "pdfstartview=FitH" "colorlinks" "linkcolor=blue" "anchorcolor=blue" "citecolor=blue" "filecolor=blue" "menucolor=blue" "urlcolor=blue") ("setspace" "onehalfspacing")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "float"
    "booktabs"
    "lscape"
    "hyphenat"
    "microtype"
    "tikz"
    "lmodern"
    "geometry"
    "graphicx"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "marvosym"
    "wasysym"
    "amssymb"
    "tcolorbox"
    "mhchem"
    "natbib"
    "natmove"
    "url"
    "minted"
    "listings"
    "hyperref"
    "setspace"
    "attachfile"
    "scrartcl"
    "scrartcl12"
    "mimosis"
    "mimosis10"
    "elsarticle"
    "elsarticle10"
    "scrbook"
    "scrbook10")
   (LaTeX-add-labels
    "sec:org46e6093"
    "sec:org88821dc"
    "sec:org6d26c2c"
    "sec:org5f74f78"
    "sec:org29cfa35"
    "sec:orgcfb2bde"
    "sec:org8cdfce3"
    "sec:org1a80c01"
    "sec:org9fc8717"
    "sec:org8f4c10d"
    "sec:org41a3e9e"))
 :latex)

