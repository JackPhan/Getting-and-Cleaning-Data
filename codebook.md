Input data
==========
Link for the zip file of the downloadable data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



Transformations
===============
1. There are three important categories of files in given zip file.
    . Researcher has separated one whole data frame into three pieces.
    . First column + second column + other columns  (VERY IMPORTANT)

        subject_test  +          y_test      +       x_test        =      test data frame
         1 C 2947 R           1 C 2947 R         561 C 2947 R          563 C 2947 R        
        subject_train +          y_train     +       x_train       =     train data frame
         1 C 7352 R           1 C 7352 R         561 C 7352 R          563 C 7352 R

    . Combine it and make one complete tidy data frame.
         test + train = mydata

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
