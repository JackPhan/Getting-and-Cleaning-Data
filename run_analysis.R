
## 1. Merges the training and the test sets to create one data set.

a = file.path('test', 'subject_test.txt')
test = read.table(a)
b = file.path('test', 'X_test.txt')
X_test = read.table(b)
c = file.path('test', 'y_test.txt')
Y_test = read.table(c)

dt = cbind(test, Y_test, X_test)

aa = file.path('train', 'subject_train.txt')
train = read.table(aa)
bb = file.path('train', 'X_train.txt')
X_train = read.table(bb)
cc = file.path('train', 'Y_train.txt')
Y_train = read.table(cc)

dt1 = cbind(train, Y_train, X_train)

mydata = rbind(dt, dt1)


features = read.table('features.txt')
feature = features[,2]

colnames(mydata)[1] <- "Subject"
colnames(mydata)[2] <- "Activity_Code"
names(mydata)[3:563] <- as.character(feature)
mydataq1 = mydata

## 2. Extracts only the measurements on the mean and standard deviation for each measurement 

m = grep('mean()', names(mydata), ignore.case = FALSE)
n = grep('std()', names(mydata), ignore.case = FALSE)

m = grep("mean\\(\\)", names(mydata), ignore.case = FALSE)
n = grep("std\\(\\)", names(mydata), ignore.case = FALSE)

mydata3 = mydata[,1:2]
mydata2 = mydata[,c(m)]
mydata1 = mydata[,c(n)]
mydt = cbind(mydata3, mydata2, mydata1)

write.table(mydt, file="./data.txt", sep="\t")

## 3&4. Uses descriptive activity names to name the activities in the data set.. Appropriately labels the data set with descriptive activity names. 

activity = read.table('activity_labels.txt')
activities = activity[,2]
activity_Code = mydt$Activity_Code
labels = activities[activity_Code]
mydt$Activity_Code = labels

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)

dtMelt = melt(mydt, id = c("Subject", "Activity_Code"), na.rm = TRUE)
tidy <- dcast(dtMelt, Subject + Activity_Code ~ variable, mean)

write.table(tidy, file="./tidydata.txt", sep="\t")
