---
title: "Exercises 1"
date: 2020-11-22T16:52:22Z
draft: false
pre: "5. "
---


The following exercise will allow you to practise what you have learned so far in this unit.

Let `$A$` be a sparse symmetric [positive definite matrix](https://en.wikipedia.org/wiki/Definite_symmetric_matrix) of dimension `$(N-1)^2\times (N-1)^2$` entered in MATLAB (for a given `$N$`) by the function `buildA` as follows:

```matlab
function A=buildA(N)
    dx=1/N;
    nvar=(N-1)^2;
    e1= ones(nvar,1);
    e2=e1; e2( 1:N-1:nvar)=0;
    e3=e1; e3(N-1:N-1:nvar)=0;
    A=spdiags([-e1 4*e1 -e1],-(N-1):N-1:N-1,nvar,nvar)...
        +spdiags([-e3 -e2], -1: 2 : 1,nvar,nvar);
    A=A/dx^2;
end
```

We will consider manipulation of the matrix `$A$`, which will be used again in later exercises as the solution to the linear system containing this `$A$`.
This corresponds to a finite difference solution to Poisson's equation:

`$$-\nabla^2u=f$$`

on the unit square with zero [Dirichlet boundary conditions](https://en.wikipedia.org/wiki/Dirichlet_boundary_condition).

{{% notice question %}}

1. Copy the function `buildA` above into a new file `buildA.m` in your current working directory.

2. Set `$N=4$` and produce a spy plot of the matrix `$A$`.
    How many non-zero diagonals are there?
    How many non-zero entries are there?

3. What is the determinant of `$A$` when `$N=4$`?

4. When `$N=4$`, which entries of `$A^{-1}$` are greater than 0.02?

5. For `$N=4$`, check that `$A$` is symmetric by producing a spy plot of `$A-A^T$`: if `$A$` is symmetric there should be no non-zero entries.
    Check that `$A$` is positive definite by looking at its eigenvalues: they should all be strictly positive.


{{% expand "Expand for solution" %}}
{{% notice solution %}}
2. To create the spy plot of the matrix `$A$`, use the MATLAB function `spy(A)`.
    From this we see that there are five non-zero diagonals.
    Using `nnz(A)` we see that there are 33 non-zero entries.
    ![Spy plot of A](/ScientificComputingInMatlab/images/unit_04/4_05_1.svg?classes=matlab-screenshot-40)

3. When `$N=4$`, the MATLAB command `det(A)` gives the determinant as 6.8961e+15.

4. Letting `B=inv(A)`, the command `[i,j]=find(B>0.02)` tells us that the entries (2,2), (4,4), (5,5), (6,6) and (8,8) are greater than 0.02.

5. The spy plot `spy(A-A')` shows no non-zero entries.
    Likewise, `A-A'` yields `All zero sparse: 9×9`.
    Both tell us that `$A$` is symmetric.
    
    The command `e=eigs(A,9)` tells us the eigenvalues are:

    ```plaintext
    >> e=eigs(A,9)
    e =
      109.2548
       86.6274
       86.6274
       64.0000
       64.0000
       64.0000
       41.3726
       41.3726
       18.7452
    ```
    and, hence, are all strictly greater than zero.

{{% notice note %}}

Here, by default, `eigs(A)` only gives a subset of the eigenvalues, but we can force MATLAB to calculate all eigenvalues by specifying the number that we want: hence, `eigs(A,9)`.

An `$N\times N$` matrix will always have `$N$` eigenvalues, although some may be repeated, as is the case here.
{{% /notice %}}
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}

