#' @export
getRemain <- function(fn,trgrow){
  knitr::knit2html(fn)
  d <- suppressWarnings(readLines(fn))
  count <- length(d)-trgrow
  per <- round(trgrow*100/length(d), 1)
  res <- sprintf("残り%s行です(進捗%s%%)",count, per)
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