clear; close all;

dataset1 = load('Data1.txt');
dataset2 = load('Data2.txt');

% plot the data as histograms
subplot(1,2,1); hist(dataset1); title('Data1');
subplot(1,2,2); hist(dataset2); title('Data2');

% calculate the mean and standrd deviation of the data
mean(dataset1)
std(dataset1)

mean(dataset2)
std(dataset2)