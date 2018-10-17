for i = 1:K
[frost_img,frost_proportion] = frost_detection_change1(imread([original_flame_Path files(i).name]));
imwrite(uint8(frost_img),strcat('.\data\video_material_2\processed_frost_original\',num2str(i),'.jpg'),'jpg');
end

AviFilePath_frost= ['.\data\video_material_2\no_change_processed_frost_10_fps.avi'];
processed_frost_Path=['.\data\video_material_2\processed_frost_original\'];
ImgList = dir(['.\data\video_material_2\processed_frost_original\' '*.jpg']);
AviFileObj = VideoWriter(AviFilePath_frost);
AviFileObj.FrameRate = 10;%fps
open(AviFileObj);
ConvertFrameNum = length(ImgList);
for k = 1 : ConvertFrameNum
	JpegImg = imread([processed_frost_Path ImgList(k).name]);
	writeVideo(AviFileObj, JpegImg);
end
close(AviFileObj);