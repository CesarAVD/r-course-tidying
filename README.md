# r-course-tidying

This is a an excercise in tyding raw data I did for my R programming course. It takes data from this website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The file named run_analyisis.R downloads the data to the working directory; from here, it procedes to merge the two data sets (test and train), include subjects and activities, and rename the variables. 

Furthermore, it ignores individual readings, using only means and standard deviation for each variable in each of the experiment runs. This is written into the working directory in a file called tidy.txt, which you can find in this repo.

From this first tidy data set, it creates another smaller one, calculating the average meassurements for each variable divided only by subject and activity (as opossed to per trial). This too is written into the directory as tidyAverages.txt (also found in the repo).

Finally, I have created a code book explaining each variable in the CSVs (created with a past version) and TXTs. You can find it under CodeBook.md.
