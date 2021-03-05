Summary:
Data was imported and subject, activity and measures were combined.
Data was renamed to match the codebook for clarity of measures and activities in practice with creating a tidy data set.
Any data whose measure name did not contain the phrases "mean" for mean data and "std" for standard deviation data were excluded and a new dataset, sub_data, was created.
A new data set, mean_data, was then created from sub_data which summarized the mean of each feature measure by activity and subject. 


Steps:
1) Set paths, read data into R for manipulation
2) Combine subject, X_test and y_test data (cbind) to form test data

	-Creates a data file that includes all pieces of information - subjects, activities and measures

3) Combine subject, X_train and y_train data (cbind) to form train data

	-Creates a data file that includes all pieces of information - subjects, activities and measures
4) Combine test data and train data (rbind) to create master-data

	-Combines two separate data sets into one complete data set
5) Rename variable headers to match feature label names for clarity when referencing data and using codebook, rename activity/subject columns "Activity" and "Subject"

6) Create subset of master-data called sub_data

	-include only measurements on mean and standard deviation:
		determined by feature name including "mean" or "std"
	-separate out activity / subject data, mean columns and std devitation columns into separate data frames then combine

7) Rename activity to match activity label names

	-match label names provided in codebook for clarity

8) Create new data set with average of each variable for each activity and subject called mean_data

	-Use group_by and summarize_all to group by activity and subject and summarize all means for each measure



-----------------------------------------CODE BOOK------------------------------------------------------------------

Activity Labels:
Describe the activities measured for each subject.

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

--------------------------------------------------------------------------------------------------------------------

Feature Information:

Activity Denotes the activity being measured from the above list.
Subject is a number that represents the individuals test scores.

The features included are a mean of the standard deviation and mean values recorded with the below specifications:

------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


-----------------------------------------------------------------------------------


Features:

Column 	Variable Name
1	Activity
2	Subject
3	tBodyAcc-std()-X
4	tBodyAcc-std()-Y
5	tBodyAcc-std()-Z
6	tGravityAcc-std()-X
7	tGravityAcc-std()-Y
8	tGravityAcc-std()-Z
9	tBodyAccJerk-std()-X
10	tBodyAccJerk-std()-Y
11	tBodyAccJerk-std()-Z
12	tBodyGyro-std()-X
13	tBodyGyro-std()-Y
14	tBodyGyro-std()-Z
15	tBodyGyroJerk-std()-X
16	tBodyGyroJerk-std()-Y
17	tBodyGyroJerk-std()-Z
18	tBodyAccMag-std()
19	tGravityAccMag-std()
20	tBodyAccJerkMag-std()
21	tBodyGyroMag-std()
22	tBodyGyroJerkMag-std()
23	fBodyAcc-std()-X
24	fBodyAcc-std()-Y
25	fBodyAcc-std()-Z
26	fBodyAccJerk-std()-X
27	fBodyAccJerk-std()-Y
28	fBodyAccJerk-std()-Z
29	fBodyGyro-std()-X
30	fBodyGyro-std()-Y
31	fBodyGyro-std()-Z
32	fBodyAccMag-std()
33	fBodyBodyAccJerkMag-std()
34	fBodyBodyGyroMag-std()
35	fBodyBodyGyroJerkMag-std()
36	tBodyAcc-mean()-X
37	tBodyAcc-mean()-Y
38	tBodyAcc-mean()-Z
39	tGravityAcc-mean()-X
40	tGravityAcc-mean()-Y
41	tGravityAcc-mean()-Z
42	tBodyAccJerk-mean()-X
43	tBodyAccJerk-mean()-Y
44	tBodyAccJerk-mean()-Z
45	tBodyGyro-mean()-X
46	tBodyGyro-mean()-Y
47	tBodyGyro-mean()-Z
48	tBodyGyroJerk-mean()-X
49	tBodyGyroJerk-mean()-Y
50	tBodyGyroJerk-mean()-Z
51	tBodyAccMag-mean()
52	tGravityAccMag-mean()
53	tBodyAccJerkMag-mean()
54	tBodyGyroMag-mean()
55	tBodyGyroJerkMag-mean()
56	fBodyAcc-mean()-X
57	fBodyAcc-mean()-Y
58	fBodyAcc-mean()-Z
59	fBodyAcc-meanFreq()-X
60	fBodyAcc-meanFreq()-Y
61	fBodyAcc-meanFreq()-Z
62	fBodyAccJerk-mean()-X
63	fBodyAccJerk-mean()-Y
64	fBodyAccJerk-mean()-Z
65	fBodyAccJerk-meanFreq()-X
66	fBodyAccJerk-meanFreq()-Y
67	fBodyAccJerk-meanFreq()-Z
68	fBodyGyro-mean()-X
69	fBodyGyro-mean()-Y
70	fBodyGyro-mean()-Z
71	fBodyGyro-meanFreq()-X
72	fBodyGyro-meanFreq()-Y
73	fBodyGyro-meanFreq()-Z
74	fBodyAccMag-mean()
75	fBodyAccMag-meanFreq()
76	fBodyBodyAccJerkMag-mean()
77	fBodyBodyAccJerkMag-meanFreq()
78	fBodyBodyGyroMag-mean()
79	fBodyBodyGyroMag-meanFreq()
80	fBodyBodyGyroJerkMag-mean()
81	fBodyBodyGyroJerkMag-meanFreq()


