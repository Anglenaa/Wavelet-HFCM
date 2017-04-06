% generate multi scale waves
clear all
clc
%% experimental data set
% dataset 1: enrollment
% enrollment = [13055, 13563, 13867, 14696, 15460, 15311, 15603, 15861, 16807, 16919, 16388, 15433, 15497, 15145, 15163, 15984, 16859, 18150, 18970, 19328, 19337, 18876]';
% dataset = enrollment;
pkg load io
% % dataset 2: TAIEX(need 85 % of data as train data
[NUM,TXT,RAW] = xlsread('2000_TAIEX.xlsx', 'clean_v1_2000');
dataset = NUM(1:end);

dataset = (dataset - max(dataset)) ./ (max(dataset) - min(dataset));
% dataset 3: sunspot
% dataset = importdata('sunspot.csv', ';');
% data = dataset(:, 2);
%dataset = data();
% dataset 4: Mackey-Glass chaos time series
% use fourth Runge-Kutta algorithm to create MG chaotic time series
% load mgdata.dat
%load MG_chaos
% dataset = mgdata(:, 2);
% dataset = dataset(124: 1123);
% synsitic data
% dataset = sin(1:100)';
% for i = 1 : length(dataset)
%     if dataset(i) ~= 0
%         dataset(i) = log(dataset(i));
%     end
% end
%dataset = dataset(1:1024);
pkg load ltfat
max_level = floor(log2(length(dataset)));
J = max_level;  % level 5
multi_data = ufwt(dataset, 'db1', J)';
hold on
for i = 1: 3
		plot(multi_data(i, :))
end
save -6 multi_data.mat multi_data dataset
