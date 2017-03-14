ICWSM 2013 Dataset Submission
Paper Number: 187
Paper Title: Is the Sample Good Enough? Comparing Data from Twitter's Streaming API with Twitter's Firehose
Authors: Fred Morstatter, Jürgen Pfeffer, Huan Liu, Kathleen M. Carley

Details:
As per the restrictions imposed by Twitter, this dataset contains only the tweet IDs of the data used in this study. 

Files:
/all_firehose.txt:
  This is a list of all tweets collected from the firehose. One ID per line.
/all_streaming_api.txt:
  This is a list of all tweets collected from the Streaming API. One ID per line.
/random_samples/1218/*.txt:
  In this paper we use random samples to verify our results, split on each day for 5 select days. Each folder represents one of the days we selected for our study. Each file in the folder contains the IDs of the tweets that composed that sample. For example, /random_samples/1218/0.txt contains the tweet IDs of the tweets in the _first_ random sample on _December 18th, 2011_.

Questions:
  Email Fred Morstatter at fred.morstatter@asu.edu.
