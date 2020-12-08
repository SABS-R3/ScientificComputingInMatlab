---
title: "Sparse matrices"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---


The numerical solution of differential equations often results in what is known as a 'sparse linear' system.
A matrix is 'sparse' if most of its entries are zero, and most of the MATLAB functions you have used so far have versions that are specially optimised for sparse matrices, which can speed up your code immensely.
The details of this speeding-up will be discussed further in the later unit ['Software engineering'](/ScientificComputingInMatlab/unit_6_software_engineering), but we introduce sparse matrices here as they will be used in exercises later in this unit.

The following will give you an introduction to the uses of sparse matrices.

### Walkthrough

Create the matrix `A !nc` using the following commands:

```matlab
A=2*eye(5000)-diag(ones(4999,1),1)-diag(ones(4999,1),-1);
```

Run the following commands to investigate the structure of `A !nc`:

```matlab
A(1:5,1:5)
nnz(A)
spy(A)
spy(A(1:10,1:10))
```

{{% notice question %}}
What is the structure of `A !nc`?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
`A !nc` is 'tri-diagonal', with 2 on the diagonal and −1 on the adjacent diagonals.
Therefore, `A !nc` has `$5000+(2\times 4999)=14998$` non-zero entries, as found using `nnz(A)`.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}

Calculate the inverse of `A !nc`.

{{% notice note %}}
The inverse of `A !nc` is not sparse.
This is true in general.
{{% /notice %}}

```matlab
Ai=inv(A);
spy(abs(Ai)>1)
spy(abs(Ai)>5)
spy(abs(Ai)>10)
spy(abs(Ai)>100)
```

Calculate how long it takes to calculate `$A^2$`.

{{% notice info %}}
You can use the commands `tic` and `toc` to record elapsed time in MATLAB.
{{% /notice %}}

```matlab
tic; A*A; toc
```

Create the matrix `B !nc` using the following commands.
Note that `A !nc` and `B !nc` have the same non-zero entries:

```matlab
B=spdiags(ones(5000,1)*[-1,2,-1],[-1,0,1],5000,5000);
```

The command `spdiags` creates a sparse matrix with the entries from the vector (passed as the first variable) on the diagonal indicated by the second variable. These variables can be passed individually or in groups as in the above example. The final two variables represent the size of the matrix. Look at the MATLAB help files for more information on `spdiags`.

Look at the structure of `B !nc`:

```matlab
B(1:5,1:5)
full(B(1:5,1:5))
nnz(B)
```

{{% notice question %}}
Using the command `whos`, look at how the matrices `A !nc` and `B !nc` are stored.
Which uses less memory?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
```plaintext
>> whos A
  Name         Size                  Bytes  Class     Attributes
  A         5000x5000            200000000  double              
```

```plaintext
>> whos B
  Name         Size               Bytes  Class     Attributes
  B         5000x5000            279976  double    sparse    
```

So `A !nc` used 2000000 bytes, and `B !nc` only used 27976 bytes, saving about 98.6% of the space.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}


{{% notice question %}}
Calculate how long it takes to calculate `$B^2$`:

```matlab
tic; B*B; toc
```

Which is quicker, `$A^2$` or `$B^2$`?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
```plaintext
>> tic; A*A; toc
Elapsed time is 0.768850 seconds.       
```

```plaintext
>> tic; B*B; toc
Elapsed time is 0.013921 seconds.  
```

Calculating `$B^2$` should be faster, and the proportion that it is faster should increase with the size of the matrix.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}

{{% notice question %}}
Now compare the `\` operator

```matlab
b=ones(5000,1);
tic; x1=A\b; toc
tic; x2=B\b; toc
```

Which is quicker, `A\b` or `B\b`?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
```plaintext
>> b=ones(5000,1);
tic; x1=A\b; toc
tic; x2=B\b; toc
Elapsed time is 0.268863 seconds.
Elapsed time is 0.000719 seconds.
```

Calculating `B\b` should be faster, and the proportion that it is faster should increase with the size of the matrix.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}

Finally, you can also convert matrices from full to sparse using the following command

```matlab
A=sparse(A);
```

Using the command `whos`, check that `A !nc` is now sparse and uses the same memory as `B !nc`.

Now clear the workspace

```matlab
clear
```
