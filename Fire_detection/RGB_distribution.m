%% 计算RGB分量分布
RGBPixel_Dis = RGB_distribution_();

figure(1);
plot(RGBPixel_Dis.RPixel_Dis);
title('R分量分布','FontSize',16);
axis([0,255,0,80000]);
xlabel('Red');
ylabel('Component-Value');
grid on

figure(2);
plot(RGBPixel_Dis.GPixel_Dis);
title('G分量分布','FontSize',16);
axis([0,255,0,50000]);
xlabel('Green');
ylabel('Component-Value');
grid on

figure(3);
plot(RGBPixel_Dis.BPixel_Dis);
title('B分量分布','FontSize',16);
axis([0,255,0,300000]);
xlabel('Blue');
ylabel('Component-Value');
grid on

%% 函数
function RGBPixel_Dis = RGB_distribution_()
flame_picture_Path='.\data\picture\';
files = dir([flame_picture_Path '*.jpg']);
K = size(files,1);
RPixel_Dis = 0 ;
GPixel_Dis = 0 ;
BPixel_Dis = 0 ;

for i =1:K
    temp=imread([flame_picture_Path files(i).name]);
    R=temp(:,:,1);
    G=temp(:,:,2);
    B=temp(:,:,3);
    [counts,x] = imhist(R);
    RPixel_Dis = RPixel_Dis + counts ;
    [counts,x] = imhist(G);
    GPixel_Dis = GPixel_Dis + counts;
    [counts,x] = imhist(B);
    BPixel_Dis = BPixel_Dis + counts;
end

RGBPixel_Dis.RPixel_Dis = RPixel_Dis;
RGBPixel_Dis.GPixel_Dis = GPixel_Dis;
RGBPixel_Dis.BPixel_Dis = BPixel_Dis ;

end