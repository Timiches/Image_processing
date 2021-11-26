close all;
clear all;

foto(:,:,1) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS21.bmp'));
foto(:,:,2) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS22.bmp'));
foto(:,:,3) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS23.bmp'));
foto(:,:,4) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS24.bmp'));
foto(:,:,5) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS25.bmp'));
foto(:,:,6) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS26.bmp'));
foto(:,:,7) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS27.bmp'));
foto(:,:,8) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS28.bmp'));
foto(:,:,9) = double(imread('H:\4_1course\MOZKZ\Lab2\V2\RIS20.bmp'));

EpsilonSquare=[];
[imSizeX, imSizeY] = size(foto(:,:,9));

% ========================================================================
% Оценка зашумленности изображений
% sum=[];
% for k=1:8 
%     sum = 0;
%     for i=1:imSizeX
%         for j=1:imSizeY
%             sum = sum+ abs(foto(i,j,k)-foto(i,j,9))^2;
%         end;
%     end;
%     EpsilonSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
%Линейный низких частот (3 разные маски)
% w1 = [1 1 1; 1 1 1; 1 1 1; 9 0 0];
% w2 = [1 1 1; 1 2 1; 1 1 1; 10 0 0];
% w3 = [1 2 1; 2 4 2; 1 2 1; 16 0 0];
% w = w3;
% 
% for k=1:9 
%     mask = 0;
%     sum = 0;
%     foto1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             
%             for i=1:3
%                for j=1:3
%                     mask = mask + foto(m + i-2,n + j-2,k)*w(i,j);
%                 end; 
%             end;
%             mask = mask/w(4,1);
%             foto1(m,n,k) = mask;
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
%Контргармоничный средний фильтр

% p=2;
% ContrHarmNum = 0;
% ContrHarmDenom = 0;
% 
% for k=1:9 
%     sum = 0;
%     
%     foto1(:,:,k) = foto(:,:,k);
%     
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             
%             for i=1:3
%                for j=1:3
%                     ContrHarmNum = ContrHarmNum + foto(m + i-2,n + j-2,k)^(p+1);
%                     ContrHarmDenom = ContrHarmDenom + foto(m + i-2,n + j-2,k)^p;
%                 end; 
%             end;
%             foto1(m,n,k) = ContrHarmNum/ContrHarmDenom;
%             ContrHarmNum = 0;
%             ContrHarmDenom = 0;
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
%усреднительный фильтр

% for k=1:9 
%     mid = 0;
%     sum = 0;
%     foto1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             
%             for i=1:3
%                for j=1:3
%                     mid = mid + foto(m + i-2,n + j-2,k);
%                 end; 
%             end;
%             foto1(m,n,k) = mid/9;
%             mid = 0;
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
% медианный фильтр

% for k=1:9 
%     sum = 0;
%     foto1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             z = 0;
%             med = 0;
%             for i=1:3
%                for j=1:3
%                    z = z + 1;
%                     med(z) = foto(m + i-2,n + j-2,k);
%                 end; 
%             end;
%             foto1(m,n,k) = median (med);
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
% гомоморфный фильтр

% for k=1:9 
%     sum = 0;
%     foto1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             homo = 1;
%             for i=1:3
%                for j=1:3
%                     homo = homo * foto(m + i-2,n + j-2,k);
%                 end; 
%             end;
%             foto1(m,n,k) = homo^(1/9);
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% ========================================================================
% Lp средний фильтр  ???????????????????????????????????????
p = 0.5;

for k=1:9 
    sum = 0;
    foto1(:,:,k) = foto(:,:,k);
    for m=2:imSizeX-1
        for n=2:imSizeY-1
            LP = 0;
            for i=1:3
               for j=1:3
                    LP = LP + (foto(m + i-2,n + j-2,k));
                end; 
            end;
            foto1(m,n,k) = LP^p;
            sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
        end;
    end;
    EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
end;

% ========================================================================
%  Подчеркивание границ
% 1) С помощью ОИХ (СІХ) фильтра (даже работает!)

% w4 = [0 -1 0; -1 5 -1; 0 -1 0];
% w5 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
% w6 = [1 -2 1; -2 5 -2; 1 -2 1];
% w = w5;
% 
% for k=1:9 
% 
%     sum = 0;
%     foto1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             mask = 0;
%             for i=1:3
%                for j=1:3
%                     mask = mask + foto(m + i-2,n + j-2,k)*w(i,j);
%                 end; 
%             end;
%             foto1(m,n,k) = mask;
%             sum = sum + abs(foto1(m,n,k)-foto(m,n,k))^2;
%         end;
%     end;
%     EpsilonZeroSquare(k) = round((1/(imSizeX*imSizeY))*sum, 1);
% end;

% 2) С использованием псевдодифференциальных операторов
% PrevitH1 = [1 0 -1; 1 0 -1; 1 0 -1];
% PrevitH2 = [-1 -1 -1; 0 0 0; 1 1 1];
% 
% SobelaH1 = [ 1 0 -1; 2 0 -2; 1 0 -1];
% SobelaH2 = [-1 -2 -1; 0 0 0; 1 2 1];
% 
% h1 = PrevitH1;
% h2 = PrevitH2;
% 
% for k=1:9 
%     g1(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             mask = 0;
%             for i=1:3
%                for j=1:3
%                     mask = mask + foto(m + i-2,n + j-2,k)*h1(i,j);
%                 end; 
%             end;
%             g1(m,n,k) = mask;
%         end;
%     end;
% end;
% 
% for k=1:9 
%     g2(:,:,k) = foto(:,:,k);
%     for m=2:imSizeX-1
%         for n=2:imSizeY-1
%             mask = 0;
%             for i=1:3
%                for j=1:3
%                     mask = mask + foto(m + i-2,n + j-2,k)*h2(i,j);
%                 end; 
%             end;
%             g2(m,n,k) = mask;
%         end;
%     end;
% end;
% 
% for k=1:9 
%     for m=1:imSizeX
%         for n=1:imSizeY
%             g(m,n,k) = abs(g1(m,n,k)) + abs(g2(m,n,k));
%         end;
%     end;
% end;
% ========================================================================

% double2uint8 (Для адекватного вывода изображения на экран)
for k = 1:9
    foto2(:,:,k) = uint8(foto1(:,:,k));
end;

%вывод изображений
for k = 1:9
    figure(k);
    imshow(foto2(:,:,k));
end;

% n = 0;
% LP=[];
% LPW = 0;
% d = -2;
% for i=1:3
%    for j=1:3
%        n = n+1;
%        LP(n) =(foto(2 + i-2,n + 2-2,1))^d;
%        LPW = LPW + (foto(2 + i-2,n + 2-2,1))^d;
%     end; 
% end;
