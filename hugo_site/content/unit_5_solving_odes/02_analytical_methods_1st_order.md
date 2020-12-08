---
title: "Analytical methods: 1st order"
date: 2020-11-25T16:52:22Z
draft: false
pre: "2. "
---


Before moving on to numerical methods for the solution of ODEs we begin by revising basic analytical techniques for solving ODEs that you will of seen at undergraduate level.


## Separation of variables/separable solutions

If your equation is of the form
`$$ \frac{dy}{dx}=\frac{f(x)}{g(y)} \,, $$`
then it can be reformulated as
`$$\int g(y)\,dy = \int f(x)\,dx + C \,, $$`
where `$C \in \Re$` is a constant of integration.
This can be solved by integration, either directly or by substitution, to give a relation between `$y$` and `$x$`.
The following example will show you how to use to use the separation of variables to solve a first-order ODE.


### Walkthrough

We wish to solve
`$$ \frac{dy}{dx} = \frac{x}{y} \,, $$`
subject to `$ y(0) = 1 $`.
The equation can be reformulated as
`$$ \int y\,dy = \int x\,dx + C \,, $$`
which can be solved to give
`$$ \frac{y^2}{2} = \frac{x^2}{2} + C \,,$$`
which simplifies to
`$$ y = \pm \sqrt{x^2 + A} \,, $$`
where `$ A = 2C $`.
This is the general solution to the differential equation. We now need to apply the initial condition `$y(0)=1$`.
`$$ 1 = y(0) = \pm\sqrt{A} \,, $$`
Therefore `$A=1$`, and we take the positive root.
The solution is `$y = \sqrt{x^2+1}$`.


## Integrating factors
If your equation is of the form
`$$ \frac{dy}{dx} + f(x)y = g(x) \, $$`
then it can be reformulated by introducing an integrating factor.
The integrating factor for the above equation is defined as
`$$ \varphi(x) = e^{\int f(x) \,dx} \,, $$`
(Note: that this is not unique as any multiple would also be an integrating factor).
In order to solve the original equation we multiply through by the integrating factor to give
`$$ \varphi(x)\frac{dy}{dx} + \varphi(x)f(x)y(x) = \varphi(x)g(x) \,, $$`
by construction of the integrating factor
`$$ \frac{d\varphi}{dx} = \varphi(x)f(x) \,. $$`
The original equation can be written as
`$$ \frac{d}{dx}\left(\varphi(x)y(x)\right) = \varphi(x)g(x) \,.$$`

This can be solved by integration of the right hand side, either directly or by substitution.
The solution is
`$$ y(x) = \frac{\int\varphi(x)g(x)\,dx}{\varphi(x)} $$`
Note: You need to be careful to consider where the solutions exist, that is, you need `$\varphi(x) \neq 0$`.
Therefore no solutions exist for `$x$` such that `$\varphi(x) \neq 0$`.
The following example will show you how to use integrating factors to solve a first-order ODE.


### Walkthrough

We wish to solve
`$$ \frac{dy}{dx} + \frac{y}{x} = 1 \,, $$`
subject to `$y(1) = 0$`.
The integrating factor for this equation is given by
`$$ \varphi(x) = e^{\int\frac{1}{x}\,dx} = x \,. $$`
Therefore the original equation may be written as
`$$ \frac{d}{dx}\left(xy\right) = x \,. $$`
Integrating the right-hand side gives
`$$ y(x) = \frac{x}{2} + \frac{C}{x} \,, $$`
where `$C \in \Re$` is a constant of integration, and `$x \neq 0$`. This is the general solution to the differential equation. We now need to apply the initial condition `$y(1) = 0$`.
`$$ 0 = \frac{1}{2} + \frac{C}{1} \,.$$`
Therefore `$ C = \frac{-1}{2} $`, and the solution is `$ y(x) = \frac{x}{2} - \frac{1}{2x}$`, valid for `$x>0.$`
