---
title: "Exercises 3"
date: 2020-11-20T16:52:22Z
draft: false
pre: "7. "
---


{{% notice question %}}
Let `$f(x) = x^3 - 1 $`.  

1. Use the bisection method on the interval `$[−1,10]$` to calculate the root of `$f(x)=0$` correct to two decimal places. How many bisections were necessary?  

2. Use Newton–Raphson with `$x_0=10$` to calculate the root of `$f(x)=0$` correct to two decimal places. How many iterations were necessary?  

{{% expand "Expand for solution" %}}
{{% notice solution %}}
1. 14 bisections are required for interval bisection.  

```matlab
clear all
%
% Interval bisection method
% Firstly define the ends of the interval [-1,10]
a=-1;
b=10;
NumberOfBisections=0;   % Initialising
%
while (b-a > 0.001) % Want root correct to 2 decimal places
    c=(a+b)*0.5;
    f0=a^3-1; % function evaluated at a
    f1=c^3-1; % function evaluated at c
    f2=b^3-1; % function evaluated at b
    if (f0*f1 > 0)
        a=c;
    elseif (f0*f1 < 0)
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

2. 9 iterations are required for Newton–Raphson. Example code to solve this is given below.  

```matlab
clear all
%
% Newton-Raphson method
%
x=10;       % Approximation to solution, x0
diff=1;                 % Initialising
NumberOfIterations=0;   % Initialising
%
while ( diff >= 0.001 )
    y=x-(x^3-1)/(3*x*x);
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
Modify the code from the previous answer. All you need to change is the function definitions.
{{% /notice %}}
{{% /expand %}}  

2. Comment on the convergence speed for Newton–Raphson in this question in comparison with that in the previous question. What is the reason for the difference.

{{% expand "Expand for solution" %}}
{{% notice solution %}}
14 bisections are required for the bisection method and 23 iterations are required for Newton–Raphson in this case.  

1. Example code to solve this using the bisection method is given below.  

```matlab
clear all
%
% Interval bisection method
% Firstly define the ends of the interval [-1,10]
a=-1;
b=10;
NumberOfBisections=0;   % Initialising
%
while (b-a > 0.001) % Want root correct to 2 decimal places
    c=(a+b)*0.5;
    f0=a^3-1; % function evaluated at a
    f1=c^3-1; % function evaluated at c
    f2=b^3-1; % function evaluated at b
    if (f0*f1 > 0)
        a=c;
    elseif (f0*f1 < 0)
        b=c;
    else
        b=a;
    %
    end
    %
    % Increment number of bisections
    NumberOfBisections=NumberOfBisections+1;
end
%
root = c
NumberOfBisections
```  

Example code to solve this using Newton–Raphson is given below.  

```matlab
clear all
%
% Newton-Raphson method
%
x=10;       % Approximation to solution, x0
diff=1;                 % Initialising
NumberOfIterations=0;   % Initialising
%
while ( diff >= 0.001 )
    y=x-(x^5-x/1000000)/((4*x^4)+1/1000000);
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

2. The convergence speed is slower because the derivative of this function is very small in the region of the root.
{{% /notice %}}
{{% /expand %}}

{{% /notice %}}
