close all;
clear all;
% image_bmp=imread(strcat('H:\4_1course\MOZKZ\Lab3\lab3_2_2bad.bmp'));
image_bmp=imread(strcat('D:\Telegram download\Image processing and computer vision\Image processing and computer vision\lab3_2\lab3_2_5bad.bmp'));
if ndims(image_bmp) == 3
    image_bmp = rgb2gray(image_bmp);
end

betta_y=0.0125;%параметр сдвига <--- необходимо подобрать его значение 
picture_number = 1;
alpha2=0.0001;



    
f=double(image_bmp);
 figure(100);imshow(f,[0 255]);

SF=fftshift(fft2(f));
figure(200),mesh(abs(SF));

for i=1:10,

    for x=1:100, 
        for y=1:300, 
            y1=(y-151)*betta_y;
            if (y1==0) HF(x,y)=1; else HF(x,y)=sin(y1)/y1; end;
        end;
    end;

figure(picture_number),mesh(HF);


HF2=(abs(HF)).^2;
HFW=((HF').')./(HF2+alpha2);
RSF=SF.*HFW;
rsf=abs(ifft2(ifftshift(RSF)));
figure(100+ picture_number ),imshow(rsf,[0 255]);
max_value=max(max(rsf));


picture_number = picture_number + 1;
betta_y = betta_y + 0.0005;

end;

% for x=1:100, 
%     for y=1:300, 
%         y1=(y-151)*betta_y;
%         if (y1==0) HF(x,y)=1; else HF(x,y)=sin(y1)/y1; end;
%     end;
% end;
% figure(3),mesh(HF);
% 
% h=real(ifft2(ifftshift(HF)));
% figure(4),mesh(fftshift(h));
 
% HF2=(abs(HF)).^2;
% HFW=((HF').')./(HF2+alpha2);
% RSF=SF.*HFW;
% rsf=abs(ifft2(ifftshift(RSF)));
% figure(9),imshow(rsf,[0 255]);