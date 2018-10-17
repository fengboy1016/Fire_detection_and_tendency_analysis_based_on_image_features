obj = VideoReader('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\v3.avi');%输入视频位置
numFrames = obj.NumberOfFrames;% 帧的总数
n = 0;
 for k = 1 : 25:obj.NumberOfFrames
     n = n+1;
     frame = read(obj,k);%读取第几帧
    % imshow(frame);%显示帧
      imwrite(frame,strcat('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\original_flame\',num2str(n),'.jpg'),'jpg');% 保存帧
 end