**Getting and Cleaning Data Project**
by GITO PRASTOMO

**DESCRIPTION**
This is part of the coursera project on Getting and Cleaning data Course from COURSERA from John Hopkins University

**DATASET INFORMATION, ATTRIBUTES AND VARIABLES**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

DATA SOURCE -- > http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones
**ATTRIBUTES and VARIABLES INFORMATION **
1. Subject Volunteer Information --> volunteer variables, 30 person
2. Activities Information --> activities variable (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3. Sensor Measurements consists of 561 variables measurements
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, unit in standard gravity units 'g'
  - Triaxial Angular velocity from the gyroscope, unit in radians/s
  - A 561-feature vector with time and frequency domain variables. 

**REQUIRED TASK :**
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

