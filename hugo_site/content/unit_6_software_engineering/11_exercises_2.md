---
title: "Exercises 2"
date: 2020-11-16T16:52:22Z
draft: false
pre: "11. "
---


Consider the partial differential equation
`$$\frac{\partial u}{\partial t} = \frac{\partial^2 u}{\partial x^2},\qquad\mbox{for}\qquad 0<x<1,\quad 0<t<0.2,$$`

with boundary conditions `$u(0,t) = u(1,t)=0$` and initial condition `$u(x,0)=\sin(\pi x)$`.
This is the 'Unsteady Heat Equation', whose exact solution is given by
`$$u(x,t)=\sin(\pi x)\exp(-\pi^2 t).$$`

The function [HeatEquation.m]([HeatEquation.m](/ScientificComputingInMatlab/docs/unit_06/HeatEquation.m)) solves this system using a forward Euler scheme for the temporal derivative and a second-order finite difference formula for the spatial derivative.
You are not required to understand the solution method, but more details can be found in [*Numerical Solution of Partial Differential Equations* by K. W. Morton and D. F. Mayers](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph001383485) if you are interested.

{{% notice question %}}

This code is currently very inefficient and can be improved.
Using the techniques you have learned in this unit and from the suggested preliminary reading, speed up the code.
You can only change the code from line 18 and you must still produce the plot and output the same error.

The speed of the code can be assessed by running

```matlab
tic, Error = HeatEquation(100), toc
```

which has output

```matlab
>> tic, Error = HeatEquation(100), toc
Error =
   6.6559e-05
Elapsed time is 3.069019 seconds.
```

where Error is the maximum error of the numerical solution compared to the actual solution (in both time and space).
The time will be different depending on the speed of your computer and the other programs you are currently running.

Currently, running HeatEquation with `$N=500$` intervals yields an error of 2.6626e-06 but takes many hours to run, but it should be possible to reduce this to a few seconds by improving the code.

{{%expand "Expand for solution"%}}
{{% notice solution %}}

The code below is an optimised version of the inefficient code provided in `HeatEquation.m`.

The things that have been changed are:

- moving the calculation of A outside the loop;
- saving only the current solution rather than growing matrices;
- using backslash instead of calculating the inverse

It is possible to solve for `$N=500$` in under 3.3 seconds, and it may be possible to go faster than this by using .mex files or through improvements to the numerical solution methods.

```matlab
% Function that solves the 1d heat equation on [0,1] with zero Dirichlet
% boundary conditions and initial condition u_0=sin(pi*x).
%
% Inputs: N - Number of points to solve on.
% Outputs: MaxError - Maximum error of the numerical solution.
function MaxError = FastHeatEquation(N)
    %% You can't change this section %%
    nu = 0.2;                 % ratio of spatial to temporal step, chosen for stability
    dx = 1/N;                 % space step
    dt = nu*dx^2;             % time step (Chosen to ensure stability)
    x = (0:dx:1)';            % grid points to solve on
    ue = sin(pi*x);           % initial data
    MaxError = 0;
    EndTime = 0.2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% You can change from here on in %%
    % Construct A outside the loop:
    col = ones(N-1,1);  % Column vector of ones
    D = spdiags([col -2*col col],[-1,0,1],N-1,N-1);
    A = spdiags(col,0,N-1,N-1)-nu*D; % LHS matrix
    %
    u = ue(2:N);        % Remove boundary values (always 0)
    %
    figure; hold on;
    plot(x,[0;u;0],'b',x,ue,'r:'); drawnow; % Plot current solution
    for t = dt:dt:EndTime
        u = A\u; 				% Update solution
        ue = sin(pi*x)*exp(-pi*pi*t); % Compute exact solution
        % At intervals of 0.05, plot current solution
        if mod(t,0.05) < dt
            plot(x,[0;u;0],'b',x,ue,'r:'); drawnow;
        end
        MaxError = max([MaxError,max(u-ue(2:N))]);
    end
end
```

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
