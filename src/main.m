%%%���������Ƶ
[filename,pathname]=uigetfile('.avi','Choose the test file');
during_the_analysis;
mkdir(pathname,'original_flame');
mkdir(pathname,'processed_flame');
mkdir(pathname,'processed_frost_original');
mkdir(pathname,'var');
mkdir(pathname,'tendency');
video_Path = [pathname filename];
original_flame_Path = [pathname 'original_flame\'];
processed_flame_Path=[pathname 'processed_flame\'];
processed_frost_Path=[pathname 'processed_frost_original\'];
AviFilePath_flame= [pathname 'processed_flame.avi'];
AviFilePath_frost= [pathname 'processed_frost.avi'];
%% ��ȡ��Ƶԭʼ����
% tic;%time_start
obj = VideoReader(video_Path);                     %������Ƶλ��
numFrames = obj.NumberOfFrames;                    % ֡������
%%% ��Ҫ�ı�
 for k = 1 : 1:obj.NumberOfFrames               %���ȡ֡,�˴�����ԭʼ֡������֡����
     frame = read(obj,k);                                    %��ȡ�ڼ�֡
     imwrite(frame,strcat(original_flame_Path,num2str(k),'.jpg'),'jpg');% ����֡
 end

 %% ��ȡ���ݲ�����
files = dir([original_flame_Path '*.jpg']);
K = size(files,1);
csvwrite('../var/frame_number.txt',K);
flame_trend=zeros(1,K);
frost_trend=zeros(1,K);
for i = 1:K
    var=imread([original_flame_Path files(i).name]);
    %%% ������ȡ
    [flame_image,flame_proportion] = flame_detection(var);
    imwrite(uint8(flame_image),strcat(processed_flame_Path,num2str(i),'.jpg'),'jpg');
    %%% ������ȡ
    [frost_img,frost_proportion] = frost_detection(var);
    imwrite(uint8(frost_img),strcat(processed_frost_Path,num2str(i),'.jpg'),'jpg');
    
    flame_trend(i) = flame_proportion;
    frost_trend(i) = frost_proportion;
end

%% ������Ƶ
%%% ������Ƶ
ImgList = dir([processed_flame_Path '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_flame);
%%% ��Ҫ�ı�
AviFileObj.FrameRate = 24; %fps
%%%
open(AviFileObj);
ConvertFrameNum = length(ImgList);
for i = 1 : ConvertFrameNum
	JpegImg = imread([processed_flame_Path ImgList(i).name]);
	Mov = im2frame(JpegImg);
	writeVideo(AviFileObj, Mov);
end
close(AviFileObj);

%%% ������Ƶ
ImgList = dir([processed_frost_Path '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_frost);
%%% ��Ҫ�ı�
AviFileObj.FrameRate = 24; %fps
open(AviFileObj);
ConvertFrameNum = length(ImgList);
for i = 1 : ConvertFrameNum
	JpegImg = imread([processed_frost_Path ImgList(i).name]);
	writeVideo(AviFileObj, JpegImg);
end
close(AviFileObj);

%% ���ɷ���ͼ��
%%% ����
axes(handles.flame_tendency);
plot(flame_trend);
title('��������仯','FontSize',12);
xlabel('time(ȡ֡���*��ʱ�䳤��/��֡��)','FontSize',12) ;ylabel('�������','FontSize',12);
%saveas(gcf,'../tendency/flame_tendency.jpg');
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%% ����
axes(handles.frost_tendency);
plot(frost_trend);
title('����Ũ�ȱ仯','FontSize',12);
xlabel('time(ȡ֡���*��ʱ�䳤��/��֡��)','FontSize',12) ;ylabel('�������','FontSize',12);
%saveas(gcf,'../tendency/frost_tendency.jpg');
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%%%Ԥ�л�������
csvwrite('../var/flame.txt',flame_trend);

%%% Ԥ����������
csvwrite('../var/frost.txt',frost_trend);

% toc;%time_over

%% �Զ��庯��
%%%flame_detection
function [flame_image,flame_proportion] = flame_detection(color_img)
[M,N,~] = size(color_img);
R=color_img( :, :, 1);
G=color_img( :, :, 2);
B=color_img( :, :, 3);
flame_logical = [] ;
sum = 0;
for i=1:M
    for j =1:N
        if R(i,j)>G(i,j)&&G(i,j)>B(i,j)&&R(i,j)>150&&G(i,j)<200&&B(i,j)<150
            flame_logical(i,j) = 1;
            sum = sum + 1 ;
        else
            flame_logical(i,j) = 0;
        end
    end
end
flame_proportion = sum/(M*N);
flame_image = [];
flame_image(:,:,1) = uint8(double(R).*flame_logical);
flame_image(:,:,2) = uint8(double(G).*flame_logical);
flame_image(:,:,3) = uint8(double(B).*flame_logical);
end

%%% frost_detection
function [frost_img,frost_proportion] = frost_detection(color_img)
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
frost_img = double(Gral_pic).*seg_img;
[M,N]=size(frost_img);
sum = 0;
for i=1:M
    for j =1:N
        if frost_img(i,j)<=1
            sum = sum + 1 ;
        else
            frost_img(i,j) = 255;
        end
    end
end
frost_proportion = sum/(M*N);
end
