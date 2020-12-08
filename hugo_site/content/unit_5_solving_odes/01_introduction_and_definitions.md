---
title: "Introduction and definitions"
date: 2020-11-26T16:52:22Z
draft: false
pre: "1. "
---


## Learning objectives

Systems of Ordinary Differential Equations (ODEs) are used to model many physical and biological systems.
MATLAB contains a collection of ODE solvers, which are ideal for investigating such systems.
The aim of this unit is to enable you to understand and use these solvers.
In addition you will see how to tell which solver is appropriate in which situation.

The unit begins with a revision of analytical techniques for solving ODEs before moving on to numerical methods, such as Euler's method.
You will learn how to use the inbuilt MATLAB functions to solve systems of ODEs with initial and boundary conditions.


## Reading list

- [*Advanced Engineering Mathematics* by Erwin Kreyszig](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph021446150), Chapters 1 and 2, for the theory of ODEs.
- http://mathworld.wolfram.com/First-OrderOrdinaryDifferentialEquation.html will cover all the theory you need.
- Matlab help files `doc ode45`, `doc bvp4c`


## Definitions and notation

- Differential Equation – This is an equation containing variables and their derivatives.  

- ODE – Ordinary Differential Equation. This is a differential equation where the derivatives of the dependent variable (usually `$y$` or `$x$`) are with respect to only one independent variable, usually `$x$` or `$t$`.  

- Order of ODE – order of the highest derivative.  

- Therefore a first-order ODE is of the form: `$\frac{dy}{dx}=f(x,y)$`.  

- Notation: the following shorthand for derivatives will be used throughout the unit: `$y'=\frac{dy}{dx}$` and `$\dot{y}=\frac{dy}{dt}$`.  
