---
title: "Speeding up code: part 1"
date: 2020-11-18T16:52:22Z
draft: false
pre: "9. "
---


There are various methods for speeding up your code and the [Writing Fast MATLAB Code](/ScientificComputingInMatlab/docs/unit_06/writing_fast_matlab_code_getreuer/matopt.pdf) guide contains a lot of useful tips.
We now list some examples of the key methods used to speed up MATLAB code: preallocating; vectorising; using inbuilt functions; and using sparse matrices.


## Preallocating

Most of your calculations in MATLAB have involved manipulations of matrices and vectors, which can slow code down immensely if not used correctly.
The following walkthrough will show you how to avoid these problems.

### Walkthrough

MATLAB allows vectors and matrices to grow dynamically in the code.

For example the following code:

```matlab
tic
x = 0;
for k = 2:1000000
   x(k) = x(k-1) + 5;
end
toc
```

shows that the loop takes approximately 0.068569 seconds.
If we preallocate:

```matlab
tic
x = zeros(1,1000000);
for k = 2:1000000
   x(k) = x(k-1) + 5;
end
toc
```

then the same operation takes just 0.003594 seconds, a nearly 20x speed-up.
This problem was substantially worse in older versions of MATLAB, but preallocation is still [recommended by MATLAB](https://uk.mathworks.com/help/matlab/matlab_prog/preallocating-arrays.html).

You can preallocate matrices in a similar way by using

```matlab
A=zeros(M,N);
```

If the size of the vector is unknown, then you can use an upper limit and then crop the vector afterwards, for example

```matlab
x=zeros(1,100); % Preallocate
i=1; % initialise i
while x(i)<100
      i=i+1;
      x(i)=i^2;
end
x(i+1:end)=[]; % Crop the vector
x
```

This is one of the biggest reasons for slow code and the MATLAB editor will highlight this by underlining growing vectors and matrices with orange lines, as shown in the following figure:

![Preallocation slowdown warning](/ScientificComputingInMatlab/images/unit_06/6_09_1.png?classes=matlab-screenshot)


## Vectorising

MATLAB is designed to be very quick at applying operations to arrays rather than applying them many times in loops.
Therefore vectors should be used when an operation needs to be applied to every element of an array.
The process of converting loops for vector and matrix operations is known as vectorisation.
This is shown in the following walkthrough example.

### Walkthrough

Consider the three following vectors

```matlab
x=rand(100000,1);
y=rand(100000,1);
z=rand(100000,1);
```

Then the following (preallocated) loop

```matlab
d=zeros(size(x));
for i=1:100
	d(i) = x(i)^2 + y(i)^2 + z(i)^2;
end
```

could be replaced by the one line

```matlab
d = x.^2 + y.^2 + z.^2;
```

MATLAB is getting much smarter at recognising loops that can be replaced with vectorised operations, so it's likely that this specific example will be a similar speed whether you use the loop or the one line calculation.
But, in general, loops should be avoided in MATLAB where possible, and use the built-in vectorised operations wherever possible.

To help vectorise code you can use the 'find', 'any' and 'all' commands.

Look at the help files for these functions:

```matlab
doc find
doc any
doc all
```

and try the following commands:

```matlab
find([1 2 4]>[5 4 1])
find([1 0 1]==1)
any([1 0 0 1])
all([1 0 0 1])
```

Can you see how using these commands replaces hand-writing a loop together with 'if' statements?

Storing your variables as matrices and vectors will also make your code shorter and, hopefully, more readable.
In addition this will enable you to make use of the vector and matrix operators (such as multiplication) in MATLAB.


## Using inbuilt MATLAB functions

MATLAB's inbuilt functions will operate faster than code you have written yourself.
The simplest example of this may be seen in calculations of the maximum and minimum.
If we use the code to calculate the maximum (from the first unit), we can compare it to the inbuilt `max` command.

```matlab
function [max_x] = maximum(x)
    max_x=x(1);
    for i=1:length(x)
        if x(i)>max_x
            max_x=x(i);
        end
    end
end
```

This is a very simple code to calculate the maximum of a vector, but it is very difficult to speed it up without using inbuilt MATLAB functions. If we compare this to the inbuilt max function using

```
x=rand(10^7,1);
tic; max_x = maximum(x); toc;
tic; max_x = max(x); toc;
```

we see that our method takes about 0.019851 seconds whereas the inbuilt code takes 0.003771 seconds.
Although this is difference is relatively minor in absolute terms, the inbuilt version is still about 5x faster.
This is because all the low-end functions such as 'max' are written in machine code and optimised by MATLAB for the system on which it is installed, so the inbuilt methods should always be faster.

Moreover using the inbuilt commands also means you can write less code.


## Sparse matrices

As seen in the earlier unit ['Linear algebra in MATLAB'](/ScientificComputingInMatlab/unit_4_linear_algebra), a matrix whose entries are mostly zero is known as 'sparse'.
The command:

```matlab
A=sparse(A);
```

will convert `$A$` to a sparse matrix and only the non-zero entries will be stored, reducing storage.
Moreover, MATLAB has versions of most commands specifically for use with sparse matrices and vectors, and MATLAB will automatically select the optimal version.
The improvements to be derived from using sparse matrices in terms of speed were shown in unit 4.
