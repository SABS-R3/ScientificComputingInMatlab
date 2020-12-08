---
title: "Boundary value problems"
date: 2020-11-17T16:52:22Z
draft: false
pre: "10. "
---


## Problem definition

Suppose we wish to solve the system of equations `$\frac{d\mathbf{y}}{dx}=\mathbf{f}(x,\mathbf{y})$`, with conditions applied at two different points `$x=a$` and `$x=b$`.

More commonly, problems of this sort will be written as a higher-order (that is, a second-order) ODE with derivative boundary conditions. We can reduce any such equation to a system of first-order equations, however, so we only need to consider how to solve systems of first-order equations.

Such problems are known as ‘Boundary Value Problems’ (BVPs).

For a system to be well defined, there should be as many conditions as there are first-order equations. For example, to solve two second-order ODEs you would need four conditions, as this system would equate to one with four first-order ODEs.


## Matlab commands

Suppose we wish to solve the system of `$n$` equations, `$\frac{d\mathbf{y}}{dx}=\mathbf{f}(x,\mathbf{y})$`, with conditions applied at two different points `$x=a$` and `$x=b$`.

In order to use the inbuilt MATLAB ODE solvers, you need to follow the steps below:

1. Construct a function (here called `deriv`) which has input arguments `$x$` and `$\mathbf{y}=(y_1,\ldots,y_n)$` and returns the value of the derivative `$\frac{d\mathbf{y}}{dx}$`, that is `$\mathbf{f}(x,\mathbf{y})$`.

2. Construct a function (here called `bcs`) which has input arguments `$\mathbf{y}(a)$` and `$\mathbf{y}(b)$` and returns the value of the residual for each specified boundary condition. For example to apply `$y_1(a)=1$` and `$y_1(b)=0$` use

```matlab
function res = bcs(ya,yb)
res = [ ya(1) - 1
        yb(1)];
```

To apply conditions to the other variables, `$y_2$`, etc. change the index to `ya(2)` or `yb(2)`, for example.

3. Define the solution domain and provide an initial guess for the solution on the solution domain. Use the command

```matlab
solinit = bvpinit([a,b],[0,0]);
```

This defines the domain for solution as [a,b], and the initial guess for the solution at the points specified in the domain as [0,0]. (Note that we could use a more accurate initial guess, that is define the domain using linspace(a,b,100) and then define the solution on these points.)

4. Call the ODE solver `bvp4c`, using the following command

```matlab
sol = bvp4c(@deriv,@bcs,solinit);
```

The various parameters are:

- `@deriv`, a handle to a function that given `$x$` and `$\mathbf{y}$` returns the value of the derivative `$\frac{d\mathbf{y}}{dx}$`;

- `@bcs`, a handle to a function that defines the boundary conditions;

- `solinit`, the structure defining the solution’s domain and that initial guess at the solution; and
- `sol`, a structure that contains the solution.

5. Plot the results, which are now stored as `sol.x` and `sol.y`.

```matlab
plot(sol.x,sol.y(1,:),'b-x');
```

This is shown in the following walkthrough example.



## Walkthrough

Suppose we wish to solve the following boundary value problem.

Consider the equation
`$$ \frac{d^2y}{dx^2} + y = 0 \,. $$`
subject to `$y'(0) = 1$` and `$y(\pi) = 0$`.

The exact solution is `$y = \sin(x)$`.

To solve this numerically, we first need to reduce the second-order equation to a system of first-order equations,
`$$ \frac{dy}{dx} = z \,, $$`
`$$ \frac{dz}{dx} = -y \,. $$`
with `$z(0) = 1$` and `$y(\pi) = 0$`.

Example code to solve this is given by

```matlab
% Function to solve d^2ydx^2+y = 0.
function SimpleBVP()
%
solinit = bvpinit([0,pi],[0,0]);
%
sol = bvp4c(@deriv,@bcs,solinit);
%
plot(sol.x,sol.y(1,:),'b-x');
%
function dYdx = deriv(x,Y)
%
dYdx(1) = Y(2);
dYdx(2) = -Y(1);
%
% boundary conditions y'(a)=1, y(b)=0.
function res = bcs(ya,yb)
res = [ ya(2) - 1
        yb(1)];
```

To run this code, download it to the current working directory and use the following command `SolveBVP`

The main elements of this code are

- `solinit = bvpinit([0,pi],[0,0]);`
which defines the domain for solution through `$[0,\pi]$` and the initial guess for the solution at the points specified in the domain, `$[0,0]$`.

- `sol = bvp4c(@deriv,@bcs,solinit);`
which is the call to the `bvp4c` solver, the various parameters are:

    - `@deriv`, a handle to a function that returns the value of the derivative `$\frac{dy}{dx}$` for a given `$x$` and `$y$`;

    - `@bcs` is a handle to a function that defines the boundary conditions; and
    solinit is the structure defining the solution domain and initial guess.

- `plot(sol.x,sol.y(1,:),'b-x');`
which plots the solution.

- `function dydx = deriv(x,y)`
which is a function that returns the value of `$\frac{d\mathbf{y}}{dx}$` for a given `$x$` and `$\mathbf{y}$` at that point (which here is the vector `$[−z,y]$`).

- `function res = bcs(ya,yb)`
which is a function which defines the boundary conditions applied at `$a=0$` and `$b=1$`.

Running the code (using `SolveBVP`) yields the following plot

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

This is plotted against the exact solution, `$y=\sin(x)$`, in the next figure.

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

The red line represents the actual solution and the blue crosses show the numerical solution from `bvp4c`.
