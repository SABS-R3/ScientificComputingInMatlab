+++
title = "Medical Sciences Course"
date = 2020-11-27T16:10:31Z
weight = 1
chapter = false
pre = ""
hidden = false
+++


## Overview and Support

Welcome to the Online Scientific Computing MATLAB course.
This course aims to give students a good understanding of the MATLAB programming language, and the use of MATLAB in data analysis, image analysis, numerical calculus, linear algebra and the solution of ODEs.
Where applicable, a revision of elements of A-level mathematics needed for these areas is provided.
Elements of software engineering are covered to give students the ability to write well-structured code, as well as how to use MATLAB to present their work using movies or Graphical User Interfaces (GUIs).

The course runs from **09 May 2022** to **17 June 2022** and is supported via an MS Teams Team, which you will have already been added to.
The course leader, Fergus Cooper, will be available to help you with the course content and general MATLAB enquiries, and will respond to messages on the MS Teams Team throughout the course on a first come first served basis.

If you have any questions then contact the course tutor via the MS Teams Team.


## The Course

The course is broken down into a number of units, each one is designed to take approximately one day to complete, however this will depend greatly on your background.

The first unit is much shorter and gives you an introduction to the course.
You should look at this now to make sure that you have everything you need to begin the course.


### Unit 0: Course introduction

The remainder of the course is split into two sections: compulsory units, which contain general concepts of MATLAB and A-level mathematics; and optional units, which are units that will require some detailed mathematical knowledge.

You should work through the units in your own time.
Click on the links below to view the units.


#### Compulsory units:
In order to complete the course you should complete the following 3 units and submit the associated assessments given below.

- [Unit 1: Basic introduction to MATLAB](../unit_1_basic_introduction_to_matlab/)
- [Unit 2: Data and image analysis](../unit_2_data_and_image_analysis/)
- [Unit 3: Basic calculus](../unit_3_basic_calculus/)


#### Optional Units:
These units are optional and are intended for students with a background in the physical sciences.
However, background material is given where needed, so the units should also be accessible to non specialists.

- [Unit 4: Linear algebra](../unit_4_linear_algebra/)
- [Unit 5: Solving ODEs](../unit_5_solving_odes/)
- [Unit 6: Software engineering](../unit_6_software_engineering/)

If you would like advice on which optional units to take then contact the course leader via the MS Teams Team.


## Assessments


### Unit 1: Basic introduction to MATLAB

Write a MATLAB **function** which calculates the mean and median of a set of numbers.

- The function should take in a vector of numbers and return both the mean and the median of the numbers.
- You cannot use the inbuilt functions `mean` or `median`.
- You might find the inbuilt function `sort` useful.
- You should be able to call the function by using the command 
  `[mean_x, median_x] = MeanMedian(x);`
- You should then have two new variables, `mean_x` and `median_x`: check this with the command `whos`.
- To test your function try it on
    - the vector `x=[1 2 3 1 2 3 3 3]` where you should get `mean_x=2.25` and `median_x=2.5`.
    - the vector `x=[5 2 -4]` where you should get `mean_x=1` and `median_x=2`.
- Make sure that your file contains some comments which explain how it works.

**You should submit the .m file created for this assessment.**


### Unit 2: Data and image analysis

The file [data.txt](data.txt) (right click to save to your computer) contains some data in the form:

```
x1 y1
x2 y2
x3 y3
...
```

Write a MATLAB script that:

1. Loads the data into MATLAB.
1. Calculates the cubic fit to the data `xi yi`. (You may find the command `polyfit` useful.)
1. Evaluates the fitted polyniomial at the data points `xi`. (You might find the command `polyval` useful.)
1. Saves the data back to file in the same form (i.e as a text file with the name `datafit.txt` with two columns `xi zi` where `zi` is the value of the fitted polynomial at the points `xi`).
   You will use this file in the next assessment.
   You might find the command  "`save('datafit.txt', 'datafit', '-ASCII')`" useful.
1. Plots the original data and the fitted polynomial on the same graph, along with suitable legend and labelled axes.
   The original data are discrete points so should be plotted as dots or crosses.
   The fitted polynomial is continuous so should be plotted as a line.
1. Saves the plot as a `.png` file.

Note that all these steps should be done automatically in the script. **You should submit the script and the resulting .png file for this assessment.**


### Unit 3: Basic calculus

Write a MATLAB script to:

1. Load the data saved from the exercise from Unit 2 (`datafit.txt`).
1. Calculate the rate of change of the process (i.e. calculate the derivative).
   You should do this using the difference formulae given in the Unit.
1. Calculate the maximum and minimum of the rate of change, and where these occur.
   Note that the magnitude of the rate of change is important: a negative gradient may still have a large slope.
   The minimum rate of change occurs where the slope is flattest and not necessarily where it has a negative gradient.
1. Calculate the area under the curve (i.e. integrate it), using the trapezium rule.

**For this assessment you should submit the script, the value of the maximum and minimum rate of change (together with where they occur) and the area under the curve.**


### Optional units and beyond

There are no assessments required for the optional units.
However, support for the exercises will still be provided via the MS Teams Team.
If you finish the compulsory units and would like support on your own project during the course then you can feel free to contact the course leader.


## Submission

Each student will have a private channel on the MS Teams Team for one-to-one contact with the course leader.
All files for assessment should be added to the conversation on that private channel by the final day of the course at the latest.

You will need to have submitted the required material for all three compulsory assessments before the course ends in order to complete the course.
You can submit the assessments whenever you like throughout the course, however, and you are encouraged to submit the assessments as soon as you have completed them, so that you can receive feedback as you go through the course.
