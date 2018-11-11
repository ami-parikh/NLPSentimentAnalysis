# NLPSentimentAnalysis

The aim is to classify user reviews as positive or negative using NLP and Deep Learning methods.
The data I am using so far is
1. IMDB movie review data set
2. MOUD data set

The MOUD dataset has sentence level tagging for transcripts of user review videos. I have translated these to English using the Google Translate API

I have built several models using Dense layers, RNNs and LSTMs so far. Experimentation is still underway.

Adding a one-dimensional CNN to an LSTM network gives slightly better results.

Using another data set which has product reviews from Amazon compiled by Julian McAuley http://jmcauley.ucsd.edu/data/amazon/ 
Using that dataset along with a CNN and LSTM based network gives a 92% accuracy. 
