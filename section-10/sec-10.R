
library(XML)
library(RCurl)
library(stringr)

options(show.error.messages = FALSE)

token <- "characters"
nameslist <- list()

while (is.character(token) == TRUE) {

  baseurl <- "http://oai.crossref.org/OAIHandler?verb=ListSets"

  if (token == "characters") {
    tok.follow <- NULL
  } else {
    tok.follow <- paste("&resumptionToken=", token, sep = "")
  }

  query <- paste(baseurl, tok.follow, sep = "")

  xml.query <- xmlParse(getURL(query))
  set.res <- xmlToList(xml.query)
  names <- as.character(sapply(set.res[["ListSets"]], function(x) x[["setName"]]))
  nameslist[[token]] <- names
  
  if (class(try(set.res[["request"]][[".attrs"]][["resumptionToken"]])) == "try-error") {
    stop("no more data")
  }
  else {
    token <- set.res[["request"]][[".attrs"]][["resumptionToken"]]
  }
  
}

allnames <- do.call(c, nameslist)
length(allnames)

econtitles <- as.character(allnames[str_detect(allnames, "^[Ee]conomic|\\s[Ee]conomic")])
length(econtitles)

sample(econtitles, 10)

countJournals <- function(regex) {
  titles <- as.character(allnames[str_detect(allnames, regex)])
  return(length(titles))
}

subj = c("economic", "business", "politic", "environment", "engineer", "history")
regx = c("^[Ee]conomic|\\s[Ee]conomic", "^[Bb]usiness|\\s[Bb]usiness",
  "^[Pp]olitic|\\s[Pp]olitic", "^[Ee]nvironment|\\s[Ee]nvironment",
  "^[Ee]ngineer|\\s[Ee]ngineer", "^[Hh]istory|\\s[Hh]istory")

subj.df <- data.frame(subject = subj, regex = regx)

subj.df[["count"]] <- sapply(as.character(subj.df[["regex"]]), countJournals)
(g <- ggplot(data = subj.df, aes(x = subject, y = count)) + geom_bar())
