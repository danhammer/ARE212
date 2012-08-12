ARE212 - Section Notes
======

This is a repository for the section notes for ARE212, Spring 2013.
Each section has its own directory that contains at least three core
files:

1. An `org-mode` file that contains all of the code and description
for the section. In fact, this file *is* the code; it compiles to both
the LaTeX-generated PDF, as well as the `R` script.  The results are
dynamically updated within the document; but you'll have to have Emacs
installed to interact with the `org-file`.  If you are not
Emacs-inclined, then you can read the PDF and follow along with the
`R` script.

2. A PDF of the section description and code.

3. An `R` script that compiles all of the code within the PDF.

You can grab the most recent versions of the PDFs by hitting "View
Raw" after navigating to the file in the proper directory.  This will
download the document to your local machine.  Same goes for the `R`
script.

# Org mode notes

If you are running the `.org` files, you may run into a situation when
you'll need to reload org-mode to properly view the code output, which
can be done with `C-u M-x org-reload`.  If you are adding a code
block, then a neat shortcut is `<s TAB`, which will delineate a code
block within the org file.  Then, to tangle the code, hit `C-c C-v t`.
