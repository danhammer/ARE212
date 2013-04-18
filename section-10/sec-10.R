
library(XML)
library(RCurl)
library(stringr)

token <- "first-iteration"
nameslist <- list()
options(show.error.messages = FALSE)

while (is.character(token) == TRUE) {

  baseurl <- "http://oai.crossref.org/OAIHandler?verb=ListSets"

  if (token == "first-iteration") {
    tok2 <- NULL
  } else {
    tok2 <- paste("&resumptionToken=", token, sep = "")
  }

  query <- paste(baseurl, tok2, sep = "")
  return.xml  <- xmlParse(getURL(query))
  return.list <- xmlToList(return.xml)
  journal.vec <- return.list[["ListSets"]]
  
  names <- as.character(sapply(journal.vec, function(x) x[["setName"]]))
  nameslist[[token]] <- names

  if (class(try(journal.vec[[2]]$.attrs[["resumptionToken"]])) == "try-error") {
    stop("no more data")
  } else {
    token <- crsets[[2]]$.attrs[["resumptionToken"]]
  }

}

allnames <- do.call(c, nameslist)
length(allnames)

econtitles <- as.character(allnames[str_detect(allnames, "^[Ee]conomic|\\s[Ee]conomic")])
length(econtitles)

sample(econtitles, 10)

