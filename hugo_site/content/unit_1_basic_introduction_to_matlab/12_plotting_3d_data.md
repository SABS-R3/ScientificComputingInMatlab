---
title: "Plotting 3D data"
date: 2020-11-15T16:52:22Z
draft: false
pre: "12. "
---

MATLAB can also plot functions and data in 3D.
The following commands are used to plot in 3D:

```matlab
plot3
surf
mesh
contour
```

Before you continue, look at the help files for those commands.

The following walkthrough is an example of producing a plot of a 3D function.

### Walkthrough

First create a mesh on which to plot the surface

```matlab
x = linspace(0,20,100);
y = linspace(0,10,100);
[X,Y] = meshgrid(x,y);
```

Then define a surface by defining a 'z-value' for each point on the mesh:

```matlab
Z=sin(X).*sin(Y);
```

To view the surface in 3D use the commands:

```matlab
surf(X,Y,Z)
```

which gives:

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

```matlab
mesh(X,Y,Z)
```

which gives:

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

```matlab
contour(X,Y,Z)
```

which gives:

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

```matlab
plot3(X,Y,Z)
```

which gives:

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)

Many of the same tools and commands that worked in 2D plots (legend, title, etc) also work in 3D.

To close all figures at once you can use the `close all` command.
