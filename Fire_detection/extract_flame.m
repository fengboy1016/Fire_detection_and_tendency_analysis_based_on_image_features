obj = VideoReader('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\v3.avi');%������Ƶλ��
numFrames = obj.NumberOfFrames;% ֡������
n = 0;
 for k = 1 : 25:obj.NumberOfFrames
     n = n+1;
     frame = read(obj,k);%��ȡ�ڼ�֡
    % imshow(frame);%��ʾ֡
      imwrite(frame,strcat('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data\video_material_3\original_flame\',num2str(n),'.jpg'),'jpg');% ����֡
 end