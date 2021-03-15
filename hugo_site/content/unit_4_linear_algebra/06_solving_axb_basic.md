---
title: "Solving $Ax=b$: basic"
date: 2020-11-21T16:52:22Z
draft: false
pre: "6. "
---


Much of linear algebra is concerned with solving the linear system `$Ax=b$`.
MATLAB has many inbuilt functions to do this, and in this section you will learn how to use them.

The two easiest methods for calculating the solution to `$Ax=b$` are to calculate the inverse, using `inv` or the `\` (backslash) operator.
The former calculates the inverse explicitly while the latter calculates the solution to `$Ax=b$` using an appropriate numerical technique, such as Gaussian elimination.
If you are not familiar with Gaussian elimination, see any textbook on linear algebra, or the [Wolfram Mathworld page](https://mathworld.wolfram.com/GaussianElimination.html).

We will now go through an example of using these two solution methods.

### Walkthrough

Let

```matlab
A=randn(4096);
b=randn(4096,1);
```

{{% notice question %}}
Solve `$Ax=b$` using both of the methods described above and time how long each method takes:

```matlab
tic, x1=inv(A)*b; toc
tic, x2=A\b; toc
plot(x1-x2)
```

What is the error between the two solutions and which was quicker?

{{% expand "Expand for solution" %}}
{{% notice solution %}}

Depending on your computer, the `\` backslash operator will probably take less than half the time of explicitly calculating the inverse.
Plotting `x1-x2`

![Backslash vs inverse](/ScientificComputingInMatlab/images/unit_04/4_06_1.svg?classes=matlab-screenshot-40)

shows that the maximum error is roughly 1e-12, which can be confirmed by calculating `max(abs(x1-x2))` which, for this random linear system, yields 1.0467e-12.

Your answer will be different due to the randomness of `A` and `b`.

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


Now clear the workspace

```matlab
clear
```

The following code calculates the efficiency of the two solution methods for progressively larger systems.
(Note that this plots the data using a log vs. log plot (`help loglog`) as the values grow exponentially.)

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

First, read the code above and make sure you understand what it does.
Next, run the code.
It may take up to a minute, depending on your computer.

{{% notice question %}}
What does the resulting plot tell you about the speeds of the two methods?

{{% expand "Expand for solution" %}}
{{% notice solution %}}

Running the above code produces the following figure:

![Backslash vs inverse loglog](/ScientificComputingInMatlab/images/unit_04/4_06_2.svg?classes=matlab-screenshot-40)

This shows that, once the linear system is large enough (about 16x16), then backslash is always faster than calculating the inverse.
Because the matrices are generated randomly, the code averages over a number of repeats to try and understand the average behaviour.

This is an artificial problem, but later you will see how an approach to a 'real world' problem is affected by the choice of solution methods.

Can you think of any reasons that 4x4 systems might be quicker to solve than 2x2 systems?
Why might the inverse be faster than backslash for 4x4 systems?

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}

Now clear the workspace

```matlab
clear
```
