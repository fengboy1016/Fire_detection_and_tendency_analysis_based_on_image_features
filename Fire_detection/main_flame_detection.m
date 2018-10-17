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
    flame_image = flame_detection(flame_image);
    imwrite(uint8(flame_image),strcat('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\processed_flame\',num2str(i),'.jpg'),'jpg');
end
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection');

%% 识别函数
function flame_image = flame_detection(color_img)
[M,N,~] = size(color_img);
R=color_img( :, :, 1);
G=color_img( :, :, 2);
B=color_img( :, :, 3);
flame_logical = [] ;
for i=1:M
    for j =1:N
        if R(i,j)>G(i,j)&&G(i,j)>B(i,j)&&R(i,j)>150&&G(i,j)<200&&B(i,j)<150
            flame_logical(i,j) = 1;
        else
            flame_logical(i,j) = 0;
        end
    end
end
flame_image = [];
flame_image(:,:,1) = uint8(double(R).*flame_logical);
flame_image(:,:,2) = uint8(double(G).*flame_logical);
flame_image(:,:,3) = uint8(double(B).*flame_logical);
end