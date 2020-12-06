---
title: "Exercises 2"
date: 2020-11-22T16:52:22Z
draft: false
pre: "5. "
---


This set of exercises is designed to give you familiarity with numerical integration. Hints and solutions are available. 

{{% notice question %}}
Evaluate `$\int_{-1}^{1} x^4 \,dx$` using:  

1. the Trapezium rule with 10 equal-sized intervals,  

2. Simpson’s rule with 10 equal-sized intervals.  

In each case, how many uniformly sized intervals do you need for the absolute error in the answer to be less than 0.0001?

{{% expand "Expand for solution" %}}
{{% notice solution %}}
The following code calculates the Trapezium rule and Simpson’s rule approximations for `$N=10$`.

```matlab
clear all
%
N=10;               % Number of intervals
h=2/N;              % The size of each interval
x=linspace(-1,1,N+1);
y=x.*x.*x.*x;       % Defining the function
%
% Firstly we apply the Trapezium rule:
%
TrapeziumIntegral=0.5*y(1); % Initialising 0.5*y0
%
% We now loop over the elements y1…yN
for i=2:N
 TrapeziumIntegral=TrapeziumIntegral+y(i);
end
%
% Lastly, we need to add 0.5*yN (which corresponds to the (N+1)th
% entry of the vector y) and multiply by the interval size, h
%
TrapeziumIntegral=TrapeziumIntegral+0.5*y(N+1);
TrapeziumIntegral=TrapeziumIntegral*h
%
% Now we apply Simpson’s rule:
%
SimpsonIntegral=y(1);       % Initialise
%
for i=1:N/2
 SimpsonIntegral=SimpsonIntegral+4*y(2*i);
end
%
for i=1:N/2-1
 SimpsonIntegral=SimpsonIntegral+2*y(2*i+1);
end
%
% Lastly, we add the last value and multiply by h/3
SimpsonIntegral=SimpsonIntegral+y(N+1);
SimpsonIntegral=SimpsonIntegral*h/3
```  

The true answer is `$\left[ \frac{x^5}{5} \right]_{-1}^{1} = 0.4$`.  

To get the answer within 0.0001 of the true value, we require `$N=164$` for the Trapezium rule and `$N=16%` for Simpson’s rule. MATLAB code to calculate the `$N$` required to get the integral to the required accuracy is given below.

```matlab
clear all
format long
%
% Now look for required N for Trapezium rule
%
TargetError=0.0001;
TrapeziumError=1; % initialise error
Ntrap=10; % initial Ntrap
ExactIntegral = 0.4;
%
while (TrapeziumError>TargetError)
    Ntrap=Ntrap+1;                  % Number of intervals
    h=2/Ntrap;              % The size of each interval
    x=linspace(-1,1,Ntrap+1);
    y=x.*x.*x.*x;           % Defining the function
    %
    % Now we apply the Trapezium rule:
    TrapeziumIntegral=0.5*y(1); % Initialising 0.5*y0
    %
    % We now loop over the elements y1…yN
    for i=2:Ntrap
        TrapeziumIntegral=TrapeziumIntegral+y(i);
    end
    %
    % Lastly, we need to add 0.5*yN (which corresponds to the (N+1)th
    % entry of the vector y) and multiply by the interval size, h
    %
    TrapeziumIntegral=TrapeziumIntegral+0.5*y(Ntrap+1);
    TrapeziumIntegral=TrapeziumIntegral*h;
    %
    TrapeziumError = abs(TrapeziumIntegral-ExactIntegral);
end
%
Ntrap
TrapeziumError
%
% Now look for required N for Simpson’s rule
%
TargetError=0.0001;
SimpsonError=1; % initialise error
Nsimp=10; % initial Nsimp
ExactIntegral = 0.4;
%
while (SimpsonError>TargetError)
    Nsimp=Nsimp+2;              % Number of intervals so even
    h=2/Nsimp;              % The size of each interval
    x=linspace(-1,1,Nsimp+1);
    y=x.*x.*x.*x;           % Defining the function
    %
    % Now we apply Simpson’s rule:
    SimpsonIntegral=y(1);       % Initialise
    %
    for i=1:Nsimp/2
        SimpsonIntegral=SimpsonIntegral+4*y(2*i);
    end
    %
    for i=1:Nsimp/2-1
        SimpsonIntegral=SimpsonIntegral+2*y(2*i+1);
    end
    %
    % Lastly, we add the last value and multiply by h/3
    SimpsonIntegral=SimpsonIntegral+y(Nsimp+1);
    SimpsonIntegral=SimpsonIntegral*h/3;
    %
    SimpsonError = abs(SimpsonIntegral-ExactIntegral);
end
%
Nsimp
SimpsonError
```

{{% /notice %}}
{{% /expand %}}
{{% /notice %}}


{{% notice question %}}
1. Repeat the previous question for `$\int_0^1 \left( e^{-1000x}+x \right) \,dx$`  

2. Can you suggest a more sensible way to choose the discrete points instead of using uniformly spaced points?

{{% expand "Expand for solution" %}}
{{% notice solution %}}
1. The true answer is `$\left[ \frac{-e^{-1000x}}{1000} + \frac{x^2}{2}\right]_0^1 = \frac{1-e^{-1000}}{1000} + \frac{1}{2} \approx 0.501$`.  

To get an answer within 0.0001 of true value, we require `$N=904$` for the Trapezium rule and `$N=426$` for Simpson’s rule. The MATLAB code for Problem 3 can be modified for this question and is given below.

```matlab
clear all
format long
% Now look for required N for Trapezium rule
%
TargetError=0.0001;
TrapeziumError=1; % initialise error
Ntrap=10; % initial Ntrap
ExactIntegral = (1-exp(-1000))/1000+1/2;
%
while (TrapeziumError>TargetError)
    Ntrap=Ntrap+1;                  % Number of intervals
    h=1/Ntrap;              % The size of each interval
    x=linspace(0,1,Ntrap+1);
    y=exp(-1000*x)+x;           % Defining the function
    %
    % Now we apply the Trapezium rule:
    TrapeziumIntegral=0.5*y(1); % Initialising 0.5*y0
    %
    % We now loop over the elements y1…yN
    for i=2:Ntrap
        TrapeziumIntegral=TrapeziumIntegral+y(i);
    end
    %
    % Lastly, we need to add 0.5*yN (which corresponds to the (N+1)th
    % entry of the vector y) and multiply by the interval size, h
    %
    TrapeziumIntegral=TrapeziumIntegral+0.5*y(Ntrap+1);
    TrapeziumIntegral=TrapeziumIntegral*h;
    %
    TrapeziumError = abs(TrapeziumIntegral-ExactIntegral);
end
%
Ntrap
TrapeziumError
%
% Now look for required N for Simpson’s rule
%
TargetError=0.0001;
SimpsonError=1; % initialise error
Nsimp=10; % initial Nsimp
ExactIntegral = (1-exp(-1000))/1000+1/2;
%
while (SimpsonError>TargetError)
    Nsimp=Nsimp+2;              % Number of intervals so even
    h=1/Nsimp;              % The size of each interval
    x=linspace(0,1,Nsimp+1);
    y=exp(-1000*x)+x;           % Defining the function
    %
    % Now we apply Simpson’s rule:
    SimpsonIntegral=y(1);       % Initialise
    %
    for i=1:Nsimp/2
        SimpsonIntegral=SimpsonIntegral+4*y(2*i);
    end
    %
    for i=1:Nsimp/2-1
        SimpsonIntegral=SimpsonIntegral+2*y(2*i+1);
    end
    %
    % Lastly, we add the last value and multiply by h/3
    SimpsonIntegral=SimpsonIntegral+y(Nsimp+1);
    SimpsonIntegral=SimpsonIntegral*h/3;
    %
    SimpsonError = abs(SimpsonIntegral-ExactIntegral);
end
%
Nsimp
SimpsonError
```

2. In order to improve accuracy, a non-uniform distribution of `$x_i$`’s with a higher density close to the origin could be used.
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}

