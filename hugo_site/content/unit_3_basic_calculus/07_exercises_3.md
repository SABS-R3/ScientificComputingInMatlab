---
title: "Exercises 3"
date: 2020-11-20T16:52:22Z
draft: false
pre: "7. "
---


{{% notice question %}}
Let `$f(x) = x^3 - 1 $`.

1. Use the bisection method on the interval `$[−1,10]$` to calculate the root of `$f(x)=0$` correct to two decimal places.
    How many bisections were necessary?

2. Use Newton–Raphson with `$x_0=10$` to calculate the root of `$f(x)=0$` correct to two decimal places.
    How many iterations were necessary?

{{% expand "Expand for solution" %}}
{{% notice solution %}}
1. 14 bisections are required for interval bisection:

    ```matlab
    clear
    %
    %% The function, interval and tolerance
    theFunction=@(x)x^3-1;
    theInterval=[-1,10];
    theTolerance=0.001;
    %
    %% Interval bisection method
    NumberOfBisections=0;   % Initialising
    a=theInterval(1);
    b=theInterval(2);
    %
    while (b-a > theTolerance)
        c=(a+b)*0.5;
        fa=theFunction(a);
        fc=theFunction(c);
        if (fa*fc > 0)
            a=c;
        elseif (fa*fc < 0)
            b=c;
        else
            b=a;
        end
        %
        % Increment number of bisections
        NumberOfBisections=NumberOfBisections+1;
    end
    %
    root = c
    NumberOfBisections
    ```

2. 9 iterations are required for Newton–Raphson.
    Example code to solve this is given below:

    ```matlab
    clear
    %
    %% The function, starting value and tolerance
    theFunction=@(x)x^3-1;
    theDerivative=@(x)3*x*x;
    theInitialGuess=10;
    theTolerance=0.001;
    %
    %% Newton-Raphson method
    x=theInitialGuess;      % Initialising
    diff=1;                 % Initialising
    NumberOfIterations=0;   % Initialising
    %
    while ( diff >= 0.001 )
        y=x - theFunction(x)/theDerivative(x);
        diff=abs(y-x);  % calculate |x_(n+1) - x_n|
        x=y;            % Update solution approximation
        %
        % Increment number of iterations
        NumberOfIterations=NumberOfIterations+1;
    end
    %
    root = x
    NumberOfIterations
    ```
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}   


{{% notice question %}}
1. Repeat the previous question for `$f(x)=x^5+ \frac{x}{1000000}$`.

{{% expand "Expand for hint" %}}
{{% notice hint %}}
Modify the code from the previous answer.
All you need to change is the function definitions.
{{% /notice %}}
{{% /expand %}}  

2. Comment on the convergence speed for Newton–Raphson in this question in comparison with that in the previous question.
    What is the reason for the difference.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
14 bisections are required for the bisection method and 30 iterations are required for Newton–Raphson in this case.  

1. Example code to solve this using the bisection method is given below:

    ```matlab
    clear
    %
    %% The function, interval and tolerance
    theFunction=@(x)x^5+x*1e-6;
    theInterval=[-1,10];
    theTolerance=0.001;
    %
    %% Interval bisection method
    NumberOfBisections=0;   % Initialising
    a=theInterval(1);
    b=theInterval(2);
    %
    while (b-a > theTolerance)
        c=(a+b)*0.5;
        fa=theFunction(a);
        fc=theFunction(c);
        if (fa*fc > 0)
            a=c;
        elseif (fa*fc < 0)
            b=c;
        else
            b=a;
        end
        %
        % Increment number of bisections
        NumberOfBisections=NumberOfBisections+1;
    end
    %
    root = c
    NumberOfBisections
    ```

    Example code to solve this using Newton–Raphson is given below:

    ```matlab
    clear
    %
    %% The function, starting value and tolerance
    theFunction=@(x)x^5+x*1e-6;
    theDerivative=@(x)5*x^4+1e-6;
    theInitialGuess=10;
    theTolerance=0.001;
    %
    %% Newton-Raphson method
    x=theInitialGuess;      % Initialising
    diff=1;                 % Initialising
    NumberOfIterations=0;   % Initialising
    %
    while ( diff >= 0.001 )
        y=x - theFunction(x)/theDerivative(x);
        diff=abs(y-x);  % calculate |x_(n+1) - x_n|
        x=y;            % Update solution approximation
        %
        % Increment number of iterations
        NumberOfIterations=NumberOfIterations+1;
    end
    %
    root = x
    NumberOfIterations
    ```

2. The convergence speed is slower for Newton–Raphson because the derivative of this function is very small in the region of the root.
{{% /notice %}}
{{% /expand %}}

{{% /notice %}}
