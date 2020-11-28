---
title: "Vectors and matrices: part 1"
date: 2020-11-22T16:52:22Z
draft: false
pre: "6. "
---


{{% notice info %}}
The main data structures in MATLAB are vectors and matrices.
If you have never heard of these before, then look them up in an A-level textbook, on [the Wolfram MathWorld pages](https://mathworld.wolfram.com/Matrix.html), or on [Wikipedia](https://en.wikipedia.org/wiki/Matrix_(mathematics)) before you continue.
{{% /notice %}}


## Vectors

Vectors in MATLAB are `$n\times 1$` or `$1\times n$` arrays of numbers.

### Walkthrough

Suppose the vector `$u$` is given by `$u=(1\;4\;9)$`. This may be entered into MATLAB in either of the following ways:

1. By entering each entry of the matrix individually.
    ```matlab
    u(1)=1;
    u(2)=4;
    u(3)=9;
    ```
    Note that `u(1) !nc` corresponds to the first entry of `u !nc`, etc.

1. By typing the entries inside square brackets separated by spaces:

   ```matlab
   u=[1 4 9];
   ```



The transpose of `u !nc` may be printed by typing `u'`.

Suppose the vector `$v$` is given by: `$$v=\begin{pmatrix}4\\5\\6\end{pmatrix}$$`

This may be entered by typing:

```matlab
v = [4;5;6];
```

Inside the square brackets the semicolon denotes a new row.

{{% notice note %}}
Vectors are sometimes referred to as arrays.
This may be confusing so always look at the dimensions of the array to check the type.
{{% /notice %}}


The length of a vector `v !nc` can be found by using the command `length(v)`, which here gives:

```plaintext
>> length(v)

ans =

     3
```

The size of a vector `v !nc` can be found by using the command `size(v)`, which here gives:

```plaintext
>> size(v)

ans =

     3     1
```

This tells us that `v !nc` has 3 rows and 1 column, and thus allows us to distinguish it from `u !nc`, which has 1 row and 3 columns.


Now look up the commands `length` and `size` in the help files:

```matlab
help length
help size
```

## Matrices

Matrices in MATLAB are `$m\times n$` arrays of numbers.

### Walkthrough

Suppose the matrix `$A$` is given by: `$$A=\begin{pmatrix}1&2\\3&4\end{pmatrix}$$`

This may be entered into MATLAB in either of the following ways:

1. By entering each entry of the matrix individually

    ```matlab
    A(1,1)=1;
    A(1,2)=2;
    A(2,1)=3;
    A(2,2)=4;
    ```

{{% notice note %}}
The entry `$A(i,j)$` corresponds to the entry in row `$i$` and column `$j$` of the matrix `$A$`.
{{% /notice %}}

2. By typing

    ```matlab
    A=[1 2; 3 4];
    ```

{{% notice note %}}
Use of `; !nc` inside the square brackets denotes a new row in the matrix.
{{% /notice %}}


The dimensions of a matrix `A !nc` can be found by using the command `size(A)`, which here gives

```plaintext
>> size(A)

ans =

     2     2
```

{{% notice note %}}
Running the command `length(A)` on a matrix `A !nc` yields the result 2, which is the bigger dimension of the matrix, so if `A !nc` were a `$4\times 6$` or a `$6\times 4$` matrix, `length(A)` would yield the answer 6.
{{% /notice %}}


## Editing vectors and matrices

### Walkthrough

Editing vectors and matrices can be done by specifying the individual element.
For example, to change the value of 2 in the matrix `A !nc`, above, to 5 we can type

```matlab
A(1,2)=5;
```

An alternative method is to double-click on `A !nc` in the Workspace window.
This opens a window containing the contents of the matrix `A !nc`.
Click on the entry in the first row, second column, and change it to 5.


## Looking at parts of matrices

Sometimes we may wish to access only certain parts of a matrix or vector.
There are a number of inbuilt MATLAB commands to help with this.

### Walkthrough

The matrix `$$C=\begin{pmatrix}1&2&3&4\\5&6&7&8\\9&10&11&12\end{pmatrix}$$`

may be entered in MATLAB as

```matlab
C=[1 2 3 4; 5 6 7 8; 9 10 11 12];
```

To view the whole matrix we would type

```matlab
C
```

To view the second column we would type

```matlab
C(:,2)
```

To view the third row we would type

```matlab
C(3,:)
```

To view the first two rows we would type

```matlab
C(1:2,:)
```

To view the elements in both the last two rows and the last three columns we would type

```matlab
C(2:3,2:4)
```

{{% notice note %}}
The following: `C(2:end,2:end)` would yield the same result.
{{% /notice %}}
