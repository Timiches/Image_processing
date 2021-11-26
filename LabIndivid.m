% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% imshow(image_bmp,[0 255])
% 
% betta_y=-0.0180;
% betta_x=0;
% picture_number = 1;
% alpha2=0.0001;
% % T = 1/33;
% % V = 10;
% % a = T*V;
%     
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% SF=fftshift(fft2(f));
% % figure(200),mesh(abs(SF));
% for i=1:5
%     
%     for x=1:500, 
%         for y=1:500,
%             y1=(y-251)*betta_y;
%             if (y1==0) HF(x,y)=1; else HF(x,y)=sin(y1)/y1;end;
%         end;
%     end;
% 
% figure(picture_number),mesh(HF);
% 
% 
% HF2=(abs(HF)).^2;
% HFW=((HF').')./(HF2+alpha2);
% RSF=SF.*HFW;
% rsf=abs(ifft2(ifftshift(RSF)));
% figure(100+ picture_number ),imshow(rsf,[0 255]);
% %max_value=max(max(rsf));
% %figure(10 + picture_number),imshow(rsf/max_value*255,[0 255]);
% 
% if(picture_number == 5)
%     picture_number = 0;
% end;
% picture_number = picture_number + 1;
% betta_y = betta_y - 0.0002;
% %betta_x = betta_x + 0.0001;
% 
% end;
% 
% % for x=1:100, 
% %     for y=1:300, 
% %         y1=(y-151)*betta_y;
% %         if (y1==0) HF(x,y)=1; else HF(x,y)=sin(y1)/y1; end;
% %     end;
% % end;
% % figure(3),mesh(HF);
% % 
% % h=real(ifft2(ifftshift(HF)));
% % figure(4),mesh(fftshift(h));
%  
% % HF2=(abs(HF)).^2;
% % HFW=((HF').')./(HF2+alpha2);
% % RSF=SF.*HFW;
% % rsf=abs(ifft2(ifftshift(RSF)));
% % figure(9),imshow(rsf,[0 255]);


%================================================================
% фильтр виннера

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% k = wiener2(f, [3,3]);
% figure(1),imshow(k,[0 255]);

%================================================================
%медианный фильтр

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% J = medfilt2(f, [7,7]);
% figure(1),imshow(J,[0 255]);

%================================================================
%гаусов фильтр

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% J = imgaussfilt(f, 2);
% figure(1),imshow(J,[0 255]);

%================================================================
%фильтр, повышающего резкость изображения

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% h = fspecial('unsharp', 1);
% J = imfilter(f,h,'replicate');
% figure(1),imshow(J,[0 255]);
%================================================================

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% PrevitH1 = [1 0 -1; 1 0 -1; 1 0 -1];
% PrevitH2 = [-1 -1 -1; 0 0 0; 1 1 1];
% 
% SobelaH1 = [ 1 0 -1; 2 0 -2; 1 0 -1];
% SobelaH2 = [-1 -2 -1; 0 0 0; 1 2 1];
% 
% h1 = PrevitH1;
% h2 = PrevitH2;
% 
% [imSizeX, imSizeY] = size(f);
% 
% g1 = f;
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             mask = 0;
%             for i=1:3
%                for j=1:3
%                     mask = mask + f(m + i-2,n + j-2)*h1(i,j);
%                 end; 
%             end;
%             g1(m,n) = mask;
%         end;
%     end;
%     
%     g2 = f;
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             mask = 0;
%             for i=1:3
%                for j=1:3
%                     mask = mask + f(m + i-2,n + j-2)*h2(i,j);
%                 end; 
%             end;
%             g2(m,n) = mask;
%         end;
%     end;
%     
%     for m=1:imSizeX
%         for n=1:imSizeY
%             foto1(m,n) = abs(g1(m,n)) + abs(g2(m,n));
%         end;
%     end;
%     
%     foto2 = uint8(foto1);
%     figure(1),imshow(foto2,[0 255]);

%================================================================

% close all;
% clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\LabIndivid\MovingCam_500px.bmp'));
% if ndims(image_bmp) == 3
%     image_bmp = rgb2gray(image_bmp);
% end
% 
% f=double(image_bmp);
% figure(100);imshow(f,[0 255]);
% 
% [imSizeX, imSizeY] = size(f);
% w4 = [0 -1 0; -1 5 -1; 0 -1 0];
% w5 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
% w6 = [1 -2 1; -2 5 -2; 1 -2 1];
% w = w5;
% 
% sum = 0;
% foto1 = f;
% for m=2:imSizeX-1
%     for n=2:imSizeY-1
%         mask = 0;
%         for i=1:3
%            for j=1:3
%                 mask = mask + f(m + i-2,n + j-2)*w(i,j);
%             end; 
%         end;
%         foto1(m,n) = mask;
%         sum = sum + abs(foto1(m,n)-f(m,n))^2;
%     end;
% end;
% 
% foto2 = uint8(foto1);
% figure(1),imshow(foto2,[0 255]);
