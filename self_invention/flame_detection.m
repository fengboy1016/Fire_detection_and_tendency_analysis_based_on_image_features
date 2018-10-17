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