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

![Surface plot example](/ScientificComputingInMatlab/images/unit_01/1_12_1.png?classes=matlab-screenshot-40)

```matlab
mesh(X,Y,Z)
```

which gives:

![Mesh plot example](/ScientificComputingInMatlab/images/unit_01/1_12_2.png?classes=matlab-screenshot-40)

```matlab
contour(X,Y,Z)
```

which gives:

![Contour plot example](/ScientificComputingInMatlab/images/unit_01/1_12_3.png?classes=matlab-screenshot-40)

```matlab
plot3(X,Y,Z)
```

which gives:

![3D plot example](/ScientificComputingInMatlab/images/unit_01/1_12_4.png?classes=matlab-screenshot-40)

Many of the same tools and commands that worked in 2D plots (legend, title, etc) also work in 3D.

To close all figures at once you can use the `close all` command.
