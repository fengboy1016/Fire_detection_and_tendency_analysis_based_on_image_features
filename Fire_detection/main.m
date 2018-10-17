%% ��ʼ��
clc
clear all
close all
%%% ��Ҫ�ı�
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

%% ��ȡ��Ƶԭʼ����
tic;%time_start
obj = VideoReader(video_Path);                     %������Ƶλ��
numFrames = obj.NumberOfFrames;             % ֡������
n = 0;
%%% ��Ҫ�ı�
 for k = 1 : 2:obj.NumberOfFrames               %���ȡ֡
     n = n+1;
     frame = read(obj,k);                                    %��ȡ�ڼ�֡
     imwrite(frame,strcat(original_flame_Path,num2str(n),'.jpg'),'jpg');% ����֡
 end
 
%% ��ȡ���ݲ�����
files = dir([original_flame_Path '*.jpg']);
K = size(files,1);
flame_trend=[];
frost_trend=[];
for i = 1:K
    %%% ������ȡ
    [flame_image,flame_proportion] = flame_detection(imread([original_flame_Path files(i).name]));
    %%% ������ȡ
    [frost_img,frost_proportion] = frost_detection(imread([original_flame_Path files(i).name]));
    %[frost_img,frost_proportion] = frost_detection_change1(imread([original_flame_Path files(i).name]));
    imwrite(uint8(flame_image),strcat(processed_flame_Path,num2str(i),'.jpg'),'jpg');
    imwrite(uint8(frost_img),strcat(processed_frost_Path,num2str(i),'.jpg'),'jpg');
    flame_trend(i) = flame_proportion;
    frost_trend(i) = frost_proportion;
end

%% ������Ƶ
%%% ������Ƶ
ImgList = dir([processed_flame_Path '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_flame);
%%% ��Ҫ�ı�
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

%%% ������Ƶ
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

%% ���ɷ���ͼ��
%%% ����
figure('NumberTitle', 'off', 'Name', '��������仯');
plot(flame_trend);
title('��������仯','FontSize',16);
xlabel('time(ȡ֡���*��ʱ�䳤��/��֡��)','FontSize',12) ;ylabel('�������','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%%Ԥ�л�������
average_flame = mean(flame_trend) ;
forecast_flame = mean(flame_trend(length(flame_trend)-5:length(flame_trend))) ;
if forecast_flame>average_flame
    fprintf('��������ǿ����\n');
else
    fprintf('�����Ѿ�������\n');
end

%%% ����
figure('NumberTitle', 'off', 'Name', '����Ũ�ȱ仯');
plot(frost_trend);
title('����Ũ�ȱ仯','FontSize',16);
xlabel('time(ȡ֡���*��ʱ�䳤��/��֡��)','FontSize',12) ;ylabel('�������','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%% Ԥ����������
average_frost = mean(frost_trend) ;
forecast_frost = mean(frost_trend(length(frost_trend)-5:length(frost_trend))) ;
if forecast_frost>average_frost
    fprintf('�����б������\n');
else
    fprintf('��������\n');
end

%%% ����������ͼ��-> ��������ʱ��
big_index_flame = find(flame_trend==max(flame_trend)) ;
figure('NumberTitle', 'off', 'Name', '�����������ͼ��->��������ʱ��');
imshow([original_flame_Path num2str(big_index_flame) '.jpg']);

%%% ����������ͼ��
big_index_frost = find(frost_trend==max(frost_trend)) ;
figure('NumberTitle', 'off', 'Name', '�����������ͼ��');
imshow([original_flame_Path num2str(big_index_frost) '.jpg']);

toc;%time_over
