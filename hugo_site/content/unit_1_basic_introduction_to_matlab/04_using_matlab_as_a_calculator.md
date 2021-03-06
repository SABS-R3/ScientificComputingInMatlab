---
title: "Using MATLAB as a calculator"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---

The first thing we will use MATLAB for is a calculator.

MATLAB uses the standard computer symbols for addition ('`+`'), subtraction ('`-`'), multiplication ('`*`') and division ('`/`').
Brackets are also used (if required) to indicate which operations are to be performed first.

For example, to evaluate `$3 + 4\left(1 + \frac{6}{3}\right)$` type the following in the Command Window:

```matlab
3+4*(1+6/3)
```

and you get the answer 15.
Your Command Window should look just like:

```text
>> 3+4*(1+6/3)

ans =

    15
```

Suppose we wished to set the variable `x` equal to  `$3 + 4\left(1 + \frac{6}{3}\right)$`.
Then we would type

```matlab
x=3+4*(1+6/3)
```

and get the answer `x = 15`.
In long calculations it is often unnecessary for the value of `x` to be output to the screen.
If we wanted to calculate `x` but not output the answer to the screen we would end the line with a semicolon

```matlab
x=3+4*(1+6/3);
```

The value of `x` may now, if desired, be printed out by typing

```matlab
x
```

To evaluate a power we use the '`^`' symbol. For example, to evaluate `$3^4$` type

```matlab
3^4
```

Finally, you can clear the variable `x` by typing

```matlab
clear
```

Now typing

```matlab
x
```

shows that the variable `x` has been deleted:

```text
>> x
Unrecognized function or variable 'x'.
```
