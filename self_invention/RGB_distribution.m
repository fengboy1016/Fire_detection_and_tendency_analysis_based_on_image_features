function RGBPixel_Dis = RGB_distribution()
cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection\data');
files = dir('*.jpg');
K = size(files,1);
RPixel_Dis = 0 ;
GPixel_Dis = 0 ;
BPixel_Dis = 0 ;

for i =1:K
    temp=imread(files(i).name);
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

cd('G:\Workspace\Matlab_ws\Signals_and_Systems_Lab_Code\Experiment_3\Fire_detection');

end