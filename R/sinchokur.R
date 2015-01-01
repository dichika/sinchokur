#' @export
getRemain <- function(f,trgrow){
  knitr::knit2html(f)
  d <- suppressWarnings(readLines(f))
  count <- length(d)-trgrow
  per <- round(trgrow*100/length(d), 1)
  res <- sprintf("残り%s行です(進捗%s%%)",count, per)
  cat(res)
}

#' @export
getRemainTw <- function(f,trgrow,consumerKey=NULL,consumerSecret=NULL){
  require(twitteR)
  tw <- getRemain(f,trgrow)
  if(is.null(consumerKey)){
    consumerKey <- getOption("CONSUMER_KEY")    
  }
  if(is.null(consumerKey)){
    consumerSecret <- getOption("CONSUMER_SECRET")    
  }
  setup_twitter_oauth(consumerKey, consumerSecret)
  tweet(tw)
}