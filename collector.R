###########
###SETUP###
###########
require(twitteR)
require(readr)
require(RJSONIO)

data = read.delim(file = "C://Users/Erik Cheng/stat198/ICWSM2013_Paper_187_Data/all_streaming_api.txt", sep = "\n", header = FALSE, colClasses = c("character"))
#A function for getting a tweet object given a TweetID (as string)
getTweet = function(k){
  out = (tryCatch(
    {
      showStatus(data[k,1]) 
    },
    error = function(cond){
      message(as.character(k))
      
    }
    
  )
  )
  return(out)
}

getHandle = function(tweet){ #takes in tweet object and returns its handle
  return (tweet$screenName)
}
getTime = function(tweet) { #takes in tweet object and returns creation time
  return (tweet$created)
}

######################
###LETS GET CRANKIN###
######################

low = 1
high = 1000
lasttime  = Sys.time()

while(low < length(data[,1])) {
  currtime = Sys.time()
  if((round(difftime(currtime, lasttime, units = "mins")) >= 15) || low == 1){
    if(high > length(data[,1])) {
      high = length(data[,1])
    }
    setup_twitter_oauth("vRb1BPv0mp85t5uk99MD5GdvY","vbEKOCu58TnGx3EKTmGyAV9zZ08nRYUCDvTrDfcw7dTR7Snf8k")  
    fullTweets = sapply(c(low:high), getTweet)
    nulls = which(unlist(lapply(fullTweets,is.null)))
    fullTweetsdf = twListToDF(fullTweets[-nulls])
    absnulls = nulls + low - 1
    write.table(as.data.frame(absnulls), file = paste("errorsfrom",as.character(low),".csv"), sep = ",")
    write.table(fullTweetsdf, file = paste("tweetsfrom", as.character(low),".csv"), sep = ",")
    low = high + 1
    high = high + 1000
  }
  
}



