# Eating-Activity-Recognition

# Motivation
Data collection has permeated our lives so thoroughly, that we often forget that it is happening -
2.5 quintillion bytes of data is created each day! The pace is only increasing with the advent of
IoT. Data being generated from our financial transactions, entertainment preferences and even
health-related activities like sleeping, exercising and eating. This is accomplished using
sensors that collect the data, and often these datasets can be huge. They also have missing
data, outliers, etc. We have been provided such a dataset that has to be cleaned and
processed, before extracting information extracted from it.

# Phase 1: Data Cleaning and Organization
The Phase 1 involves cleaning and organizing the sensor data given to us. The data is provided
for user from 9 through 41, with some missing rows. We have to clean the columns for both
EMG and IMU data. The cleaned data is then added with a column representing eating (0) and
non eating data (1). Then we synchronize the data between the two datasets by setting the last
frame time to the last UNIX timestamp both the IMU or EMG file. The last column that are added
with zeros are then changed to 1’s based on the validation of the eating tasks. The non-eating
tasks are retained as 0 and the files are split according to the columns value (1 for eating and 0
for non-eating). With the help of this data all the graphs are plotted.

# Phase 2: Feature Extraction

Our next step is to select features The features we selected are:
- Mean
- Standard Deviation
- Minimum
- Maximum
- Root Mean Square
- Fourier Transform

# Phase 3: PCA
The step involves reduction of the feature space and keeping only those features which show
maximum distance between the two classes. We will use Principal Component Analysis
technique discussed in class for this purpose.

# Results

The System Based on the sensor data accurately classifies eating and non eating activity.
