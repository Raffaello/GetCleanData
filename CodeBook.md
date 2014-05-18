#CodeBook

##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:

`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

- avgtBodyAcc-XYZ
- avgtGravityAcc-XYZ
- avgtBodyAccJerk-XYZ
- avgtBodyGyro-XYZ
- avgtBodyGyroJerk-XYZ
- avgtBodyAccMag
- avgtGravityAccMag
- avgtBodyAccJerkMag
- avgtBodyGyroMag
- avgtBodyGyroJerkMag
- avgfBodyAcc-XYZ
- avgfBodyAccJerk-XYZ
- avgfBodyGyro-XYZ
- avgfBodyAccMag
- avgfBodyAccJerkMag
- avgfBodyGyroMag
- avgfBodyGyroJerkMag

***NOTE:*** the features start with `t` are time-based, with `f` are frequencyDomain based.

- Activity  {laying, sitting, standing, walking, walking.downstairs, walking.upstairs}
- Subject   [1..30]

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 

## Description

Every single features is an average value aggregate by Activity and Subject.



##Complete list of features

Here are listed all the columns in the tidy dataset:

1. avgtBodyAcc-mean()-X
1. avgtBodyAcc-mean()-Y
1. avgtBodyAcc-mean()-Z
1. avgtBodyAcc-std()-X
1. avgtBodyAcc-std()-Y
1. avgtBodyAcc-std()-Z
1. avgtBodyAcc-mad()-X
1. avgtBodyAcc-mad()-Y
1. avgtBodyAcc-mad()-Z
1. avgtGravityAcc-mean()-X
1. avgtGravityAcc-mean()-Y
1. avgtGravityAcc-mean()-Z
1. avgtGravityAcc-std()-X
1. avgtGravityAcc-std()-Y
1. avgtGravityAcc-std()-Z
1. avgtGravityAcc-mad()-X
1. avgtGravityAcc-mad()-Y
1. avgtGravityAcc-mad()-Z
1. avgtBodyAccJerk-mean()-X
1. avgtBodyAccJerk-mean()-Y
1. avgtBodyAccJerk-mean()-Z
1. avgtBodyAccJerk-std()-X
1. avgtBodyAccJerk-std()-Y
1. avgtBodyAccJerk-std()-Z
1. avgtBodyAccJerk-mad()-X
1. avgtBodyAccJerk-mad()-Y
1. avgtBodyAccJerk-mad()-Z
1. avgtBodyGyro-mean()-X
1. avgtBodyGyro-mean()-Y
1. avgtBodyGyro-mean()-Z
1. avgtBodyGyro-std()-X
1. avgtBodyGyro-std()-Y
1. avgtBodyGyro-std()-Z
1. avgtBodyGyro-mad()-X
1. avgtBodyGyro-mad()-Y
1. avgtBodyGyro-mad()-Z
1. avgtBodyGyroJerk-mean()-X
1. avgtBodyGyroJerk-mean()-Y
1. avgtBodyGyroJerk-mean()-Z
1. avgtBodyGyroJerk-std()-X
1. avgtBodyGyroJerk-std()-Y
1. avgtBodyGyroJerk-std()-Z
1. avgtBodyGyroJerk-mad()-X
1. avgtBodyGyroJerk-mad()-Y
1. avgtBodyGyroJerk-mad()-Z
1. avgtBodyAccMag-mean()
1. avgtBodyAccMag-std()
1. avgtBodyAccMag-mad()
1. avgtGravityAccMag-mean()
1. avgtGravityAccMag-std()
1. avgtGravityAccMag-mad()
1. avgtBodyAccJerkMag-mean()
1. avgtBodyAccJerkMag-std()
1. avgtBodyAccJerkMag-mad()
1. avgtBodyGyroMag-mean()
1. avgtBodyGyroMag-std()
1. avgtBodyGyroMag-mad()
1. avgtBodyGyroJerkMag-mean()
1. avgtBodyGyroJerkMag-std()
1. avgtBodyGyroJerkMag-mad()
1. avgfBodyAcc-mean()-X
1. avgfBodyAcc-mean()-Y
1. avgfBodyAcc-mean()-Z
1. avgfBodyAcc-std()-X
1. avgfBodyAcc-std()-Y
1. avgfBodyAcc-std()-Z
1. avgfBodyAcc-mad()-X
1. avgfBodyAcc-mad()-Y
1. avgfBodyAcc-mad()-Z
1. avgfBodyAccJerk-mean()-X
1. avgfBodyAccJerk-mean()-Y
1. avgfBodyAccJerk-mean()-Z
1. avgfBodyAccJerk-std()-X
1. avgfBodyAccJerk-std()-Y
1. avgfBodyAccJerk-std()-Z
1. avgfBodyAccJerk-mad()-X
1. avgfBodyAccJerk-mad()-Y
1. avgfBodyAccJerk-mad()-Z
1. avgfBodyGyro-mean()-X
1. avgfBodyGyro-mean()-Y
1. avgfBodyGyro-mean()-Z
1. avgfBodyGyro-std()-X
1. avgfBodyGyro-std()-Y
1. avgfBodyGyro-std()-Z
1. avgfBodyGyro-mad()-X
1. avgfBodyGyro-mad()-Y
1. avgfBodyGyro-mad()-Z
1. avgfBodyAccMag-mean()
1. avgfBodyAccMag-std()
1. avgfBodyAccMag-mad()
1. avgfBodyBodyAccJerkMag-mean()
1. avgfBodyBodyAccJerkMag-std()
1. avgfBodyBodyAccJerkMag-mad()
1. avgfBodyBodyGyroMag-mean()
1. avgfBodyBodyGyroMag-std()
1. avgfBodyBodyGyroMag-mad()
1. avgfBodyBodyGyroJerkMag-mean()
1. avgfBodyBodyGyroJerkMag-std()
1. avgfBodyBodyGyroJerkMag-mad()