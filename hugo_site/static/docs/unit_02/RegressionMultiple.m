clear 
close all

% Generate the initial straight line data
x=(0:0.05:1)';
y=(1+2*x);

i=1;
for stdnoise=0:0.2:1
    % Generate N(0,1) random errors and add to the data with
    % a suitably scaled standard deviation
    noise=randn(size(y));
    ynoisy(:,i)=y+stdnoise*noise;

    % Fit a straight line through the noisy data using Polyfit
    p(:,i)=polyfit(x,ynoisy(:,i),1);
    z(:,i)=p(1,i)*x+p(2,i);
    i=i+1;
end

plot(x,z);
legend('0.0','0.2','0.4','0.6','0.8','1.0','Location','NorthWest');
hold on
plot(x,ynoisy,'.');
