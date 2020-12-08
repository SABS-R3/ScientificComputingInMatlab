---
title: "Numerical methods"
date: 2020-11-21T16:52:22Z
draft: false
pre: "6. "
---

The following sections are concerned with the theory underlying the numerical solution of ODEs such as numerical differentiation and Euler's method.


## Numerical differentiation

Recall from the previous unit 'Basic calculus in MATLAB' that the derivative of a function `$y$` with respect to the variable `$x$` can be approximated by

`$$\frac{dy}{dx}(x) \approx \frac{y(x) - y(x-\delta x)}{\delta x},$$`
the backward difference formula; or

`$$\frac{dy}{dx}(x) \approx \frac{y(x+\delta x) - y(x)}{\delta x},$$`
the forward difference formula.

where `$\delta x$` is small.
The smaller `$\delta x$` is, the better the approximation.
The notation here is slightly different from unit 3, since we are using `$h=\delta x$`.


## Euler's method for solving first order ODEs

We wish to solve the first order ODE
`$$ \frac{dy}{dx}=f(x,y) \,,$$`
subject to the initial condition
`$$ y(a)=y_a \,,$$`
on the domain `$ a \leq x \leq b \,.$`

We will do this using Euler's method and proceed as follows:

- The first step is to divide the domain up into `$n$` equally sized intervals of size `$\delta x=\frac{b−a}{n}$`.

- Then we define `$x^0=a$`, `$x^i=a+i\delta x$` and `$x^n=b$`, and let `$y^0=y_a$`.

- We now want to find a sequence of numbers `$y^1 \ldots y^n$` such that `$y^i \approx y(x^i)$`.
    Using the approximations for the derivative from above we can approximate the first order initial value problem by `$\frac{y^{i+1}−y^i}{\delta x}=f(x,y)$`.

If we know `$f(x,y)$`, then rearranging this gives a formula for calculating `$y^{i+1}$` given `$y^i$`.

There are various options for evaluating `$f(x,y)$` which are discussed now.



## Forward vs backward Euler

Evaluating `$f(x,y)$` at `$x^i$` gives
`$$ \frac{y^{i+1}−y^i}{\delta x}=f(x^i,y^i) \,, $$`
which can be rearranged to give an explicit formula for `$y^{i+1}$`,
`$$ y^{i+1}=y^i+\delta xf(x^i,y^i) \,,$$`
which is known as the **forward Euler** method.

Evaluating `$f(x,y)$` at `$x^{i+1}$` gives
`$$ \frac{y^{i+1}−y^i}{\delta x} = f(x^{i+1},y^{i+1}) \,,$$`
which can be rearranged to give an implicit formula for `$y^{i+1}$`,
`$$ y^{i+1}−\delta xf(x^{i+1},y^{i+1})=y^i \,.$$`
which is known as the **backward Euler** method.
In general, this system is non-linear in `$y^{i+1}$`.

It is usually simpler to work out the forward Euler than the backward Euler approximation, but it is often possible to use a coarser mesh with the backward Euler method, since it remains stable for a larger step size.


## Euler method for systems of ODEs

We can extend this to solve systems of first-order ODEs by treating `$y$` as a vector (`$\mathbf{y}$`) and `$f$` as a vector of functions (`$\mathbf{f}$`).
