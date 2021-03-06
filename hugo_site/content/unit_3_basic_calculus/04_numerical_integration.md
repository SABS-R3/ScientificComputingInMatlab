---
title: "Numerical integration"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---

You should already be familiar with analytic integration, as both the inverse of differentiation and a means of finding the area under a curve.
If you are unsure about this, look it up now in any A level textbook or the relevant section of the [Calculus Wikibook](https://en.wikibooks.org/wiki/Calculus/Indefinite_integral).

For most functions that you will come across in mathematical modelling, it will not be possible to undertake the integration analytically, and you will have to resort to numerical methods.
The following explains two numerical methods for approximating integrals: the Trapezium rule, and Simpson's rule.   


## Summary of mathematics used  

Suppose `$y=f(x)$`.
Let the points `$x_0,x_1,x_2,\ldots,x_N$` be equally spaced points on the interval `$[a,b]$`, and let `$h=\frac{1}{N}(x_N−x_0)=x_{i+1}−x_i$`.
Now let `$y_i=f(x_i)$`.
The Trapezium rule for approximating integrals is:

`$$\int_a^b f(x) \,dx \approx h\left( \frac{1}{2}y_0+y_1+y_2+\ldots+y_{N-1}+\frac{1}{2}y_N \right).$$`

This is equivalent to breaking up the area under the curve into a series of trapezia and calculating their areas, as shown in the following figure, where `$y_i=f(x_i)$`.
The figure is from [Wikipedia](https://upload.wikimedia.org/wikipedia/commons/d/d1/Integration_num_trapezes_notation.svg), unmodified, shared under the [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/) license.

![Trapezium Rule](/ScientificComputingInMatlab/images/unit_03/3_04_1_trapezium.svg?classes=matlab-screenshot-40)

Assuming that `$N$` is even, Simpson's rule for approximating integrals is

`$$\int_a^b f(x) \,dx \approx \frac{h}{3}\left( y_0 + 4\left( y_1+y_3+\ldots+y_{N-1} \right) + 2\left( y_2+y_4+\ldots+y_{N-2}\right) + y_N\right). $$`

This is derived in a similar way to the Trapezium rule, but by approximating the function by a quadratic curve on each interval, rather than the linear curve used by the Trapezium rule.
