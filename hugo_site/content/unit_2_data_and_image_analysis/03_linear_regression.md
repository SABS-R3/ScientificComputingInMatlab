---
title: "Linear regression"
date: 2020-11-24T16:52:22Z
draft: false
pre: "3. "
---

When presented with a data-set, one way to analyse the data is to perform linear regression.
The most common form of linear regression is known as ‘least squares fitting’, whose aim is to fit a polynomial curve to the data such that the sum of the squares of the distance from the data points to the line is minimised. 

{{% notice info %}}
If you have never come across this before then look it up.
The first link has a particularly good description. 

The theory of least squares fitting can be found in the following:

- [Wolfram MathWorld](http://mathworld.wolfram.com/LeastSquaresFitting.html)
- Chapter 7 of *The Statistical Sleuth* by Ramsey and Schafer.
- Chapter 25 (in the ninth edition) of *Advanced Engineering Mathematics* by Erwin Kreyszig.
{{% /notice %}}

The following activity will lead you through generating some experimental data adding artificial noise and then performing least squares estimation to try to elucidate the underlying model parameters.

{{% notice question %}}
Often mathematical models of experimental or physiological systems are developed to form the basis of a measurement technique.
For example, it is not possible to measure cardiac output directly, but we may be able to infer it from analysis of a mathematical model of respiratory gas exchange.
For such models we are often solving an inverse problem of parameter estimation (the cardiac output), where the parameter of interest is embedded (somewhere) within the mathematical model.
In these circumstances, it is often advisable to introduce simulated experimental error into the system to test the robustness of the recovery procedure.
The following is one of the simplest possible examples, where the parameters form part of a linear model, but more commonly the parameters would be embedded within a system of ODEs or PDEs or in some complex stochastic process. 

1. Generate and plot the data (`$x$` and `$y$` values) for a simple straight line of the form `$y=ax+b$` where `$a=2$` and `$b=1$` are constants and `$x\in\left[0,1\right]$`. You should calculate the value of `$y$` at 21 evenly spaced points between 0 and 1, (that is, at `$x=0,0.5,0.1,\ldots,1$`).

{{% expand "Expand for solution" %}}
{{% notice solution %}}

The following will generate and plot the line.

```matlab
% Generate the initial straight line data
x=(0:0.05:1)';
y=(1+2*x);
plot(x,y,'b.-')
```

which yields the following figure.

![Initial data plot](/ScientificComputingInMatlab/images/unit_02/2_03_1.svg?classes=matlab-screenshot-40)
{{% /notice %}}
{{% /expand %}}

2. Generate random errors from a normal distribution, with zero mean `$\mu$` and standard deviation `$\sigma=0.1$`, using MATLAB’s inbuilt commands, and add these to each of the `$y$` coordinates in 1.
    Plot these values as points on the same graph as in 1.
    What happens if `$\mu$` is non-zero? 

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The following will generate noise, add it to the line and plot it with red crosses.

```matlab
% Simulate random noise around this line
noise=randn(size(y)); % Generating numbers from a N(0,1) dist
stdnoise=0.1; % Standard deviation of the noise
ynoisy=y+stdnoise*noise; % Make the noisy data
hold on; % note this puts the plots on the same figure
plot(x,ynoisy,'rx')
```

which yields the following figure.

![Plot with generated noise](/ScientificComputingInMatlab/images/unit_02/2_03_2.svg?classes=matlab-screenshot-40)

Note: your noise will be different, so the red crosses may be in slightly different places, but they will still be close to the original line.
{{% /notice %}}
{{% /expand %}}

3. Using the command `polyfit` perform a linear regression through the data generated in 2, and plot the regression line on the same plot. 

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The command

```matlab
p=polyfit(x,ynoisy,1);
```

will calculate the coefficients of the regression line `$y=\alpha{x}+\beta$` (to the line `$y=ax+b$`), where the coefficients are in descending order, so the constant term is the second entry.
This is a general function, and the third variable specifies the order of the regression line.
For example:

```matlab
p=polyfit(x,ynoisy,2);
``` 

would calculate the quadratic regression coefficients.

Therefore, the following code will calculate the regression line and plot it on the same figure in red. 

```matlab
p=polyfit(x,ynoisy,1);
z=p(1)*x + p(2);
plot(x,z,'r');
```

which yields the following figure.

![Plot with linear regression fit](/ScientificComputingInMatlab/images/unit_02/2_03_3.svg?classes=matlab-screenshot-40)
{{% /notice %}}
{{% /expand %}}


4. Repeat 2 and 3 for differing values of the standard deviation, from `$\sigma=0$`, to `$\sigma=1$`, in steps of 0.2, and plot the regression lines on the same graph.
    You should use a loop to do this.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The following code will generate and plot these lines. 

```matlab
clear
close all
% Generate the initial straight line data
x=(0:0.05:1)';
y=(1+2*x);
%
i=1;
for stdnoise=0:0.2:1
    % Generate N(0,1) random errors and add to the data with
    % a suitably scaled standard deviation
    noise=randn(size(y));
    ynoisy(:,i)=y+stdnoise*noise;
    % Fit a straight line through the noisy data using Polyfit
    p(:,i)=polyfit(x,ynoisy(:,i),1);
    z(:,i)=p(1,i)*x+p(2,i);
    i=i+1;
end
%
plot(x,z);
legend('0.0','0.2','0.4','0.6','0.8','1.0','Location','NorthWest');
hold on
plot(x,ynoisy,'.');
```

This yields the following figure.

![Plot with linear regression fit](/ScientificComputingInMatlab/images/unit_02/2_03_4.svg?classes=matlab-screenshot-40)
{{% /notice %}}
{{% /expand %}}

5. For a suitable value of the standard deviation (`$\sigma=0.1$`), repeat 2 and 3 1,000 times to investigate the statistical properties of the regression coefficients.
    To do this you should calculate the mean and standard deviation of the regression coefficients and compare them to the theoretical values of `$\mu=1 \,,\, \sigma\approx0.042$` for `$a$`, and `$\mu=2 \,,\, \sigma\approx0.071$` for `$b$`.
    The estimators should also be normally distributed.
    You do not need to know how these were calculated, but note that the estimators are unbiased, as the mean values of the estimators of the parameters are the parameters themselves. 

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The following code will generate the means and standard deviations of the regression coefficients for 1,000 sets of random noise.

```matlab
clear
close all
% Generate the initial straight line data
x=(0:0.05:1)';
y=(1+2*x);
%
% Calculate the Regression Coefficients for 1000 sets of noise.
n=1000;
for i=1:n
    % Generate N(0,1) random errors and add to the data with
    % a suitably scaled standard deviation
    noise(:,i)=randn(size(y));
    stdnoise=0.1;
    ynoisy(:,i)=y+stdnoise*noise(:,i);
    % Fit a straight line through the noisy data using Polyfit
    p(:,i)=polyfit(x,ynoisy(:,i),1);
end
%
% Look at the distributions of a and b
b=p(1,:);       % The first row of the matrix p
a=p(2,:);       % The second row of the matrix p
%
abar=mean(a) % Calculates the mean
bbar=mean(b)
%
sda=std(a)   % Calculates the standard deviation
sdb=std(b)
%
% Plot Histograms of the coefficients
figure(1)
hist(a,30)
figure(2)
hist(b,30)
```

The regression coefficients for `$a$` have the following distribution

![Regression coefficients for a](/ScientificComputingInMatlab/images/unit_02/2_03_5.svg?classes=matlab-screenshot-40)

With mean `$\mu\approx1$` and variance `$\sigma\approx0.04$`

The regression coefficients for `$b$` have the following distribution

![Regression coefficients for b](/ScientificComputingInMatlab/images/unit_02/2_03_6.svg?classes=matlab-screenshot-40)

With mean `$\mu\approx2$` and variance `$sigma\approx0.07$`
{{% /notice %}}
{{% /expand %}}

6. Explain why the above can be used to simulate the effects of random experimental error. 

{{% expand "Expand for solution" %}}
{{% notice solution %}}
Experimental error will manifest as noise added to the results, so we can apply this method to hope to reveal the underlying model parameters.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
