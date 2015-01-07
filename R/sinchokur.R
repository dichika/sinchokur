#' @export
getRemain <- function(fn,trgrow){
  knitr::knit2html(fn)
  d <- suppressWarnings(readLines(fn))
  count <- length(d)-trgrow
  per <- round(trgrow*100/length(d), 1)
  res <- sprintf("残り%s行です(進捗%s%%)",count, per)
}

#' @export
getRemainPaper <- function (fn, trgcount){
  d <- suppressWarnings(readLines(fn))
  d <- d[!grepl("\\*.+", d)]
  nowcount <- length(unlist(strsplit(d, split="[[:space:]]")))
  diffcount <- trgcount - nowcount
  percount <- round(nowcount * 100/trgcount, 1)
  res <- sprintf("現在%s語です(進捗%s%%)", diffcount, percount)
}

#' @export
getRemainTw <- function(fn,trgrow,consumerKey=NULL,consumerSecret=NULL){
  require(twitteR)
  tw <- getRemain(fn,trgrow)
  if(is.null(consumerKey)){
    consumerKey <- getOption("CONSUMER_KEY")    
  }
  if(is.null(consumerSecret)){
    consumerSecret <- getOption("CONSUMER_SECRET")    
  }
  setup_twitter_oauth(consumerKey, consumerSecret)
  tweet(tw)
}