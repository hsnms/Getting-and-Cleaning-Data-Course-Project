### This repo contains seven files

* README.md

* run_analysis.R: helps to obtain the tidy data from the raw data in "Human Activity Recognition Using Smartphones Dataset" provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto

* Tidy Data Set 1.csv: obtained from the raw data by merging, subsetting and renaming

* Tidy Data Set 1.txt: obtained from the raw data by merging, subsetting and renaming

* Tidy Data Set 2.csv: obtained from Tidy Data Set 1.csv by averaging each variable for each activity and each subject

* Tidy Data Set 2.txt: obtained from Tidy Data Set 1.txt by averaging each variable for each activity and each subject

* CodeBook.md: describes the variables, the data, and  work that are performed to clean up the data


### run_analysis.R does the following:

* Merge the training and test sets into one data set, and add another column "Train/test" which indicates whether the record is from traing set or test set

* Extract only the measurements of the mean values and standard deviations of the variables

* Use descriptive activity names instead of numbers to name the activities

* Use descriptive variable names

* Create a second tidy data set with the average of each variable for each activity of each subject