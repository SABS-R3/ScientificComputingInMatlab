---
title: "Simple summary statistics"
date: 2020-11-25T16:52:22Z
draft: false
pre: "2. "
---

## Useful MATLAB commands

There are many inbuilt MATLAB commands for calculating statistical properties of data. Some of them are listed below.

`max !nc` - returns the maximum value of an array.

`min !nc` – returns the minimum value of an array.

`mean !nc` – returns the mean (average) value of the array.

`median !nc` – returns the median value of an array.

`mode !nc` – returns the mode value of an array.

`std !nc` – returns the standard deviation of an array.

`var !nc` – returns the variance of an array.

`hist !nc` – plots the values in the array as a histogram.

`sort !nc` – sorts the elements of the array in ascending order.

`sum !nc` – returns the sum of all the elements of the array.

`rand !nc` – generates uniformly distributed random numbers.

`randn !nc` – generates normally distributed random numbers with mean 0 and variance 1.


The following activities will help you use these basic commands.

{{% notice question %}}
Look at the MATLAB help files `doc max !nc` etc. for each of the above commands and apply them all (except rand and randn) to the following vector 

```matlab
x = [3 -47 -6 -29 37 -22 -7 12 -7 -18 -53 -12 34 12 -35 28 -5 22 4 -70 -32 47 -6 -19 8 17 -22 9 -39 -21];
```

What happens if you apply these to a matrix? For example, try applying them to the following matrix. 

```matlab
randn(100,5)
```

{{% expand "Expand for solution"%}}
The operations yield the following:


```matlab
max : 47
min : -70
mean : -7.2333
median : -6.5
mode : -22
std : 27.6314
var : 763.4954
hist : 

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

sort :
ans =

Columns 1 through 11

-70 -53 -47 -39 -35 -32 -29 -22 -22 21 -19

Columns 12 through 22

-18 -12 -7 -7 -6 -6 -5 3 4 89

Columns 23 through 30

12 12 17 22 28 34 37 47

sum : -217 
```

Applying them to matrices will perform the operation on columns. For example, 

```matlab
sum(rand(10,5))
```

will yield a row vector with five elements which are the sums of each column.

Moreover

```matlab
hist(randn(1000,5))
```

will yield the following multiple histogram with each colour representing a column of the matrix. 

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Generate a series of random samples of data of increasing size drawn from (i) a uniform distribution and (ii) a normal distribution. Draw histograms of each sample and, by calculating the mean and standard deviation of each sample, verify that these two statistics tend to their theoretical limit values as the size of the sample increases.

{{% expand "Expand for hint" %}}
The mean and variance for a uniform `$U(0,1)$` distribution are `$\mu=0.5 \,,\, \sigma=1/\sqrt{12}$`

The mean and variance for a normal `$N(0,1)$` distribution are `$\mu=0 \,,\, \sigma=1$`.
{{% /expand %}}

{{% expand "Expand for solution" %}}
To generate the data for 1,000 samples use

```matlab
X=rand(1000,1);
Y=randn(1000,1); 
```

To plot the histograms use

```matlab
figure;
hist(X);
title('Data from Uniform');
figure;
hist(Y);
title('Data from Normal');
```

To calculate the mean and standard deviation use 

```matlab
mean(X)
std(X)
mean(Y)
std(Y)
```

which should be close to the theoretical values of `$\mu=0.5 \,,\, \sigma=1/\sqrt{12}$` for the `$U(0,1)$` data and `$\mu=0 \,,\, \sigma=1$` for the `$N(0,1)$` data. These values should get closer as the sample size increases.
{{% /expand %}}
{{% /notice %}}
