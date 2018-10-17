%% 初始化
clc
clear all
close all

%% 读取图片
imgs_array = read_images();
colorflame_img4 = imgs_array(4).img;

%%% 显示原始图片
figure(10);
imshow(colorflame_img4);
title('原始图像');

%% RGB图片->灰度图片(彩色图像灰度化)
Gray_Img = RGBtoGray(colorflame_img4);

%%% 三种方法对比显示
figure(11);
imshow(uint8(Gray_Img.Max_Intensity));
title('最大值法');

figure(12);
imshow(uint8(Gray_Img.Mean_Intensity));
title('平均值法');

figure(13);
imshow(uint8(Gray_Img.Weight_Intensity));
title('加权平均值法');

%% 边缘检测
Extra_Edge = operator5(colorflame_img4) ;

%%% 五种方法对比显示
figure(14);
imshow(Extra_Edge.sobel_edge);
title('边缘提取sobel算子');

figure(15);
imshow(Extra_Edge.prewitt_edge);
title('边缘提取prewitt算子');

figure(16);
imshow(Extra_Edge.roberts_edge);
title('边缘提取roberts算子');

figure(17);
imshow(Extra_Edge.log_edge);
title('边缘提取log算子');

figure(18);
imshow(Extra_Edge.canny_edge);
title('边缘提取canny算子');

%% 火焰检测
flame_image4 = flame_detection(colorflame_img4);
figure(19);
imshow(uint8(flame_image4));
title('火焰模型特征提取');

%% 烟雾检测
[frog_img,gral_img]=frost_detection(colorflame_img4);

figure(20);
imshow(gral_img);
title('灰度图');

figure(21);
imshow(uint8(frog_img));
title('提取的烟雾图');

%% 计算RGB分量分布
RGBPixel_Dis = RGB_distribution();

figure(22);
plot(RGBPixel_Dis.RPixel_Dis);
xlabel('红');
ylabel('分量值');

figure(23);
plot(RGBPixel_Dis.GPixel_Dis);
xlabel('绿');
ylabel('分量值');

figure(24);
plot(RGBPixel_Dis.BPixel_Dis);
xlabel('蓝');
ylabel('分量值');
