---
title: "Exercises 1"
date: 2020-11-22T16:52:22Z
draft: false
pre: "5. "
---

Before we move on to the next section, make sure you can solve the following problems analytically using pen and paper. Hints and solutions are available.

{{% notice question %}}
Solve `$\frac{dy}{dx} = x^2$` subject to `$y(0) = 1$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Try just integrating the right-hand side.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
Integrating both sides yields
`$$ y = \int x^2\,dx + C \,. $$`
This is the general solution to the differential equation, to which we now need to apply the initial condition `$y(0)=1$`.

`$ 1 = y(0) = C$`, so we take `$C=1$`. The solution is therefore
`$$ y = \frac{x^3}{3} + 1 \,. $$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Solve `$\frac{dy}{dx} = \frac{x^2}{y}$`, suvject to `$y(0) = 1$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Try separation of variables.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
Separation of variables yields
`$$ \int y\,dy = \int x^2\,dx + C \,. $$`
Therefore
`$$ \frac{y^2}{2} = \frac{x^3}{3} + C\,. $$`
On rearranging we get
`$$ y = \pm \sqrt{2\left(\frac{x^3}{3} + C\right)} $$`
This is the general solution to the differential equation, to which we now need to apply the initial condition `$y(0)=1$`.

`$1=y(0) = \pm \sqrt{0+C}$`, so we take the positive root and `$C=1$`. The solution is therefore

`$$ y = \sqrt{\frac{2x^3}{3} + 1} \,.$$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Solve `$\frac{dy}{dx} + \frac{2y}{x} = x^4$` subject to `$y(1) = 1$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Try using an integrating factor.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The integrating factor is
`$$ \varphi = e^{\int \frac{2}{x}\,dx} = x^2 \,. $$`
The general solution to the equation is therefore
`$$ y = \frac{x^5}{7} + \frac{C}{x^2} \,. $$`
Applying the initial condition gives
`$$ 1 = y(1) = \frac{1}{7} + C \,, $$`
so `$C = \frac{6}{7} $`. The solution is therefore
`$$ y = \frac{x^5}{7} + \frac{6}{7x^2} \,.$$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Solve `$\frac{dy_1}{dx} = -y_2$` and `$\frac{dy_2}{dx} = y_1$`, subject to `$y_1(0) = 1$` and `$y_2(0) = 0$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Combining these two equations, by differentiating the first and substituting it in the second, yields a second-order ODE with linear coefficients. Look at the characteristic equation.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
Combining these two equations (differentiating the first and substituting it into the second) gives
`$$ \frac{d^2y_1}{dx^2}=−y_1 \,. $$`
The general solution to this is
`$$ y_1=A\cos(x)+B\sin(x) \,. $$`
From the first equation we can calculate `$y_2$` as
`$$ y_2=A\sin(x) − B\cos(x) $$ \,.`
Applying the initial conditions gives `$A=1$` and `$B=0$`. The solution is therefore
`$$ y_1=\cos(x) \quad \textrm{and} \quad y_2=\sin(x). $$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
Solve `$\frac{d^2y}{dx^2} + 3\frac{dy}{dx} - 4y = 0$`, subject to `$y(0)=1$` and `$y'(0) = 0$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
This is a second-order ODE with linear coefficients. Look at the characteristic equation.
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The general solution to this is
`$$ y=Ae^x+Be^{−4x} \,. $$`
Applying the initial conditions gives `$A=\frac{4}{5}$` and `$B=\frac{1}{5}$`. The solution is therefore
`$$ y=\frac{4}{5}e^x+\frac{1}{5}e^{−4x} \,.$$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


## Close of section

There are many methods for solving ODEs analytically, but we may not be able to calculate explicit forms for the integrals, even if we can formulate a given ODE into one of the known forms. Furthermore, if we wish to solve an equation that does match one of the standard forms, then we must recourse to numerical methods. This is the case for most systems of ODEs that represent real-world situations, since most of these are highly non-linear.
