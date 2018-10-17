%% 初始化
clc
clear all
close all

%% 处理
JpegFilesDirPath = 'G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_1\processed_frost\';
ImgList = dir([JpegFilesDirPath '*.jpg']);
AviFilePath= 'G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_1\v1_processed_frost_5_fps.avi';
AviFileObj = VideoWriter(AviFilePath);
AviFileObj.FrameRate = 5;%fps
open(AviFileObj);
ConvertFrameNum = length(ImgList);
tic;%time
for k = 1 : ConvertFrameNum
	JpegImg = imread([JpegFilesDirPath ImgList(k).name]);
	%Mov = im2frame(JpegImg);
	writeVideo(AviFileObj, JpegImg);
end;
toc;
close(AviFileObj);
