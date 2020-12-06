---
title: "Exercises 4"
date: 2020-11-18T16:52:22Z
draft: false
pre: "9. "
---

{{% notice question %}}
Verify analytically that the Fourier series of a square wave defined as  

`$$f(x) = \left\{
\begin{array}{ll}
-k & \textrm{if}\quad -\pi<x<0\,, \\
k & \textrm{if}\quad 0<x<\pi\,,
\end{array}
\right.
 $$` 
and  
`$$ f(x+2\pi) = f(x)$$`  
is  
`$$\frac{4k}{\pi}\left( \sin{x} + \frac{1}{3}\sin{3x} + \frac{1}{5}\sin{5x} + \ldots \right) $$`.

{{% expand "Expand for soluton" %}}
{{% notice solution %}}
`$$a_0 = \frac{-1}{\pi}\int_{-\pi}^0 k\,dx + \frac{1}{\pi}\int_0^{\pi} k\,dx = 0 $$`  
`$$a_n = \frac{-1}{\pi}\int_{-\pi}^0 k\cos{nx}\,dx + \frac{1}{\pi}\int_0^{\pi} k\cos{nx}\,dx = 0\, , \quad \textrm{for} \quad n=1,2,\ldots $$`  
and    
`$$b_n = \frac{-1}{\pi}\int_{-\pi}^0 k\sin{nx}\,dx + \frac{1}{\pi}\int_0^{\pi} k\sin{nx}\,dx = \frac{4k}{n\pi}\,, \quad \textrm{for} \quad n=1,3,5,\ldots $$`  
and  
`$$ b_n = 0 \quad \textrm{for} \quad n = 2,4,6,\ldots$$`
{{% /notice %}}
{{% /expand %}}
{{% /notice %}}  


{{% notice question %}}
1. Write MATLAB code to sum the first components of the series calculated in the question above, for increasing values of `$N$`, to see how the series converges.  

2.  The lack of convergence at the discontinuities is known as Gibbs’s phenomenon, and the mathematical explanation dates back to the beginning of the twentieth century. Quantify Gibbs’s phenomenon and give a mathematical explanation for it. (There’s a good one on Wikipedia.)  

{{% expand "Expand for solution" %}}
{{% notice question %}}
The following code will sum this series and plot the sum for `$N=0,1,5,100$`.  

```matlab
% Plot the sum of the first N components of the Fourier series.
clear
close all
%
N=100; % Number of terms to include in series
k=1;   % Parameter for f
%
x=linspace(-pi,pi,1000);
y=zeros(N+1,length(x)); % initialise the series
%
y(1,:)=4*k/pi*sin(x); % first term
% Add on terms in the series
for n=2:N
    y(n,:)=y(n-1,:)+4*k/(2*n-1)/pi*sin((2*n-1)*x);
end
%
plot(x,y(1,:),x,y(5,:),x,y(10,:),x,y(100,:));
legend('N=1','N=5','N=10','N=100','location','NorthWest')
```  

The code yields the following plot  

![TODO REPLACE ME](/ScientificComputingInMatlab/images/1_5_doc_fft.png?classes=matlab-screenshot)  

which shows the convergence of the series to the square wave function `$f(x)$`.  

2. The magnitude of the error of the Fourier series solution (the overshooting near the discontinuity) is the same as `$N\to\infty$`, but the width of the overshoot does tend to zero as `$N\to\infty$`. You can see this from the above figure.  
{{% /notice %}}
{{% /expand %}}

{{% /notice %}}
