---
title: "Vectors and matrices"
date: 2020-11-25T16:52:22Z
draft: false
pre: "2. "
---


The following walkthrough exercises contain a number of activities designed to teach you the basics of using MATLAB for working with vectors and matrices.


## Basic vector and matrix manipulation

You have already learned many basic matrix manipulation commands in the first unit.
This walkthrough provides a quick review of this material with a few new commands added.

### Walkthrough
Let

```matlab
x=[1,2,3]
y=[2,4,6]'
z=[2;4;6]
```

Enter the following commands on the command line and make sure you understand what they do.
If you are unsure use the MATLAB help files.

```matlab
x*y
y*x
y*z
y.*z
sum(x)
prod(y)
```

{{% notice question %}}
Do all of the operations work? If one doesn't then why not.

{{%expand "Expand for solution"%}}
{{% notice solution %}}

`y*z` will not work as this is multiplying two column vectors together.

{{% /notice %}}
{{% /expand%}}
{{% /notice %}}


Now let

```matlab
A=[1,2,3;4,5,6;1,3,2]
```

Enter the following commands on the command line and make sure you understand what they do.
If you are unsure use the MATLAB help files.

```matlab
B=A'
A*y
A*B
det(A)
inv(B)
B*inv(B)
trace(A)
A(1,2)
A(:,2)
A(1,:)
A(2,2:3)
A([2,1,3],:)
A^2
A.^2
sum(A,1)
prod(A,2)
C=[A,z]
ones(5,1)
ones(5)
zeros(1,5)
```

Now clear the workspace

```matlab
clear
```


## Size of vectors and matrices

You also learned lots of commands for finding the size of vectors and matrices.

### Walkthrough

Let

```matlab
A=randn(512);
b=randn(512,1);
```

Enter the following commands on the command line and make sure you understand what they do.
If you are unsure, use the MATLAB help files.

```matlab
length(A)
size(A)
size(b)
b(end)
b(end-5:end)
```

Now clear the workspace

```matlab
clear
```


## Parts of vectors and matrices

We often wish to look at certain parts of matrices: the diagonal entries, for example.
The following will introduce some commands that will allow you to select specific entries.

### Walkthrough

Let

```matlab
A= randn(10);
```

Enter the following commands on the command line and use `spy` to visualise the non-zero entries of the resulting matrices.
What do you see?

Make sure you understand what all the commands do. If you are unsure, use the MATLAB help files.

```matlab
triu(A)
tril(A)
diag(A)
diag(A,2)
diag(diag(A))
```

Now clear the workspace

```matlab
clear
```
