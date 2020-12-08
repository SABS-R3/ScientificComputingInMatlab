---
title: "Initial value problems"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


## Problem definition

Consider systems of first order equations of the form
`$$ \frac{dy_1}{dx} = f_1(x,y_1,y_2) \,, $$`
`$$ \frac{dy_2}{dz} = f_2(x,y_1,y_2) \,, $$`
subject to conditions `$y_1(x_0)=y_{1_0}$` and `$y_2(x_0)=y_{2_0}$`.
This type of problem is known as an Initial Value Problem (IVP).
In order to solve these we use the inbuilt MATLAB commands `ode45` and `ode15s`, both of which use the same syntax so that once you can use one you can use the other.
(There is a larger family of ODE solvers that use the same syntax. See `doc ode45` for a full list.).

This family of solvers is based on multi-step methods such as Runge–Kutta schemes, which extend the Euler methods discussed in the previous section.
For more details, see any book on numerical methods of solving differential equations or https://mathworld.wolfram.com/Runge-KuttaMethod.html.
(Note that this is beyond the scope of this present course.)
Use `doc ode45` to find more details on these solvers.

In this section we will demonstrate how to use the inbuilt MATLAB ODE solvers such as `ode45`.
We will demonstrate how this works through two walkthroughs: a single first-order ODE and a coupled system of first-order ODEs.


## Matlab commands

We wish to solve
`$$ \frac{dy}{dx} = f(x,y) $$`
subject to `$y(x_0) = y_0$`, for given values `$x_0$` and `$y_0$`.

Use of the inbuilt MATLAB ODE solvers requires the following steps:

1. We construct a function (here called deriv) which has input arguments `$x$` and `$y$` and returns the value of the derivative `$\frac{dy}{dx}$`, that is `$f(x,y)$`.

2. We call the ODE solver (here `ode45`) using the following command

    ```matlab
    [x,y] = ode45(@deriv,[x0,x1],y0);
    ```

    The variables and parameters passed to the ODE solver are:

    - `@deriv !nc`, a handle to a function that returns the value of the derivative `$\frac{dy}{dx}$` for a given `$x$` and `$y$`;

    - `[x0,x1] !nc`, the range of `$x$` for which the problem is to be solved; and

    - `y0 !nc`, the initial condition for `$y$`, `$ y(x_0)=y_0$`.

3. We plot the results, which are now stored as `$x$` and `$y$`.


### Walkthrough - Single ODE

Suppose we wish to solve

`$$ \frac{dy}{dx} = xy \,,$$`

subject to `$y(0) = 1$`

using the Matlab solver `ode45`.

Example code to solve this is given by

```matlab
% Function to solve dydx=xy.
function SolveSimple(y0)
    [x,y] = ode45(@deriv,[0,1],y0);
    plot(x,y,'b-x');
    % A function defining the derivative
    function dydx = deriv(x,y)
        dydx = x*y;
    end
end
```

The main elements of this code are

- `[x,y] = ode45(@deriv,[0,1],y0); !nc`
Which is the call to the ode45 solver, whose parameters are:

    - `@deriv !nc` a handle to a function that returns the value of the derivative `$\frac{dy}{dx}$` given `$x$` and `$y$`;

    - `[0,1] !nc` the range for which the problem is to be solved; and

    - `y0 !nc` the initial condition for `$y$`, `$y(0)=y_0$` (where `$y_0$` is a number).

- `function dydx = deriv(x,y) !nc`
which is a function that returns the value of `$\frac{dy}{dx}$` for a given `$x$` and `$y$` (here `$xy$`).

Running the code, by saving in a file named `SolveSimple.m` and executing it with `SolveSimple(1)`, yields the following plot:

![ode45 example](/ScientificComputingInMatlab/images/unit_05/5_08_1.svg?classes=matlab-screenshot-40)

This is plotted against the exact solution `$y=e^{\frac{x^2}{2}}$`, in the next figure:

![ode45 vs exact](/ScientificComputingInMatlab/images/unit_05/5_08_2.svg?classes=matlab-screenshot-40)

The red line represents the actual solution and the blue crosses show the numerical solution from ode45.

You can also use `ode45` to solve systems of first-order ODEs (and also higher-order equations by reducing them to systems of first-order equations) as shown in the following walkthrough.


### Walkthrough - Coupled systems of equations

Suppose we wish to solve
`$$ \frac{dy_1}{dx} = -y_2 $$`
`$$ \frac{dy_2}{dx} = y_1 $$`
subject to `$y_1(0) = 1$` and `$y_2(0) = 0$`.

Example code to solve this is given by

```matlab
% Function to solve the simple coupled ODE system.
function SolveCoupled()
    y10=1; y20=0;
    [x,Y] = ode45(@coupled,[0,5],[y10;y20]);
    %
    plot(x,Y(:,1),'b',x,Y(:,2),'r');
    legend('y_1','y_2')
    %
    function dYdt = coupled(x,Y)
        dYdt=[-Y(2);Y(1)];
    end
end
```

This code is very similar to the code for the single ODE but here `Y !nc` and `dYdt !nc` are now vectors.

The main elements of this code are

- `[x,Y] = ode45(@coupled,[0,5],[y10;y20]); !nc`
    which is the call to the `ode45` solver, the various parameters are:

    - `@coupled !nc`, a handle to a function that returns the value of the derivative `$\frac{dy}{dx}$` for given `$x$` and `$y=(y1,y2)$`;

    - `[0,5] !nc`, the range for which the problem is to be to solved;

    - `[y10;y20] !nc`, the initial conditions for `$y1$` and `$y2$`; and

- `Y !nc`, the solution in the form of a matrix, in which the first column is the solution for `$y_1$` and the second is the solution for `$y_2$`.

- `function dYdx = coupled(x,Y) !nc` which is a function that returns the value of `$\frac{dy}{dx}$` for a given `$x$` and `$\mathbf{y}$`.
    Note that this is now a vector.

- `plot(x,Y(:,1),'b',x,Y(:,2),'r'); !nc`
    which plots the solutions for `$y_1$` and `$y_2$`, in blue and red respectively.

Running the code, by saving in a file named `SolveCoupled.m` and executing it with `SolveCoupled()`, yields the following plot:

![ode45 coupled system](/ScientificComputingInMatlab/images/unit_05/5_08_3.svg?classes=matlab-screenshot-40)

Which agrees with the analytical solution of `$y_1=\cos(x)$` and `$y_2=\sin(x)$` calculated earlier.
