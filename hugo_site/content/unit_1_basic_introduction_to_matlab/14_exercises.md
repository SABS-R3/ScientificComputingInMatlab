---
title: "Exercises"
date: 2020-11-13T16:52:22Z
draft: false
pre: "14. "
---

The unit closes with a few simple exercises for you to test the skills you have learned throughout the unit.


{{% notice question %}}
Problem 1: Hint based problem

1. Write functions to calculate the maximum and minimum of an array of numbers, without using the commands `max !nc` or `min !nc`.
    Your functions should take in a vector and return values for the maximum and minimum.

{{%expand "Expand for hint"%}}

{{% notice hint %}}
The following `if !nc` statement will find the maximum between `max_x !nc` and `x(i) !nc`:

```matlab
if x(i)>max_x
    max_x=x(i);
end
```
{{% /notice %}}
{{% /expand%}}


2. Combine the functions from part 1. to make one function that returns both the maximum and the minimum.
See `doc function` for help on how to return multiple values.


{{%expand "Expand for solution"%}}
{{% notice solution %}}
1. The following code will calculate the maximum of an array passed to it:

    ```matlab
    function [max_x] = maximum(x)
        max_x=x(1);
        for i=1:length(x)
            if x(i)>max_x
                max_x=x(i);
            end
        end
    ```

    The following code will calculate the minimum of an array passed to it.

    ```matlab
    function [min_x] = minimum(x)
        min_x=x(1);
        for i=1:length(x)
            if x(i)<min_x
                min_x=x(i);
            end
        end
    ```

    To use these, save the above a `.m !nc` files with the appropriate names, and run the commands:

    ```matlab
    minimum(x)
    maximum(x)
    ```

    where `x !nc` is a vector.

2. The following code will calculate the minimum and the maximum of an array passed to it:

    ```matlab
    function [min_x,max_x] = minmax(x)
        min_x=x(1);
        max_x=x(1);
        for i=1:length(x)
            if x(i)<min_x
                min_x=x(i);
            end
            if x(i)>max_x
                max_x=x(i);
            end
        end
    ```

    To call the function, save the above as `minmax.m !nc`, and run:

    ```matlab
    [minimum,maximum] = minmax(x)
    ```
{{% /notice %}}
{{% /expand%}}
{{% /notice %}}


{{% notice question %}}

Problem 2: Hint based problem

1. Plot the functions `$y=x^3$` and `$y=x^5$`, on the interval `$[-2,\,2]$`, on the same graph.
    Where are the intersections of the curves?

{{%expand "Expand for hint"%}}

{{% notice hint %}}
You may want to create the following vectors:

```matlab
x=linspace(-2,2,100);
y1=x.^3;
```

and use the plot functionality you learned in this unit.
{{% /notice %}}

{{% /expand%}}

2. Add a title and legend to the graph, label the axes, and save the figure as a `.png !nc` file.

{{%expand "Expand for solution"%}}
{{% notice solution %}}
1. Intersections occur at `$(x,\,y)=(−1,\,−1),(0,\,0),(1,\,1)$`.
    The following commands plot the curves:
    
    ```matlab
    x=linspace(-2,2,100);
    y1=x.^3;
    y2=x.^5;
    plot(x,y1,'-',x,y2,'--');
    ```

2. The following commands will add a label and legend to the figure:

    ```matlab
    legend('y=x^3','y=x^5');
    xlabel('x');
    ylabel('y');
    ```

    You can save the file by using 'Save As' in the 'File' menu or by using the following command.

    ```matlab
    print ExampleFigure.png -dpng
    ```

{{% /notice %}}
{{% /expand%}}






{{% /notice %}}