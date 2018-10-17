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
