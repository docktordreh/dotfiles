(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(require 'org)
(require 'ox)
(require 'cl)
(setq org-export-async-debug nil)
(defun org-latex-quote-block (quote-block contents info)
  "Transcode a QUOTE-BLOCK element from Org to LaTeX.
    CONTENTS holds the contents of the block.  INFO is a plist
    holding contextual information."
  (org-latex--wrap-label
   quote-block
   (format "\\begin{fancyquotes}\n%s\\end{fancyquotes}" contents)))
