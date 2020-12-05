---
title: "Solving $Ax=b$: iterative"
date: 2020-11-20T16:52:22Z
draft: false
pre: "7. "
---


This section is appropriate if you have a background in mathematics and have encountered matrices before.
If not then feel free to attempt this section however the material assumes a relatively high level of knowledge of linear algebra.

MATLAB has many inbuilt methods for solving `$Ax=b$`.
Many of these are iterative and suitable for different kinds of matrices.
If you have information about the structure of `$A$` and know which iterative solver is the best to use (see [*Linear Algebra and its Applications* by Gilbert Strang](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph016130511) for details), you can specify the solver in MATLAB.
The help files will specify the types of matrix to which they should be applied.
We will now use two of these solvers based on the 'conjugate gradient' method.

### Walkthrough

Create a Symmetric Positive Definite (SPD) matrix (and check that it is SPD) by using the following commands:

```matlab
A=randn(50);

% Make sure A is SPD
A=A*A';

% Verify that this gives us a symmetric matrix
spy(A-A')
find((A-A')>1e-10)

% check positive definite: all eigenvalues > 0
e=eig(A);
min(e)
```

Create a suitable right-hand side `$b$`:

```matlab
b=sum(A,2);
```

{{% notice question %}}
With `$A$` and `$b$` defined as above, what is the exact solution to `$Ax=b$`?

{{% expand "Expand for solution" %}}
{{% notice solution %}}

Every element of `$x$` should be exactly 1.
If this is not clear, make sure you understand what `sum(A,2)` is doing, and try writing out a 3x3 system by hand.

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}

Calculate `$x$` using the preconditioned Conjugate Gradient method (CG) (see [*Linear Algebra and its Applications* by Gilbert Strang](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph016130511) for details if you are interested).
Note that  `$A$` must be SPD to use this solver.
Try using it on a non-SPD matrix.

```matlab
x1=pcg(A,b);
x2=pcg(A,b,1e-6,100);
```

What does the second command do differently?
Look at `doc pcg`.
Now look at the solutions:

```matlab
format long
max(abs(x1-x2))
plot(x1-x2)
```

This gives the following figure for the error `$x1-x2$`:

![pcg error](/ScientificComputingInMatlab/images/unit_04/4_07_1.svg?classes=matlab-screenshot-40)


which shows that the solutions are not the same.


{{% notice question %}}
Why is this?

{{% expand "Expand for solution" %}}
{{% notice solution %}}

When running the command

```matlab
x1=pcg(A,b);
```

you should have received the following output:

```plaintext
>> x1=pcg(A,b);
pcg stopped at iteration 20 without converging to the desired tolerance 1e-06
because the maximum number of iterations was reached.
The iterate returned (number 19) has relative residual 0.0019.
```

Therefore the method did not converge in the given maximum number of steps.
It defaults to 20.
The command

```matlab
x2=pcg(A,b,1e-6,100);
```

sets the maximum number of iterations at 100, which is enough for the method to converge.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}

Now clear the workspace

```matlab
clear
```

The [Biconjugate Gradient method](https://mathworld.wolfram.com/BiconjugateGradientMethod.html) can be used in a similar way.
Note that `$A$` does not have to be SPD in this case.

```matlab
A=randn(50);
b=sum(A,2);
x=bicg(A,b,1e-6,100);

plot(x)
```

Now clear the workspace

```matlab
clear
```

To learn more about these iterative methods, see:

```matlab
doc pcg
doc bicg
doc bicgstab
doc gmres
```
