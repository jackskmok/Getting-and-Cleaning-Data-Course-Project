# CodeBook for tidy.txt 

This is Code for project. 

## Input Files
```
  1. activity_labels.txt     : Activity Labels
  2. features_info.txt       : Selected Features
  3. features.txt            : Feature listing
  4. test/subject_train.txt  : Row identifies the subject 
                               for Test data set 
  5. test/X_train.txt        : Test DataSet
  6. test/Y_train.txt        : Test Label   
  7. train/subject_train.txt : Row identifies the subject 
                               for Train data set 
  8. train/X_train.txt       : Training DataSet  
  9. train/Y_train.txt       : Training Label
```  
## Output file
```
  tidy.txt 
```  

## Structure of Tidy.txt 
```
subject : The subject who performed the activity for each window sample. Range is from 1 to 30
activity : Activity for each persorn performed :1 WALKING 
                                                2 WALKING_UPSTAIRS
                                                3 WALKING_DOWNSTAIRS
                                                4 SITTING
                                                5 STANDING
                                                6 LAYING

tBodyAccMeanX ~ fBodyBodyGyroJerkMagMeanFreq  : numeric value 
```

## Example data for tidy.txt
```
> head(tidy[,1:5],3)
  subject           activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ
1       1            WALKING     0.2773308  -0.017383819    -0.1111481
2       1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020
3       1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662
```