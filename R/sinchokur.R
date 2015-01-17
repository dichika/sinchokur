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
                    count=as.numeric(html_attr(h, "data-count")),
                    stringsAsFactors=FALSE
  )
  return(res)
}

#' @export
iijanaidesuka <- function(tw_username="dichika", github_username="dichika",
                          consumerKey=NULL,consumerSecret=NULL){
  if(length(find.package("AnomalyDetection",quiet=TRUE))==0){
    stop("Install 'AnomalyDetection' package from https://github.com/twitter/AnomalyDetection")
  }
  require(twitteR)
  require(AnomalyDetection)
  if(is.null(consumerKey)){
    consumerKey <- getOption("CONSUMER_KEY")    
  }
  if(is.null(consumerSecret)){
    consumerSecret <- getOption("CONSUMER_SECRET")    
  }
  setup_twitter_oauth(consumerKey, consumerSecret)
  dat <- getPubContribution(username=github_username)
  dat$date <- as.POSIXct(paste0(dat$date, " 01:00:00"))
  res <- AnomalyDetectionTs(dat, max_anoms=0.02, direction='pos')
  recent <- as.Date(max(res$anoms$timestamp))
  tw <- sprintf("@%s %sの進捗、いいじゃないですか https://dl.dropboxusercontent.com/u/956851/yeah.wav #進捗",
                tw_username, recent)
  tweet(tw)
}