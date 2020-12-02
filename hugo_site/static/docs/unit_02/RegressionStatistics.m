clear 
close all

% Generate the initial straight line data
x=(0:0.05:1)';
y=(1+2*x);

% Calculate the Regression Coefficients for 1000 sets of noise.
n=1000;
for i=1:n
    % Generate N(0,1) random errors and add to the data with
    % a suitably scaled standard deviation
    noise(:,i)=randn(size(y));
    stdnoise=0.1;
    ynoisy(:,i)=y+stdnoise*noise(:,i);

    % Fit a straight line through the noisy data using Polyfit
    p(:,i)=polyfit(x,ynoisy(:,i),1);
end

% Look at the distributions of a and b
b=p(1,:);		% The first row of the matrix p
a=p(2,:);		% The second row of the matrix p

abar=mean(a)		% Calculates the mean
bbar=mean(b)

sda=std(a)		% Calculates the standard deviation
sdb=std(b)

% Plot Histograms of the coefficients
figure(1)
hist(a,30)
figure(2)
hist(b,30)

