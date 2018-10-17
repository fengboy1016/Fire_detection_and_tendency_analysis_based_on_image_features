%% ��ʼ��
clc
clear all
close all

%% ��ȡͼƬ
imgs_array = read_images();
colorflame_img4 = imgs_array(4).img;

%%% ��ʾԭʼͼƬ
figure(10);
imshow(colorflame_img4);
title('ԭʼͼ��');

%% RGBͼƬ->�Ҷ�ͼƬ(��ɫͼ��ҶȻ�)
Gray_Img = RGBtoGray(colorflame_img4);

%%% ���ַ����Ա���ʾ
figure(11);
imshow(uint8(Gray_Img.Max_Intensity));
title('���ֵ��');

figure(12);
imshow(uint8(Gray_Img.Mean_Intensity));
title('ƽ��ֵ��');

figure(13);
imshow(uint8(Gray_Img.Weight_Intensity));
title('��Ȩƽ��ֵ��');

%% ��Ե���
Extra_Edge = operator5(colorflame_img4) ;

%%% ���ַ����Ա���ʾ
figure(14);
imshow(Extra_Edge.sobel_edge);
title('��Ե��ȡsobel����');

figure(15);
imshow(Extra_Edge.prewitt_edge);
title('��Ե��ȡprewitt����');

figure(16);
imshow(Extra_Edge.roberts_edge);
title('��Ե��ȡroberts����');

figure(17);
imshow(Extra_Edge.log_edge);
title('��Ե��ȡlog����');

figure(18);
imshow(Extra_Edge.canny_edge);
title('��Ե��ȡcanny����');

%% ������
flame_image4 = flame_detection(colorflame_img4);
figure(19);
imshow(uint8(flame_image4));
title('����ģ��������ȡ');

%% ������
[frog_img,gral_img]=frost_detection(colorflame_img4);

figure(20);
imshow(gral_img);
title('�Ҷ�ͼ');

figure(21);
imshow(uint8(frog_img));
title('��ȡ������ͼ');

%% ����RGB�����ֲ�
RGBPixel_Dis = RGB_distribution();

figure(22);
plot(RGBPixel_Dis.RPixel_Dis);
xlabel('��');
ylabel('����ֵ');

figure(23);
plot(RGBPixel_Dis.GPixel_Dis);
xlabel('��');
ylabel('����ֵ');

figure(24);
plot(RGBPixel_Dis.BPixel_Dis);
xlabel('��');
ylabel('����ֵ');
