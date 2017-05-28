# The following code helps to obtain the tidy data based on the raw data in "Human Activity Recognition Using Smartphones Dataset"
# provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory
# in DITEN - Universit‡ degli Studi di Genova.

# set the working directory
setwd("/Users/shengnanhuang/Documents/data/Getting-and-Cleaning-Data-Course-Project")

# read the raw data which includes the identifiers of the subjects, the activity labels and the feature vectors in the training and 
# testing data set, as well as the name of each component in the feature vector.
library(data.table)
subject_test<-data.table(read.table("./test/subject_test.txt"))
X_test<-data.table(read.table("./test/X_test.txt"))
y_test<-data.table(read.table("./test/y_test.txt"))
subject_train<-data.table(read.table("./train/subject_train.txt"))
X_train<-data.table(read.table("./train/X_train.txt"))
y_train<-data.table(read.table("./train/y_train.txt"))
features<-data.table(read.table("./features.txt"))

# rename the columns
library(dplyr)
subject_train<-rename(subject_train, Subject=V1)
subject_test<-rename(subject_test, Subject=V1)
y_train<-rename(y_train, "Activity name"=V1)
y_test<-rename(y_test, "Activity name"=V1)
new_name<-sub("-","",as.character(features$V2))
new_name<-sub("mean","Mean",new_name)
new_name<-sub("std","Std",new_name)
new_name<-sub("-","_",new_name)
new_name<-sub("\\(\\)","",new_name)
old_names<-rep(0,dim(features)[1])
for (i in 1:dim(features)[1])
{
  old_names[i]<-paste0("V",i)
}
setnames(X_test,old_names,new_name)
setnames(X_train,old_names,new_name)

# subset only the measurements on the mean and standard deviation for each measurement
X_test3<-X_test[,unique(names(X_test)),with=FALSE]
a<-new_name[grep("Mean|Std",new_name)]
b<-a[grep("angle",a)]
c<-a[grep("Freq",a)]
new_name<-a[!a %in% c(b,c)]
X_test2<-select_(X_test3,.dots=new_name)
X_train3<-X_train[,unique(names(X_train)),with=FALSE]
X_train2<-select_(X_train3,.dots=new_name)


# merge the training and the test sets, and duplicate it
type1<-data.table("Train/test"=rep(c("test"),dim(X_test2)[1]))
type2<-data.table("Train/test"=rep(c("train"),dim(X_train2)[1]))
test<-bind_cols(subject_test,type1,y_test,X_test2)
train<-bind_cols(subject_train,type2,y_train,X_train2)
Tidydata1<-bind_rows(test,train)
Tidydata2<-bind_rows(test,train)
Tidydata1<-arrange(Tidydata1,Subject,`Activity name`)
Tidydata2<-arrange(Tidydata2,Subject,`Activity name`)


# apply descriptive activity names to name the activities in the first data set
Tidydata1$`Activity name`[Tidydata1$`Activity name`==1]<-"Walking"
Tidydata1$`Activity name`[Tidydata1$`Activity name`==2]<-"Walking_upstairs"
Tidydata1$`Activity name`[Tidydata1$`Activity name`==3]<-"Walking_downstairs"
Tidydata1$`Activity name`[Tidydata1$`Activity name`==4]<-"Sitting"
Tidydata1$`Activity name`[Tidydata1$`Activity name`==5]<-"Standing"
Tidydata1$`Activity name`[Tidydata1$`Activity name`==6]<-"Laying"

# export the data in the first data set to a txt file
write.table(Tidydata1,file="./Tidy Data Set 1.txt",row.name=FALSE)

# for the second data set, use "summarise" function to get the average of each variable 
# for each activity and each subject, and then apply descriptive activity names
name<-names(Tidydata2)[1:3]
dots<-lapply(name,as.symbol)
group<-group_by_(Tidydata2,.dots=dots)
Tidydata2<-summarise_each_(group,new_name,funs=funs(Mean="mean"))
Tidydata2$`Activity name`[Tidydata2$`Activity name`==1]<-"Walking"
Tidydata2$`Activity name`[Tidydata2$`Activity name`==2]<-"Walking_upstairs"
Tidydata2$`Activity name`[Tidydata2$`Activity name`==3]<-"Walking_downstairs"
Tidydata2$`Activity name`[Tidydata2$`Activity name`==4]<-"Sitting"
Tidydata2$`Activity name`[Tidydata2$`Activity name`==5]<-"Standing"
Tidydata2$`Activity name`[Tidydata2$`Activity name`==6]<-"Laying"

# export the data in the second data set to a txt file
write.table(Tidydata2,file="./Tidy Data Set 2.txt",row.name=FALSE)






