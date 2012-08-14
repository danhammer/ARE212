ARE212 - Section Notes
======

This is a repository for the latest version of the ARE212 section
notes.  Each section has its own directory that contains at least
three core files:

1. An org-mode document `.org` that compiles to the `.pdf`, `.tex`,
and `.R` files.  In fact, the org-mode document _is_ the code; and you
can dynamically update all downstream documents from within Emacs'
org-mode.  You do not have to interact with the org-mode document
directly if you are not using Emacs, but rather just with the R code
or PDF write-up.  If you'd like to get set up with Emacs (_highly
recommended_) then please see the next section of this README.

2. A PDF of the section description, which documents the code. 

3. An R script that compiles all of the code within the PDF.  Note
that there is no documentation within the code.  Instead, the code is
documented from the PDF description.

If there are supporting images or TeX fragments for the write-ups,
there will be a subdirectory called `inserts/` within the section
header.

The sections are organized as follows:
- `section-01` Matrix operations in R
- `section-02` OLS regressions from first principles
- `section-03` Centered R^2
- `section-04` Hypothesis testing

# Org mode notes

If you are running the `.org` files, you may run into a situation when
you'll need to reload org-mode to properly view the code output, which
can be done with `C-u M-x org-reload`.  If you are adding a code
block, then a neat shortcut is `<s TAB`, which will delineate a code
block within the org file.  Then, to tangle the code, hit `C-c C-v t`.
