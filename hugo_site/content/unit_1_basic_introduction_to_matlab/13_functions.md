---
title: "Functions"
date: 2020-11-14T16:52:22Z
draft: false
pre: "13. "
---

A particularly useful feature of MATLAB is the ability to define functions.

### Walkthrough

The syntax for defining the function `$y=x^2$` is as follows:

```matlab
function [y] = xsquared(x)
    
    y = x^2;
```

{{% notice info %}}
1. The `[y] !nc` indicates the variables that will be returned from the function: there may be multiple, e.g. `[y1, y2] !nc`.
1. The `(x) !nc` indicates the parameters that are passed to the function: there may be multiple, e.g. `(x1, x2) !nc`.
{{% /notice %}}

Type these commands into an M-file called `xsquared.m` and save this file.
Now type:

```matlab
xsquared(5)
```

and then

```matlab
d=7;
xsquared(d)
```

Note that MATLAB also allows you to apply functions to arrays.
To do this with the power function we modify the above by placing a `'.' !nc` before the `'^' !nc` in the above:


```matlab
function [y] = xsquared(x)
    
    y = x.^2;
```

Now type on the command line

```matlab
e=[4,5,6];
xsquared(e)
```
