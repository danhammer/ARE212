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

[`section-01`](https://github.com/danhammer/ARE212/tree/master/section-01) Matrix operations in R

[`section-02`](https://github.com/danhammer/ARE212/tree/master/section-02) OLS regressions from first principles

[`section-03`](https://github.com/danhammer/ARE212/tree/master/section-03) Centered R^2

[`section-04`](https://github.com/danhammer/ARE212/tree/master/section-04) Hypothesis testing

# Org mode notes

If you are running [Emacs](http://www.gnu.org/software/emacs), then
you have access to [org-mode](http://orgmode.org), an open source
solution for interactive coding and reproducible research.  The code,
documentation, and results are all bundled into the same file:

![](http://dl.dropbox.com/u/5365589/org-mode.png)

A few things to consider.  When you try to compile the `.org` files to
a PDF document, you may have to compile it twice or reload the buffer
using `C-u M-x org-reload`.  To tangle the code within the org-mode
document to an `.R` script, you can use the key binding `C-c C-v t`.
