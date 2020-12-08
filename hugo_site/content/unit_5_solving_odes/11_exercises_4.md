---
title: "Exercises 4"
date: 2020-11-16T16:52:22Z
draft: false
pre: "11. "
---

This set of exercises is designed to get you to use MATLAB to solve boundary value problems.
Hints and solutions are available.

{{% notice question %}}

Use `bvp4c !nc` to solve the following boundary value problems.

Consider the equation
`$$ \frac{d^2y}{dx^2} + 3\frac{dy}{dx} - 4y = 0 \,. $$`

1. Solve this subject to `$y(0) = 0$` and `$y(1) = 1$`.

2. Solve the same equation subject to `$y'(0) = 0$` and `$y(1) = 1$`.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
To solve this numerically, we first need to reduce the second-order system to a system of first-order equations,
`$$ \frac{dy}{dx} = z \,, $$`
`$$ \frac{dz}{dx} = 4y - 3z \,. $$`
Example code to solve this system with associated boundary conditions is given by

```matlab
% Function to solve y''+ 3y' - 4y^2 = 0.
function SolveBVP()
    %% Set up, solve, & plot the BVP
    solinit = bvpinit([0,1],[0 0]);
    sol = bvp4c(@deriv,@bcs,solinit);
    x=linspace(0,1,100);
    y=deval(sol,x);
    plot(x,y(1,:),'b-x');
    xlabel('x')
    ylabel('y')
    %% Function to evaluate the right hand side of the system
    function dYdx = deriv(x,Y)
        %
        dYdx(1) = Y(2);
        dYdx(2) = 4*Y(1)-3*Y(2);
    end
    %% Function to evaluate the boundary values
    function res = bcs(ya,yb)
        res = [ ya(1)
            yb(1)-1];
%         res = [ ya(2)
%             yb(1)-1];
    end
end
```

Running this code yields the following plot, which shows that both boundary conditions are satisfied:

![bvp4c question 1 solution](/ScientificComputingInMatlab/images/unit_05/5_11_1.svg?classes=matlab-screenshot-40)

In order to solve the equations with the second set of boundary conditions, replace the `bcs !nc` function by the commented version. This yields the following plot.

![bvp4c question 2 solution](/ScientificComputingInMatlab/images/unit_05/5_11_2.svg?classes=matlab-screenshot-40)

Note that now the derivative of `$y$` is now zero at `$x=0$`.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
