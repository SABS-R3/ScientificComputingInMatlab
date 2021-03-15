---
title: "Eigenvalues and eigenvectors"
date: 2020-11-24T16:52:22Z
draft: false
pre: "3. "
---


Key properties of square matrices are their eigenvalues and eigenvectors, which enable them to be written in a simpler form, through a process known as eigenvalue decomposition.
This is useful for performing mathematical and numerical analysis of matrices in order to identify their key features.
A similar process is available for non-square matrices, known as singular value decomposition (SVD).
(Note that SVD also exists for square matrices.)
There are inbuilt tools within MATLAB that may be used to perform both of these decompositions.

{{% notice info %}}
For more details on the theory of eigenvalues and singular value decomposition see [*Linear Algebra and its Applications* by Gilbert Strang](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph016130511), or the following web pages:

- http://mathworld.wolfram.com/Eigenvalue.html
- http://mathworld.wolfram.com/Eigenvector.html
- http://mathworld.wolfram.com/EigenDecomposition.html
- http://mathworld.wolfram.com/SingularValueDecomposition.html
{{% /notice %}}

We now look at the commands in MATLAB that enable us to calculate these decompositions.

### Walkthrough

Consider the square matrix

```matlab
A=randn(10);
```

The following commands calculate the eigenvalues and eigenvectors of the matrix (enter the commands):

```matlab
e=eig(A);
[V,D]=eig(A);
```

Print `e`, `V` and `D`.

Evaluate the following:

```matlab
A*V - V*D
```

{{% notice question %}}
What does this give you?
Why is this?
Use the MATLAB help files to work out what `V` and `D` are.

{{%expand "Expand for solution"%}}
{{% notice solution %}}
This gives you a matrix that is zero to machine precision (that is, all their entries are less than `$10^{−12}$`).
This is because the eigenvalue decomposition of `$A$` is `$A=VDV^{-1}$`, where `$V$` is a matrix whose columns are the eigenvectors of `$A$` and `$D$` is a diagonal matrix containing the eigenvalues of `$A$`.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}

Now consider the non-square matrix:

```matlab
A=randn(10,5);
```

The following commands calculate the singular value decomposition (SVD) of the matrix:

```matlab
[U,S,V]=svd(A);
```

Evaluate the following

```matlab
A - U*S*V'
```


{{% notice question %}}
What does this give you?
Why is this?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
Again, this gives you a matrix that is zero to machine precision (all entries are less than `$10^{−12}$`).
This is because the singular value decomposition of `$A$` is `$A=USV^{T}$`, where `$U$` and `$V$` are square orthogonal matrices of different sizes and `$S$` is a matrix of the same size as `$A$` whose diagonal entries are the singular values of `$A$`, with extra rows or columns of zeros depending on the size of `$A$`.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}


{{% notice info %}}
Note that the command `[U,S,V]=svd(A,0)` calculates the economic version of the SVD.
What is this?

{{%expand "Expand for solution"%}}
{{% notice solution %}}
The economic form just removes the zero rows/columns from `$S$`.
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}


Now clear the workspace

```matlab
clear
```
