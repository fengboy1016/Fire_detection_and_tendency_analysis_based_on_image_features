%% 初始化
clc
clear all
close all
%%% 需要改变
%video_source = 'video_material_2';
%video_num = 'v2';
video_source = 'video_try';
video_num = 'v_try';
%%%
video_Path = ['.\data\' video_source '\' video_num '.avi'];
original_flame_Path = ['.\data\' video_source '\original_flame\'];
processed_flame_Path=['.\data\' video_source '\processed_flame\'];
processed_frost_Path=['.\data\' video_source '\processed_frost\'];
AviFilePath_flame= ['.\data\' video_source '\' video_num '_processed_flame_10_fps.avi'];
AviFilePath_frost= ['.\data\' video_source '\' video_num '_processed_frost_10_fps.avi'];

%% 读取视频原始数据
tic;%time_start
obj = VideoReader(video_Path);                     %输入视频位置
numFrames = obj.NumberOfFrames;             % 帧的总数
n = 0;
%%% 需要改变
 for k = 1 : 2:obj.NumberOfFrames               %间隔取帧
     n = n+1;
     frame = read(obj,k);                                    %读取第几帧
     imwrite(frame,strcat(original_flame_Path,num2str(n),'.jpg'),'jpg');% 保存帧
 end
 
%% 读取数据并处理
files = dir([original_flame_Path '*.jpg']);
K = size(files,1);
flame_trend=[];
frost_trend=[];
for i = 1:K
    %%% 火焰提取
    [flame_image,flame_proportion] = flame_detection(imread([original_flame_Path files(i).name]));
    %%% 烟雾提取
    [frost_img,frost_proportion] = frost_detection(imread([original_flame_Path files(i).name]));
    %[frost_img,frost_proportion] = frost_detection_change1(imread([original_flame_Path files(i).name]));
    imwrite(uint8(flame_image),strcat(processed_flame_Path,num2str(i),'.jpg'),'jpg');
    imwrite(uint8(frost_img),strcat(processed_frost_Path,num2str(i),'.jpg'),'jpg');
    flame_trend(i) = flame_proportion;
    frost_trend(i) = frost_proportion;
end

%% 生成视频
%%% 火焰视频
ImgList = dir([processed_flame_Path '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_flame);
%%% 需要改变
AviFileObj.FrameRate = 10;                               %fps
%%%
open(AviFileObj);
ConvertFrameNum = length(ImgList);
for k = 1 : ConvertFrameNum
	JpegImg = imread([processed_flame_Path ImgList(k).name]);
	Mov = im2frame(JpegImg);
	writeVideo(AviFileObj, Mov);
end
close(AviFileObj);

%%% 烟雾视频
ImgList = dir([processed_frost_Path '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_frost);
AviFileObj.FrameRate = 5;%fps
open(AviFileObj);
ConvertFrameNum = length(ImgList);
for k = 1 : ConvertFrameNum
	JpegImg = imread([processed_frost_Path ImgList(k).name]);
	writeVideo(AviFileObj, JpegImg);
end
close(AviFileObj);

%% 生成分析图像
%%% 火焰
figure('NumberTitle', 'off', 'Name', '过火面积变化');
plot(flame_trend);
title('过火面积变化','FontSize',16);
xlabel('time(取帧间隔*总时间长度/总帧数)','FontSize',12) ;ylabel('面积比例','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%%预判火焰趋势
average_flame = mean(flame_trend) ;
forecast_flame = mean(flame_trend(length(flame_trend)-5:length(flame_trend))) ;
if forecast_flame>average_flame
    fprintf('火势有增强趋势\n');
else
    fprintf('火势已经被控制\n');
end

%%% 烟雾
figure('NumberTitle', 'off', 'Name', '烟雾浓度变化');
plot(frost_trend);
title('烟雾浓度变化','FontSize',16);
xlabel('time(取帧间隔*总时间长度/总帧数)','FontSize',12) ;ylabel('面积比例','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%% 预判烟雾趋势
average_frost = mean(frost_trend) ;
forecast_frost = mean(frost_trend(length(frost_trend)-5:length(frost_trend))) ;
if forecast_frost>average_frost
    fprintf('烟雾有变大趋势\n');
else
    fprintf('烟雾被控制\n');
end

%%% 过火面积最大图像-> 火势最大的时候
big_index_flame = find(flame_trend==max(flame_trend)) ;
figure('NumberTitle', 'off', 'Name', '过火面积最大的图像->火势最大的时候');
imshow([original_flame_Path num2str(big_index_flame) '.jpg']);

%%% 烟雾面积最大图像
big_index_frost = find(frost_trend==max(frost_trend)) ;
figure('NumberTitle', 'off', 'Name', '烟雾面积最大的图像');
imshow([original_flame_Path num2str(big_index_frost) '.jpg']);

toc;%time_over
