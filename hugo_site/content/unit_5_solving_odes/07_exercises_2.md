---
title: "Exercises 2"
date: 2020-11-20T16:52:22Z
draft: false
pre: "7. "
---


This set of exercises is designed to give you familiarity with the numerical methods used to solve first-order ODEs. Hints and solutions are available.

{{% notice question %}}
Write a Matlab script to solve
`$$ \frac{dy}{dx} = y $$`
subject to `$y(0) = 1$` on the domain `$0 \leq x \leq 5$`, using both forward and backward Euler methods.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
The forward Euler formula gives, on rearrangement
`$$ y^{i+1} = y^i + \delta x \times y^i \,. $$`
In MATLAB, this can be implemented as

```matlab
yForward(i+1) = (1+dx)*yForward(i);
```

for suitably defined variables in an appropriate loop.

Similarly, the backward Euler formula gives, on rearrangement
`$$ y^{i+1} = y^i + \delta x \times y^{i+1} $$`
In MATLAB, this can be implemented as

```matlab
yBackward(i+1) = 1/(1-dx)*yBackward(i);
```

for suitably defined variables in an appropriate loop.
{{% /notice %}}
{{% /expand %}}

1. How do the approximations compare to the exact solution?
2. What happens as you increase the number of points in your approximation `$n$`?

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The exact solution is:
`$$ y=e^x \,.$$`
Code to solve this equation numerically is given below.

```matlab
% Code to implement the Forward and
% Backward Euler methods to solve dy/dx=y.
clear
close all
%
N = 50; % Number of intevals
EndTime = 5;
dx = EndTime/N;
x=linspace(0,EndTime,N+1)
yExact = exp(x); % Exact solution
%
yForward = zeros(1,N+1);
yBackward = zeros(1,N+1);
%
% Specify inital conditions
yForward(1) = 1;
yBackward(1) = 1;
%
for i = 1:N
    yForward(i+1) = (1+dx)*yForward(i);
    yBackward(i+1) = 1/(1-dx)*yBackward(i);
end
%
plot(x,yExact,'k',x,yForward,'b+',x,yBackward,'rx');
legend('Exact','Forward Euler','Backward Euler');
```

Running this code, by copying the file to your working directory and using the command `EulerComparison` produces the following figure.

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

For this problem, the forward Euler method always underestimates the solution, while the backward Euler method always overestimates it. This is because the gradient of the solution is always increasing.

By running the script and varying `$n$` we see that as n increases, the accuracy of the approximations also increases.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
