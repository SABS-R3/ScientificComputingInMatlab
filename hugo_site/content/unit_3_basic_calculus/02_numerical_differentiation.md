---
title: "Numerical differentiation"
date: 2020-11-25T16:52:22Z
draft: false
pre: "2. "
---

You should already be familiar with the idea of analytical differentiation and be able to differentiate simple functions like `$y=x^n$` and `$y=sin(x)$`. If you don’t know how to do this, look it up now in any A level textbook or the relevant section of the [Calculus Wikibook](http://en.wikibooks.org/wiki/Calculus/Differentiation/Differentiation_Defined). </br>

Sometimes functions are highly non-linear and a closed form for the derivative may be difficult to calculate. For example

`$$y=x^{lnx}$$

Alternatively, `$y$` can be defined as the solution to an equation, so we can not calculate a closed form for `$y=f(x)$`to which the traditional rules of differentiation may be applied. In such cases we may calculate a numerical approximation for the derivative using the following difference formulae. </br>


## Summary of mathematics used

Suppose `$y=f(x)$`. Let the points `$x_0,x_1,x_2,\ldots,x_N$` be equally spaced over the interval `$\left[a,b\right]$`, and let `$h=\frac{1}{N}\left(x_N−x_0\right)=x_{i+1}−x_i$`. Now let `$y_i=f(x_i)$`.

- The forward difference approximation to the first derivative at `$x=x_i$` is given by `$\frac{y_{i+1}-y_i}{h}$`

- The backward difference approximation to the first derivative at `$x=x_i$` is given by `$\frac{y_i−y_{i−1}}{h}$`

- The central difference approximation to the first derivative at `$x=x_i$` is given by `$\frac{y_{i+1}−y_{i−1}}{2h}$`

- An approximation to the second derivative at `$x=x_i$` is given by `$\frac{y_{i+1}−2y_i+y_{i−1}}{h^2}$`.

Where `$h$` is assumed to be small, the smaller `$h$` is, the better the approximation becomes. The derivation of these forms is undertaken in the next exercise.
