---
title: "Exercises 1"
date: 2020-11-24T16:52:22Z
draft: false
pre: "3. "
---

This set of exercises is designed to give you a familiarity with numerical differentiation.
Hints and solutions are available. 

{{% notice question %}}
Do the following problem with pen and paper.
Using the Taylor series expansion of the form:
`$$y(t)=y(a)+(t−a)y'(a)+(t−a)^2y''(a)+(t−a)^3\frac{y'''(a)}{3!}+\ldots$$`

1. Derive the forward difference formula,
    `$$\frac{dy}{dx}\approx\frac{y_{i+1}−y_i}{h}$$`
2. Derive the backward difference formula,
    `$$\frac{dy}{dx}\approx\frac{y_i−y_{i−1}}{h}$$`
3. Derive the central difference formula,
    `$$\frac{dy}{dx}\approx\frac{y_{i+1}−y_{i−1}}{2h}$$`
4. Optional: If you are feeling adventurous derive the second derivative approximation,
    `$$\frac{d^2y}{dx^2}\approx\frac{y_{i+1}−2y_i+y_{i−1}}{h^2}$$`

Hint: you will need to include more terms in your Taylor expansion.


{{% expand "Expand for solution" %}}
{{% notice solution %}}
1. Let `$t=x_{i+1}$` and `$a=x_i$`. Then the first two terms of the Taylor expansion give:
    `$$y_{i+1} \approx y_i+hy'(x_i)$$`
    Rearranging this gives:
    `$$\frac{dy}{dx}\approx\frac{y_{i+1}−y_i}{h},$$`
    the forward difference rule.  

2. Similarly, using `$t=x_{i−1}$` and `$a=x_i$` gives, on rearranging:
    `$$\frac{dy}{dx}\approx\frac{y_i−y_{i−1}}{h},$$`
    the backward difference rule.  

3. Adding the two previous formulae together and dividing by 2 gives:
    `$$\frac{dy}{dx}\approx\frac{y_{i+1}−y_{i−1}}{2h},$$`
    the central difference rule.  

4. Finally, if we include the third term in the expansions in 1. and 2. then we get:
    `$$y_{i+1} \approx y_i+hy'(x_i)+\frac{h^2}{2}y''(x_i)$$`
    and
    `$$y_{i−1} \approx y_i−hy'(x_i)+\frac{h^2}{2}y''(x_i).$$`
    Adding these together and rearranging gives:
    `$$\frac{d^2y}{dx^2}\approx\frac{y_{i+1}−2y_i+y_{i−1}}{h^2},$$`
    the second derivative approximation.  
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Let `$x_0,x_1,x_2,\ldots,x_N$` be equally spaced points over the interval `$[−3,3]$`.
Let `$h=6/N$`, so that `$x_{i+1}−x_i=h$`.
Let `$f(x)=x^4$`, and so `$f'(x)=4x^3$` and `$f''(x)=12x^2$`.

Begin by choosing `$N=10$`:

1. Approximate the first derivative at the points `$x_0,x_1,x_2,...,x_{N−1}$` using forward differences.  

{{% expand "Expand for hint" %}}
{{% notice hint %}}
The following code calculates the derivative and produces the following plot:

```matlab
N=10;
h=6/N;
x=linspace(-3,3,N+1);
y=x.*x.*x.*x;
yprime=4*x.*x.*x;
%
for i=1:N
    forwarddiff(i) = (y(i+1)-y(i))/h;
end
%
plot(x,yprime,x(1:N),forwarddiff)
legend('True','Forward')
```

![True derivative vs forward difference](/ScientificComputingInMatlab/images/unit_03/3_03_1.svg?classes=matlab-screenshot-40)

{{% /notice %}}
{{% /expand %}}

2. Approximate the first derivative at the points `$x_1,x_2,x_3,\ldots,x_N$` using backward differences.  


{{% expand "Expand for hint" %}}
{{% notice hint %}}
Modify the code from part 1.
{{% /notice %}}
{{% /expand %}}


3. Approximate the first derivative at the points `$x_1,x_2,x_3,\ldots,x_{N−1}$` using central differences.

4. Approximate the second derivative at the points `$x_1,x_2,x_3,\ldots,x_{N−1}$`.

5. Plot your approximations and the true values of `$f'(x)$`
and `$f''(x)$` on the same graphs (one for `$f'(x)$` and one for `$f''(x)$`).

6. What is the maximum absolute error for each approximation?

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The code below will calculate all the approximations and plot them on the same graph as the exact solutions.

```matlab
clear all
close all
N=10;   % The number of intervals to use
h=6/N;  % the step size
x=linspace(-3,3,N+1);
%
%% Calculate the exact solutions
y=x.*x.*x.*x;
yprime=4*x.*x.*x;
yprimeprime=12*x.*x;
%
%% Calculate the approximations
forwarddiff(1) = (y(2)-y(1))/h
for i=2:N
    forwarddiff(i) = (y(i+1)-y(i))/h;
    backwarddiff(i-1) = (y(i)-y(i-1))/(h);
    centraldiff(i-1)=(y(i+1)-y(i-1))/(2*h);
    secondderiv(i-1)=(y(i-1)-2*y(i)+y(i+1))/(h*h);
end
backwarddiff(N) = (y(N+1)-y(N))/h
%
%% Evaluate the maximum error for each approximation
MaxErrorInForwardDifference=max(abs(yprime(1:N)-forwarddiff))
MaxErrorInBackwardDifference=max(abs(yprime(2:N+1)-backwarddiff))
MaxErrorInCentralDifference=max(abs(yprime(2:N)-centraldiff))
MaxErrorInSecondDerivative=max(abs(yprimeprime(2:N)-secondderiv))
%
%% Plot the approximations witht the actual derivatives
plot(x,yprime,x(1:N),forwarddiff,x(2:N+1),backwarddiff,x(2:N),centraldiff)
title('First Derivative')
xlabel('x')
ylabel('y')
legend('True','Forward','Back','Central')
%
figure
plot(x,yprimeprime,x(2:N),secondderiv)
title('Second Derivative')
xlabel('x')
ylabel('y')
legend('True','Approx')
```

The maximum error for each approximation is:

- Forward Difference = 28.2960
- Backward Difference = 28.2960
- Central Difference = 3.4560
- Second Derivative = 0.7200

The following plots are generated:
![True first derivative vs approximations](/ScientificComputingInMatlab/images/unit_03/3_03_2.svg?classes=matlab-screenshot-40)
![True second derivative vs approximations](/ScientificComputingInMatlab/images/unit_03/3_03_3.svg?classes=matlab-screenshot-40)

{{% /notice %}}
{{% /expand %}}

2. Repeat for `$N=20$` and `$N=40$`.

	i) In each case, how big does `$N$` need to be so that the maximum absolute error of the derivative at each discrete point is less than 0.01?

	ii) Comment on how the maximum absolute error for each scheme decreases as `$N$` is doubled.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The maximum errors for different values of `$N$` can be calculated by modifying the code from a) above and are given in the table below.

| N  | Forward Difference | Backward Difference | Central Difference | Second Derivative |
|----|:------------------:|:-------------------:|:------------------:|:-----------------:|
| 10 |            28.2960 |             28.2960 |             3.4560 |            0.7200 |
| 20 |            15.1470 |             15.1470 |             0.9720 |            0.1800 |
| 40 |             7.8344 |              7.8344 |             0.2565 |            0.0450 |

To get a maximum absolute error of less than 0.01 we require:

- `$N=323$` for forward and backward differences;
- `$N=208$` for central differences;
- `$N=86$` for the second derivative.

For forward and backward differences, the error roughly halves as `$N$` is doubled.

For central differences and second derivatives, the error is divided by roughly 4 as `$N$` is doubled.

In mathematical terms, the first two are 'first order' and the second two are 'second order' as `$N$` increases.
Don't worry if you don't know what it means.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
