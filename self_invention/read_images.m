function imgs_array = read_images()
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data');
files = dir('*.jpg');
K = size(files,1);
imgs_array= [];
for i = 1:K
    temp = imread(files(i).name);
    imgs_array(i).img = temp ;
end
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection');
end


