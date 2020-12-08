---
title: "Fourier series"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


Fourier series can be used to approximate a general periodic function, even with discontinuities.
It does this by using the sum of continuous sine and cosine waves.


## Summary of mathematics used  

The Fourier series of the periodic function `$f(x)$` defined on the domain `$[−\pi,\pi]$` such that `$f(x)+f(x+2\pi)$` is given by:

`$$f(x) = \frac{1}{2}a_0 + \sum_{n=1}^{\infty} \left( a_n\cos{nx} + b_n\sin{nx} \right)$$`

where

`$$a_0 = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\,dx$$`

and

`$$a_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\cos{nx}\,dx \textrm{,    and} \quad b_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\sin{nx}\,dx \quad \textrm{for}\, n = 1,2,\ldots.$$`

This formula can be extended to functions with an arbitrary period.
In addition, any function defined on an interval `$[a,b]$` can be extended to a periodic function, with period `$b−a$`, for which a Fourier series can be calculated.
For more details on the mathematics underlying Fourier series see https://mathworld.wolfram.com/FourierSeries.html and the references contained within it.  
