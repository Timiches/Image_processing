close all;
clear all;
image_bmp=imread(strcat('H:\4_1course\MOZKZ\Lab3\lab3_02bad_fixed.bmp'));
g=double(image_bmp);
figure(200);imshow(g,[0 255]);
  for x=1:128, 
    for y=1:128, 
      h(x,y)=0; 
      if (x<25)&(y<25)
         h(x,y)=g(x,y);
      end   
    end;
  end;
figure(20),mesh(h);
HF=fftshift(abs(fft2(h)));
HF=HF./max(max(HF));
figure(21),mesh(HF);

% GF=fftshift(fft2(g));  
% FF_inv=GF./HF;
% figure(30),mesh(abs(FF_inv));
% f_inv=real(ifft2(ifftshift(FF_inv)));
% figure(31);imshow(f_inv,[0 255]);
% m = nnz(im2bw(f_inv, 0.5));

H = fspecial('gaussian', 21,1);

alpha2 = 0.1;
pictureNumber = 0;
m=[];
LRANGE = 0.1;

for i = 1:9
    if i==9
        alpha2 = 0;
    end;
    
    J = deconvreg(g,H,[],LRANGE*alpha2);
    
%     GF=fftshift(fft2(g));
%     HF2=abs(HF'.*HF);
%     HFW=HF'./(HF2+alpha2);
    pictureNumber = pictureNumber+1;
%     FF_pseudoinv=GF.*HFW;
%     figure(100+pictureNumber),mesh(abs(FF_pseudoinv));
%     f_pseudoinv=abs(real(ifft2(ifftshift(FF_pseudoinv))));
    
    figure(pictureNumber);
    m(i) = nnz(im2bw(J, 1));
    imshow(J,[0 255]);
    alpha2 = alpha2/10;

end;