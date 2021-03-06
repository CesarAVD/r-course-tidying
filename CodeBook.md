
For an explanation of how the data was constructed, read README.md.

## Subject
Numerical value from 1 to 30, represents the individual (all within an age bracket of 19-48 years) who performed a series of tasks wearing a smartphone (Samsung Galaxy S II) on the waist.

## Activity
The task the subject was performing when the meassurements were taken. Posible values are walking, walking_upstairs, walking_downstairs, sitting, standing, or laying.

## Meassurements 
#### (variables 3 through 68)

Using the phone's embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

The meassurements here presented are only the means and standard deviations of the original data sets. Variable names were changed to be more descriptive, by making them a collection of labels. Explanations to these labels are below.

| Label, by order of appearance  | Explanation |
| ------------- | ------------- |
| average of  | Meassurement is the average of all relevant meassurements in that experiment. For a data set, the arithmetic mean, also called the expected value or average, is the central value of a discrete set of numbers: specifically, the sum of the values divided by the number of values.  |
| standard deviation of  | Meassurement is the standard deviation of all relevant meassurements in that experiment. The standard deviation is a measure of the amount of variation or dispersion of a set of values.  |
| body  | Signal based on the body of the participant, the first of the meassurement components derived from the accelerometer.  |
| gravity  | Signal caused by gravity, the second of the meassurement components derived from the accelerometer. Gravity is a fundamental force that attracts two bodies with mass together.  |
| accelerometer  | Signal read from the accelerometer.  |
| gyroscope  | Signal read from the gyroscope.  |
| jerk  | Jerk signals, from body linear acceleration and angular velocity derived in time.  |
| magnitude  | Magnitude of the signal, as calculated using the Euclidean norm.  |
| time  | Meassurement is a time-based signal.  |
| frequency  | Meassurement on the frequency domain, Fast Fourier Transform of time-based signals.  |
| in X/Y/Z  | Meassurement corresponds only to that axis.  |
