---
title: "Using the inbuilt help"
date: 2020-11-22T16:52:22Z
draft: false
pre: "5. "
---

The help facility within MATLAB is very extensive.
You will be using the help files throughout this course to find out what a new function does when you first come across it.

If you know the name of the function in which you are interested, you can type `help FunctionName`.

For instance, typing `help fft` will display

```plaintext
>> help fft
 fft Discrete Fourier transform.
    fft(X) is the discrete Fourier transform (DFT) of vector X.  For
    matrices, the fft operation is applied to each column. For N-D
    arrays, the fft operation operates on the first non-singleton
    dimension.

    ...
```

Instead, you can open the more extensive documentation pages by typing `doc FunctionName`.
For instance, typing `doc fft` will open the following window:

![docs for fft](/ScientificComputingInMatlab/images/unit_01/1_05_1.png?classes=matlab-screenshot)

The only real drawback is that you need to know not only that something is there but also what it is called.
Fortunately, most of the MATLAB commands have sensible names and there is inbuilt search functionality for the graphical help.

You can just load the graphical help browser where you can search for the function you need by typing `doc`, which brings up the following window:

![docs home screen](/ScientificComputingInMatlab/images/unit_01/1_05_2.png?classes=matlab-screenshot)
