function Extra_Edge = operator5(color_img)
Gral_Img = rgb2gray(color_img);
Extra_Edge.sobel_edge = edge(Gral_Img, 'sobel');
Extra_Edge.prewitt_edge = edge(Gral_Img, 'prewitt');
Extra_Edge.roberts_edge = edge(Gral_Img, 'roberts');
Extra_Edge.log_edge = edge(Gral_Img, 'log');
Extra_Edge.canny_edge = edge(Gral_Img, 'canny');
end
