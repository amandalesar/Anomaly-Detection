# Anomaly Detection

An anomaly detection algorithm will be implemented to detect anomalous behavior in a data set. In the example provided, we will detect anomalous behavior in server computers. I'll demonstrate the anomaly detection algorithm first with a simple dataset (where each example is described by only 2 features), so that we can visualize what the algorithm does. Then, we'll move to a more realisitc dataset (where each example is described by 11 features). However, this algorithm can be applied to your own datasets as well! This anomaly detection algorithm is adapted from the first part of the eighth exercise from Andrew Ng’s Machine Learning Course on Coursera.

# Running the Project 

- Make sure you have MATLAB or Octave installed. 
- Clone the project to your local machine. 
- Run anomalydetection.m. For a guided implementation, you can instead run the live script AnomalyDetection.mlx. 

# Project Details

The anomaly detection algorithm will be implemented to detect anomalous behavior in server computers. However, this dataset is arbitrary, and the algorithm can be applied to your datasets as well! 

In our first example, the features measure the throughput (mb/s) and latency (ms) of response of each server. A sample dataset is provided, with m = 307 examples of how servers were behaving. Thus, we have an unlabeled dataset. It is suspected that the vast majority of these examples are “normal” (non-anomalous) examples of the servers operating normally, but there might also be some examples of servers acting anomalously within this dataset.

We will use a Gaussian model to detect anomalous examples in the dataset. First, we will start with a 2D dataset; which will allow to visualize what the algorithm is doing. On that dataset, a Gaussian distribution will be fitted in order to find values that have very low probability and hence can be considered anomalies. After that, the anomaly detection algorithm will be applied to a larger dataset with many dimensions.

To perform anomaly detection, first a model will be fitted to the data’s distribution. Given a training set, we will estimate the Gaussian distribution for each of the features. For each feature, we will find the mean and variance that fit the data in the nth dimension (the nth dimension of each example). 

The function estimateGaussian.m takes as input the data matrix X and should output a n-dimensional vector mu that holds the mean of all the features and another n-dimensional vector sigma2 that holds the variances of all the features. We use a vectorized implementation for efficiency. If we plot our sample dataset, it can be seen that most of the examples are in the region with the highest probability, while the anomalous examples are in the regions with lower probabilities. Again, this is an arbitrary example dataset!

Once the Gaussian parameters have been estimated, it can be investigated which examples have a very high probability given this distribution and which examples have a very low probability. The low probability examples are more likely to be the anomalies in the dataset. One way to determine which examples are anomalies is to select a threshold based on a cross validation set. An algorithm will be implemented to select the threshold using the F1 core on a cross validation set.

The function selectThreshold.m uses a cross validation set, where the label y=1 corresponds to an anomalous example, and the label y=0 corresponds to a normal (non-anomalous) example. The function selectThreshold.m should return two values; the first is the selected threshold, ε. If an example, x, has a low probability (p(x) < ε), then it is considered to be an anomaly. The function should also return the F1 score, which tells you how well you're doing on finding the ground truth anomalies given a certain threshold. For many different values of ε, the resulting F1 score will be computed by computing how many examples the current threshold classifies correctly and incorrectly.

In the code selectThreshold.m, a loop will try many different values of ε and select the "best" based  on the F1 score. This will allow us to find the outliers in our training set! Finally, we can use the function visualizeFit.m to show the entire dataset, with the anomalous data clearly marked. 

While this implementation is very useful for 2D datasets, if we want to look at a more realistic dataset, that's easy enough. We will use the exact same code to find the outliers! We just won't be able to visualize it for higher dimensonal data. 

Note that this anomaly detection system does not depend at all on the examples we've chosen! Thus, you can simply replace the imported data with data of your choosing, and detect anomalies in your own data!

