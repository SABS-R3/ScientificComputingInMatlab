---
title: "Speeding up code: part 2"
date: 2020-11-17T16:52:22Z
draft: false
pre: "10. "
---


Even if you have tried all the standard methods of improving your code, there are specific tools in MATLAB to help you to identify bottlenecks.
The main one of these tools is the profiler.


## MATLAB profiler

Often the best way to develop code is to develop a prototype that has the required functionality, and then to speed up this prototype while maintaining that functionality.
A profiler is a tool that identifies how much time is spent executing each line of the code, which enables us to find problem areas and use the methods of improvement described above to speed it up.

### Walkthrough

MATLAB has its own inbuilt in profiler.
See 'doc profile' for instructions on how to use it.
The profiler can be used via the Command Window, but it is easiest to access it via the 'Run and Time' button.

Download the file [HeatEquation.m](/ScientificComputingInMatlab/docs/unit_06/HeatEquation.m) and put it in your working directory.

First, run the code with parameter `$N=100$` by pressing the arrow under the 'Run' button, and where it says *type code to run*, replace the `$N$` with 100.
Check that it runs OK, with no errors in the Command Window.

Then, press 'Run and Time'.
That should bring up the following window:

![Profiler window](/ScientificComputingInMatlab/images/unit_06/6_10_1.png?classes=matlab-screenshot)

Clicking on HeatEquation (the one with the biggest blue bar) reveals the lines of code where most time was spent:

![Profiler window](/ScientificComputingInMatlab/images/unit_06/6_10_2.png?classes=matlab-screenshot)

This indicates the areas where you can improve the code, as you will see in the exercises later.


## Other tips and tricks

There are many other things that you can do to try to speed up your code.
Some other assorted tips and tricks are.

- In Linux you can start MATLAB with only the command line.
    To do this start MATLAB using the command `matlab –nodesktop`
- You can write components of your code as external `.mex !nc` files, which may be precompiled C++ and Fortran.
    For more details see `doc mex`.
    This kind of optimisation is suitable for loop-heavy code (that cannot be vectorised) and as a last resort for code that requires maximum speed.
- The [Writing Fast MATLAB Code](/ScientificComputingInMatlab/docs/unit_06/writing_fast_matlab_code_getreuer/matopt.pdf) guide is an excellent source for ways to speed up MATLAB code.