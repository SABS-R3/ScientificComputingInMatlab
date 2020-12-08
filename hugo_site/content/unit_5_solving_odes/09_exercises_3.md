---
title: "Exercises 3"
date: 2020-11-18T16:52:22Z
draft: false
pre: "9. "
---


This set of exercises is designed to get you to use MATLAB to solve initial value problems.
Hints and solutions are available.

{{% notice question %}}
1. Solve `$\frac{dy}{dx} = x^2$`, subject to `$y(0) = 1$`.

2. Solve `$\frac{dy}{dx} = \frac{x^2}{y}$`, subject to `$y(0) = 1$`.

3. Solve `$\frac{dy}{dx} + \frac{2y}{x} = x^4$`, subject to `$y(1) = 1$`.

4. Solve `$\frac{d^2y}{dx^2} + 3\frac{dy}{dx} - 4y = 0$`, subject to `$y(0) = 1$` and `$y'(0) = 0$`.
    Note you will need to reformulate this as a system of first order ODEs.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
Questions 1-3 are identical to the single ODE example. Question 4 is equivalent to the coupled system:
`$$ \frac{dy_1}{dx} = y_2 \,, $$`
`$$ \frac{dy_2}{dx} = 4y_1 - 3y_1 \,,$$`
subject to `$y_1(0)=1$` and `$y_2(0)=0$` where `$y_1=y$` and `$y_2=z$`. Therefore you can use the code from the coupled example.

Analytical solutions are given in a previous exercise, so you can check your answers by plotting the numerical solution against the exact solution.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}

Mathematical models of simple chemical or biochemical reaction mechanisms often take the form of non-linear systems of ODEs (derived using the standard chemical laws of mass action).
The various reactions that make up a system often operate on very different time-scales, which leads to a 'stiff' system (for more details see https://en.wikipedia.org/wiki/Stiff_equation).

An example is Robertson's chemical reaction model, in which three chemical species 1, 2 and 3 react according to the following system of equations:
`$$ \frac{dy_1}{dt} = -0.04y_1 + 10000y_2y_3 \,, $$`
`$$ \frac{dy_2}{dt} = 0.04y_1 - 10000y_2y_3 - 30000000y_2^2 \,, $$`
`$$ \frac{dy_3}{dt} = 30000000y_2^2 \,. $$`
With initial conditions `$y_1(0) = 1$`, `$y_2(0) = 0$`, and `$y_3(0) = 0$`.

1. Solve using the `ode45` solver.

2. Solve using the `ode15s` solver, and comment on the differences between the performance of the two solvers.

3. Explain what is happening, both mathematically and chemically.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Using the solution method from the ODE system example, timings can be acquired as follows:

```matlab
tic
ode45(...
toc
```
{{% /notice %}}
{{% /expand %}}

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The following code solves the Robertson reactions using ode45 and ode15s.

```matlab
% Function to solve the Robertson ODE system using ode45 and ode15s.
function SolveRobertson()
    %% Using ode45
    disp('Time for ode45');
    tic; [t,Y45] = ode45(@Robertson,[0,100],[1;0;0]); toc
    % Plot results
    subplot(1,2,1);
    plot(t,Y45(:,1),'b',t,Y45(:,2),'r',t,Y45(:,3),'g');
    legend('y_1 ode45','y_2 ode45','y_3 ode45');
    %% Using ode15s
    disp('Time for ode15s');
    tic; [t,Y15s] = ode15s(@Robertson,[0,100],[1;0;0]); toc
    % Plot results
    subplot(1,2,2);
    plot(t,Y15s(:,1),'b',t,Y15s(:,2),'r',t,Y15s(:,3),'g');
    legend('y_1 ode15s','y_2 ode15s','y_3 ode15s');
    %% Evaluate the right hand side of the system
    function dYdt = Robertson(t,Y)
        dYdt = [-0.04*Y(1) + 10000*Y(2)*Y(3);
            0.04*Y(1) - 10000*Y(2)*Y(3) - 30000000*Y(2)^2;
            30000000*Y(2)^2];
    end
end
```

Running the code, by saving in a file named `SolveRobertson.m` and executing it with `SolveRobertson()`, yields the following output:

```plaintext
>> SolveRobertson
Time for ode45
Elapsed time is 1.090715 seconds.
Time for ode15s
Elapsed time is 0.007496 seconds.
```

and the following plot:

![ode45 coupled system](/ScientificComputingInMatlab/images/unit_05/5_09_1.svg?classes=matlab-screenshot-40)

For this particular example, `ode15s` is almost 150x faster than ode45.

The reactions are occurring on different time-scales and mathematically the problem is known to be 'stiff'.
Therefore, using `ode15s`, which is designed for such problems, is much more efficient than `ode45` in this situation.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
