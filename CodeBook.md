## Variables and data that are contained in "Tidy Data Set 1.csv"

* "Subject": the idenfier of the subject, ranging from 1~30

* "Train/test": whether the subject is in the training group or testing group

* "Activity name": the descriptive activity name and can be "Walking", "Walking_up stairs", "Walking_downstairs", "Sitting", "Standing" or "Laying"

* The mean values and standard deviations of the following signals

  tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag,fBodyGyroJerkMag



## Variables and data that are contained in "Tidy Data Set 2.csv"

* "Subject": the idenfier of the subject, ranging from 1~30

* "Train/test": whether the subject is in the training group or testing group

* "Activity name": the descriptive activity name

* The mean values of the mean values and standard deviations of the following signals

  tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

  for each activity and each subject

## Variables and data that are not contained in "Tidy Data Set 1.csv" or "Tidy Data Set 2.csv"

* Other variables estimated from the following signals

  tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

* The data contained in "train/Inertial Signals" and "test/Inertial Signals" arediscarded

## Work performed to clean up the data

* Merge the training and test sets into one data set, and add another column "Train/test" which indicates whether the record is from traing set or test set

* Extract only the measurements of the mean values and standard deviations of the variables

* Use descriptive activity names instead of numbers to name the activities

* Use descriptive variable names

* Create a second tidy data set with the average of each variable for each activity of each subject

