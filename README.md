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

# Help me write this!  

This project can and _should_ be treated like any other open source,
collaborative coding project.  If you are interested in helping me
make this project better, [fork the
repo](https://help.github.com/articles/fork-a-repo), edit the screwy
files, and [send a pull
request](https://help.github.com/articles/using-pull-requests).  I
will review and merge the changes -- until someone else takes over!

# Org mode notes

If you are running [Emacs](http://www.gnu.org/software/emacs), then
you have access to [org-mode](http://orgmode.org), an open source
solution for interactive coding and reproducible research.  The code,
documentation, and results are all bundled into the same file.  The
`#+RESULTS` output is automatically generated from the immediately
preceding code block.

->![](http://dl.dropbox.com/u/5365589/org-mode.png)<-

A few things to note.  When you try to compile the `.org` files to
a PDF document, you may have to compile it twice or reload the buffer
using `C-u M-x org-reload`.  To tangle the code within the org-mode
document to an `.R` script, you can use the key binding `C-c C-v t`.

# Spatial analysis in R

This is of personal interest.  R is ideal for econometric analysis;
but it also has some very convenient facilities for interacting with
relational databases that support spatial data analysis.  A notable example
is the open source project
[cartodb-r](https://github.com/Vizzuality/cartodb-r), which allows
quick and easy access to various spatial data types and server-side
spatial analysis.  An example of the type of spatial data analysis
that can be done from within R is shown below.

The orange and blue points are households in New Delhi; the orange
indicates a relatively healthy household, the blue indicates a
household where at least one member has recently experienced diarrhea.
The green points are sewage and garbage facilities.  This is a sort of
modern-day [cholera
map](http://en.wikipedia.org/wiki/File:Snow-cholera-map-1.jpg).

[![](http://i.imgur.com/TMPBC.jpg)](https://danhammer.cartodb.com/tables/facilities_household/embed_map)
