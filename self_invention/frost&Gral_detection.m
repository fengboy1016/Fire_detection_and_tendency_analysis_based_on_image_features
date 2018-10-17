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