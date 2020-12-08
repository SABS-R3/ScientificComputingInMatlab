---
title: "Solution of nonlinear equations"
date: 2020-11-21T16:52:22Z
draft: false
pre: "6. "
---


We very often need to find the zero of a complex non-linear function when working with mathematical modelling problems, perhaps most frequently when we wish to find the value (or values) of `$x$` such that two functions, say `$f$` and `$g$`, are equal, that is `$f(x)=g(x)$`.
This problem is equivalent to letting `$y(x)=f(x)−g(x)$` and determining the value(s) of `$x$` such that `$y(x)=0$`.

Here we will use the numerical methods of interval bisection and Newton's method (also known as Newton–Raphson) to find the zero of a function.


## Summary of mathematics used

### Interval bisection

Suppose `$f(x)$` is a continuous function, such that `$f(a)<0$` and `$f(b)>0$`.
An approximation to `$f(x)=0$` may be calculated using the following algorithm:

1. Let `$c = \frac{(a+b)}{2}$`

2. If `$f(c)<0$`, then the root lies in the interval `$[c,b]$`, so let `$a=c$`.
    If `$f(c)>0$`, then the root lies in the interval `$[a,c]$`, so let `$b=c$`. If `$f(c)=0$` then the root is at `$x=c$`
   
3. Repeat this process until you have a root to the desired accuracy.

{{% notice question %}}
Do this problem with pen and paper.

Modify this algorithm for the case `$f(a)>0$` and `$f(b)<0$`

{{% expand "Expand for solution" %}}
{{% notice solution %}}
1. Let `$c = \frac{(a+b)}{2}$`

2. If `$f(c)<0$`, then the root lies in the interval `$[a,c]$`, so let `$b=c$`.
    If `$f(c)>0$`, then the root lies in the interval `$[c,b]$`, so let `$a=c$`.
    If `$f(c)=0$` then the root is at `$x=c$`.

3. Repeat this process until you have a root to the desired accuracy.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


### Newton-Raphson

Suppose that `$f(x)$` is a continuous function.
An approximation to `$f(x)=0$` may be calculated using the following algorithm:

1. Start with an initial guess `$x_0$`.

2. Calculate the next solution using:
    `$$x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$`

3. Repeat step 2 until you have the root to the required accuracy.

For more details on Newton–Raphson see: https://mathworld.wolfram.com/NewtonsMethod.html
