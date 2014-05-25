Code Book of Feature Vectors and Reshaping Variables
========================================================

The 561 feature vectors selected contain the tri-axial linear acceleration and angular momentum values in their original time domains as well as filtered transformations to remove noise, and calculated estimates of body and gravity acceleration signals. A complete description of these variables appear in the file, 'features_info.txt', in the orignal data packet, and is not a focus of this project.

In step #1, 2 files containing the X data, effectively the captured numerical data and their transformations, with their column labels for the training and test subjects were combined. The merged data set was saved as a new data frame, 'xtot'. 

In step #2, among the features, columns containing the mean and the standard deviation of the captured data were located and extracted into a new data frame by indexing column numbers containing the strings, 'mean()' and 'std()'. The resulting subset is saved to the data frame, 'xclean'. A full description of the entire set of feature vector names and the strategy used in naming them is available in the file, 'features.txt' and 'features_info.txt'.


The following list is the results of editing the variable labels from the original code book to those which conform to good R coding conventions as discussed in the lectures videos and notes. No attempt was made to change the basic naming structure (i.e., number and sequence of words appearing in the feature names) since an attempt to accurately describe the original study's experimental variables is not the focus of this course's final project. Also, instructions as given in the video lectures and notes were followed, without regard to the actual readability of the variable names; merging of several words together, making individual words hard to distinguish was deliberate.

In the editing, the following points were taken into consideration:

1) variable names should be in all lower case characters  
2) abbreviated words were converted into full words  
3) non-alphanumeric characters <<e.g.,  "( )" , "-" , "_" , " . " >> were removed  

Except for the first 2 columns ("subject" and "activity") which were the reshaping categories, the extracted features as column labels are as follows:

[1] "subject"                                                     
[2] "activity"                                                    
[3] "timebodyaccelerometermeanx"                                  
[4] "timebodyaccelerometermeany"                                  
[5] "timebodyaccelerometermeanz"                                  
[6] "timegravityaccelerometermeanx"                               
[7] "timegravityaccelerometermeany"                               
[8] "timegravityaccelerometermeanz"                               
[9] "timebodyaccelerometerjerkmeanx"                              
[10] "timebodyaccelerometerjerkmeany"                              
[11] "timebodyaccelerometerjerkmeanz"                              
[12] "timebodygyrometermeanx"                                      
[13] "timebodygyrometermeany"                                      
[14] "timebodygyrometermeanz"                                      
[15] "timebodygyrometerjerkmeanx"                                  
[16] "timebodygyrometerjerkmeany"                                  
[17] "timebodygyrometerjerkmeanz"                                  
[18] "timebodyaccelerometermagnitudemean"                          
[19] "timegravityaccelerometermagnitudemean"                       
[20] "timebodyaccelerometerjerkmagnitudemean"                      
[21] "timebodygyrometermagnitudemean"                              
[22] "timebodygyrometerjerkmagnitudemean"                          
[23] "frequencybodyaccelerometermeanx"                             
[24] "frequencybodyaccelerometermeany"                             
[25] "frequencybodyaccelerometermeanz"                             
[26] "frequencybodyaccelerometermeanfrequencyx"                    
[27] "frequencybodyaccelerometermeanfrequencyy"                    
[28] "frequencybodyaccelerometermeanfrequencyz"                    
[29] "frequencybodyaccelerometerjerkmeanx"                         
[30] "frequencybodyaccelerometerjerkmeany"                         
[31] "frequencybodyaccelerometerjerkmeanz"                         
[32] "frequencybodyaccelerometerjerkmeanfrequencyx"                
[33] "frequencybodyaccelerometerjerkmeanfrequencyy"                
[34] "frequencybodyaccelerometerjerkmeanfrequencyz"                
[35] "frequencybodygyrometermeanx"                                 
[36] "frequencybodygyrometermeany"                                 
[37] "frequencybodygyrometermeanz"                                 
[38] "frequencybodygyrometermeanfrequencyx"                        
[39] "frequencybodygyrometermeanfrequencyy"                        
[40] "frequencybodygyrometermeanfrequencyz"                        
[41] "frequencybodyaccelerometermagnitudemean"                     
[42] "frequencybodyaccelerometermagnitudemeanfrequency"            
[43] "frequencybodybodyaccelerometerjerkmagnitudemean"             
[44] "frequencybodybodyaccelerometerjerkmagnitudemeanfrequency"    
[45] "frequencybodybodygyrometermagnitudemean"                     
[46] "frequencybodybodygyrometermagnitudemeanfrequency"            
[47] "frequencybodybodygyrometerjerkmagnitudemean"                 
[48] "frequencybodybodygyrometerjerkmagnitudemeanfrequency"        
[49] "timebodyaccelerometerstandarddeviationx"                     
[50] "timebodyaccelerometerstandarddeviationy"                     
[51] "timebodyaccelerometerstandarddeviationz"                     
[52] "timegravityaccelerometerstandarddeviationx"                  
[53] "timegravityaccelerometerstandarddeviationy"                  
[54] "timegravityaccelerometerstandarddeviationz"                  
[55] "timebodyaccelerometerjerkstandarddeviationx"                 
[56] "timebodyaccelerometerjerkstandarddeviationy"                 
[57] "timebodyaccelerometerjerkstandarddeviationz"                 
[58] "timebodygyrometerstandarddeviationx"                         
[59] "timebodygyrometerstandarddeviationy"                         
[60] "timebodygyrometerstandarddeviationz"                         
[61] "timebodygyrometerjerkstandarddeviationx"                     
[62] "timebodygyrometerjerkstandarddeviationy"                     
[63] "timebodygyrometerjerkstandarddeviationz"                     
[64] "timebodyaccelerometermagnitudestandarddeviation"             
[65] "timegravityaccelerometermagnitudestandarddeviation"          
[66] "timebodyaccelerometerjerkmagnitudestandarddeviation"         
[67] "timebodygyrometermagnitudestandarddeviation"                 
[68] "timebodygyrometerjerkmagnitudestandarddeviation"             
[69] "frequencybodyaccelerometerstandarddeviationx"                
[70] "frequencybodyaccelerometerstandarddeviationy"                
[71] "frequencybodyaccelerometerstandarddeviationz"                
[72] "frequencybodyaccelerometerjerkstandarddeviationx"            
[73] "frequencybodyaccelerometerjerkstandarddeviationy"            
[74] "frequencybodyaccelerometerjerkstandarddeviationz"            
[75] "frequencybodygyrometerstandarddeviationx"                    
[76] "frequencybodygyrometerstandarddeviationy"                    
[77] "frequencybodygyrometerstandarddeviationz"                    
[78] "frequencybodyaccelerometermagnitudestandarddeviation"        
[79] "frequencybodybodyaccelerometerjerkmagnitudestandarddeviation"  
[80] "frequencybodybodygyrometermagnitudestandarddeviation"          
[81] "frequencybodybodygyrometerjerkmagnitudestandarddeviation"    


In step #3, the 6 activity labels are matched to the numerical data by indexing and keeping track of the row order.
The files, 'y_train.txt' and 'y_test.txt' are read into R and merged before processing. Once combined, the elements of the data frame are reverse coded from their numerical values back into their textual names as follows:

1 = "walking"  
2 = "walkingupstairs"  
3 = "walkingdownstairs"  
4 = "sitting"  
5 = "standing"  
6 = "laying"  

This combined data frame was saved to 'tidy1'.


In step #4, the subject IDs are matched to the numerical data by indexing and keeping track of the row order. The files, 'subject_train.txt' and 'subject.test.txt' were read into R and merged before attaching as a new column in the combined X data set. The subject labels, the activity labels, and the numerical X data are combined and saved to the data frame, 'tidy2'.

In step #5, the final tidy data is created from reshaping and calculating the mean by using 'melt' and 'dcast' functions in the 'reshape2' package. The tidy data is written into a text format file, 'tidydata.txt'.


A full description of the script in a markdown file, which reads in the data set, subsets, edits, transforms, and finally writes the tidy data set into a text file is provided in 'README.md'. 
