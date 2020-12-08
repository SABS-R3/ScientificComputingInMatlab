---
title: "Reducing higher order ODEs"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---


If we have a general second-order equation of the form
`$$ a(x)\frac{d^2y}{dx^2} + b(x)\frac{dy}{dx} + c(x)y = f(x) $$`
we can reformulate this as a system of first-order equations. If we let `$z=\frac{dy}{dx}$`, then the above equation can be written as
`$$ \frac{dy}{dx} = z \,,$$`
`$$ \frac{dz}{dx} = \frac{f(x) − b(x)z−c(x)y}{a(x)} \,, $$`
which is a system of first-order equations. Therefore we can reduce any second-order ODE to a system of first-order ODEs. Furthermore, using this approach we can reduce any higher-order ODE to a system of first-order ODEs. For example, a fourth-order ODE would yield a system of four first-order ODEs.

Therefore we only need to consider numerical techniques for solving first-order systems of ODEs, since any higher-order equation can simply be reduced to a system of first-order equations.
