%% 初始化
clc
clear all
close all

%% 读取并处理
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\original_flame');
files = dir('*.jpg');
K = size(files,1);
imgs_array_self= [];
for i = 1:K
    flame_image = flame_detection(imread(files(i).name));
    [frog_img,gral_img]=frost_detection(imread(files(i).name));
    imwrite(uint8(frog_img),strcat('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\processed_frost\',num2str(i),'.jpg'),'jpg');
end
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection');

%% 函数
function [frog_img,Gral_pic] = frost_detection(color_img)
N=2;
Gral_pic =rgb2gray(color_img);
[row,col]=size(Gral_pic);

h= imhist(Gral_pic)/row/col;
Pa = cumsum(h);
temp1=abs(Pa-1/N);
temp2=abs(1-Pa-1/N);
temp=temp1+temp2;
[~,under_value]=min(temp);
seg_img = ~(Gral_pic>under_value);
frog_img = double(Gral_pic).*seg_img;
end