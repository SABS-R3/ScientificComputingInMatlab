clear all
close all
N=10;   % The number of intervals to use 
h=6/N;  % the step size
x=linspace(-3,3,N+1);

%% Calculate the exact solutions
y=x.*x.*x.*x;
yprime=4*x.*x.*x;
yprimeprime=12*x.*x;

%% Calculate the approximations
forwarddiff(1) = (y(2)-y(1))/h
for i=2:N
    forwarddiff(i) = (y(i+1)-y(i))/h;
    backwarddiff(i-1) = (y(i)-y(i-1))/(h);
    centraldiff(i-1)=(y(i+1)-y(i-1))/(2*h);
    secondderiv(i-1)=(y(i-1)-2*y(i)+y(i+1))/(h*h);
end
backwarddiff(N) = (y(N+1)-y(N))/h

%% Evaluate the maximum error for each approximation
MaxErrorInForwardDifference=max(abs(yprime(1:N)-forwarddiff))
MaxErrorInBackwardDifference=max(abs(yprime(2:N+1)-backwarddiff))
MaxErrorInCentralDifference=max(abs(yprime(2:N)-centraldiff))
MaxErrorInSecondDerivative=max(abs(yprimeprime(2:N)-secondderiv))

%% Plot the approximations witht the actual derivatives
plot(x,yprime,x(1:N),forwarddiff,x(2:N+1),backwarddiff,x(2:N),centraldiff)
title('First Derivative')
xlabel('x')
ylabel('y')
legend('True','Forward','Back','Central')

figure
plot(x,yprimeprime,x(2:N),secondderiv)
title('Second Derivative')
xlabel('x')
ylabel('y')
legend('True','Approx')
