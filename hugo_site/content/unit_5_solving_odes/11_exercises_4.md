---
title: "Exercises 4"
date: 2020-11-16T16:52:22Z
draft: false
pre: "11. "
---


{{% notice question %}}
This set of exercises is designed to get you to use MATLAB to solve boundary value problems. Hints and solutions are available.  

Use `bvp4c` to solve the following boundary value problems.  

Consider the equation.  
`$$ \frac{d^2y}{dx^2} + 3\frac{dy}{dx} - 4y = 0 \,. $$`

1. Solve this subject to `$y(0) = 0$` and `$y(1) = 1$`.  

2. Solve the same equation subject to `$y'(0) = 0$` and `$y(1) = 1$`.  


{{% expand "Expand for hint" %}}
{{% notice hint %}}
Have another look at the code from the previous BVP example.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
To solve this numerically, we first need to reduce the second-order system to a system of first-order equations,  
`$$ \frac{dy}{dx} = z \,, $$`
`$$ \frac{dz}{dx} = 4y - 3z \,. $$`
Example code to solve this system with associated boundary conditions is given by  

```matlab
% Function to solve y''+ 3y' - 4y^2 = 0.
function SolveBVP()
%
solinit = bvpinit([0,1],[0 0]);
%
sol = bvp4c(@deriv,@bcs,solinit);
%
x=linspace(0,1,100);
y=deval(sol,x);
%
plot(x,y(1,:),'b-x');
%
function dYdx = deriv(x,Y)
%
dYdx(1) = Y(2);
dYdx(2) = 4*Y(1)-3*Y(2);
%
% boundary conditions y(0)=1, y(1)=1.
function res = bcs(ya,yb)
%
res = [ ya(1)-1
        yb(1)-1];
%
% % boundary conditions y(0)=1, y(1)=1.
% function res = bcs(ya,yb)
% res = [ ya(2)
% yb(1)-1];
```

Running this code yields the following plot, which shows that both boundary conditions are satisfied.  

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)  

In order to solve the equations with the second set of boundary conditions, replace the `bcs` function by the commented version. This yields the following plot.  

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

Note that now the derivative of `$y$` is now zero at `$x=0$`.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
