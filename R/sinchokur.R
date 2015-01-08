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

#' @export
getPubContribution <- function(username){
  require(rvest)
  u <- sprintf("https://github.com/users/%s/contributions", username)
  h <- html(u) %>% html_nodes("rect")
  res <- data.frame(date=html_attr(h, "data-date"), 
                    count=html_attr(h, "data-count")
  )
  return(res)
}
