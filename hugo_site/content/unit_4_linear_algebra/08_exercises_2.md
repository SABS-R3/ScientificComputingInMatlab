---
title: "Exercises 2"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


The following exercise is the final one in the unit and it will allow you to practise using MATLAB to solve linear systems and give you an insight into which methods to use.

Let `$A$` be a sparse symmetric positive definite matrix of dimension `$(N-1)^2\times (N-1)^2$` defined in `buildA.m` from [the previous question](/ScientificComputingInMatlab/unit_4_linear_algebra/05_exercises_1), and let `$f$` be the vector of dimension `$(N-1)^2$` entered in MATLAB (for a given `$N$`) by the function:

```matlab
function f=buildf(N)
    x=0:1/N:1;
    y=x;
    f=sin(pi*x)'*sin(pi*y);
    f=reshape(f(2:N,2:N),(N-1)^2,1);
end
```

Copy this function to a file called `buildf.m` in your current working directory.

In this exercise we will consider the solution of the linear system `$Au=f$`, which corresponds to a finite difference solution to Poisson's equation `$-\nabla^2u=f$` on the unit square, with zero Dirichlet boundary conditions, where `$f=\sin(\pi x)\sin(\pi y)$`.
Partial differential equations of this type occur very frequently (usually with some additional reaction and or convection terms) in mathematical modelling of physical and biological processes, and even in image analysis.

{{% notice question %}}

For `$N=4,\,8,\,16,\,32,\,64,\,128,\,256,\,512$`, try the following:

1. Solve the linear systems `$Au=f$` by explicitly calculating `$A^{-1}$` and calculating `$u=A^{-1}f$` and record the time this takes on a log–log graph. (Omit the cases `$N=128,\,256,\,512$` as the program may run out of memory or take an awfully long time.)

{{% expand "Expand for hint" %}}
{{% notice hint %}}

You may wish to use the following code from the [earlier walkthrough](/ScientificComputingInMatlab/unit_4_linear_algebra/06_solving_axb_basic) as a starting point:

```matlab
% we will perform 20 repeats on 12 problem sizes
num_repeats=20;
num_problems=12;
%
% 2, 4, 8, 16, ..., 4096
problem_sizes=2.^(1:num_problems);
%
% pre-allocate two matrices to store the times in
times_inv=zeros(num_repeats,num_problems);
times_slash=zeros(num_repeats,num_problems);
%
for problem=1:num_problems
    problem_size=problem_sizes(problem);
    for repeat=1:num_repeats
        % create the random matrix A and vector b
        A=randn(problem_size);
        b=randn(problem_size,1);
        % time the two methods of solving Ax=b
        tic; x1=inv(A)*b; times_inv(repeat,problem)=toc;
        tic; x2=A\b; times_slash(repeat,problem)=toc;
    end
end
%
% Plot a log-log plot of average time vs problem size
loglog(problem_sizes,mean(times_inv),'rx',...
    problem_sizes,mean(times_slash),'bo')
ylabel('Elapsed time')
title('Comparison of times to solve a matrix problem using inv and backslash')
legend('inv(A)*b','A\\b','Location','NorthWest')
```

{{% /notice %}}
{{% /expand %}}

2. Solve the linear systems using Gaussian elimination (corresponding to MATLAB's `\` command).
    Plot the time this takes on the same graph.

{{% expand "Expand for solution" %}}
{{% notice solution %}}

The following MATLAB code calculates both of these and plots them on the same graph:

```matlab
% no repeats this time: the matrices are not random
num_problems=8;
%
% 4, 8, 16, ..., 512
problem_sizes=2.^(2:1+num_problems);
%
% pre-allocate a matrix to store the times
times=zeros(2,num_problems);
%
for problem=1:num_problems
    problem_size=problem_sizes(problem);
    % create the A and f
    A=buildA(problem_size);
    f=buildf(problem_size);
    % time the two methods of solving Au=f
    if problem_size<128
        tic; u1=inv(A)*f; times(1,problem)=toc;
    end
    tic; u2=A\f; times(2,problem)=toc;
end
%
% Plot a log-log plot of average time vs problem size
loglog(problem_sizes,times(1,:),'x-',...
    problem_sizes,times(2,:),'o-')
ylabel('Elapsed time')
title('Comparison of times to linear system using inv and backslash')
legend('inv(A)*b','A\\b','Location','NorthWest')
```

This yields the following figure:

![Linear solve comparison](/ScientificComputingInMatlab/images/unit_04/4_08_1.svg?classes=matlab-screenshot-40)

Note that backslash is faster than calculating the inverse explicitly for all problem sizes bigger than `$N=4$`, and backslash solves the `$(N-1)^2\times (N-1)^2$` system even for `$N=512$` in under a second.

Calculating the inverse fails for `$N=128$` is infeasible in a sensible amount of time.

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}
