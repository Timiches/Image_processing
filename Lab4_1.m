close all;
clear all;

LPfoto = imread('H:\4_1course\MOZKZ\Lab4\LFotoDARK756x756.png');
RPfoto = imread('H:\4_1course\MOZKZ\Lab4\RFotoDARK756x756.png');

xCoord1 = 494;
yCoord1 = 132;
xCoord2 = 726;
yCoord2 = 386;   
camerasDistance = 100;
cameraAngle = 54;

if ndims(LPfoto) == 3
    LPfotoGray = rgb2gray(LPfoto);
end
if ndims(RPfoto) == 3 
    RPfotoGray= rgb2gray(RPfoto); 
end
[imSizeX, imSizeY] = size(LPfotoGray);
figure, imshow(LPfotoGray),title('LPfotoGray');
figure, imshow(RPfotoGray),title('RPfotoGray');


templateMatcher = vision.TemplateMatcher;
templateMarker = vision.MarkerInserter('Size', 2, 'Fill', true, 'FillColor', 'Black', 'Opacity', 1);
template = LPfotoGray(yCoord1:yCoord2, xCoord1:xCoord2);

loc1 = [idivide(int32(xCoord1 + xCoord2), 2), idivide(int32(yCoord1+ yCoord2), 2)];
loc2 = step(templateMatcher, RPfotoGray, template); % Долго работает!! И походу не правильно...

pixelDistance = abs(loc1(1) - loc2(1));
% pixelDistance = 200;

if loc1(2) ~= loc2(2)
    disp('YBAГA! На  стереозображенні  присутній  вертикальний  зсув.  Підрахунок відстані може бути невірним!')
end
stereo = imfuse(LPfotoGray, RPfotoGray, 'ColorChannels', [1 0 2]);

stereo = step(templateMarker, stereo, loc1); 
stereo = step(templateMarker, stereo, loc2);

figure, imshow(template), title('Шаблон')
figure, imshow(stereo), title('Червоно-блакитний композитний вид стереозображення')

cameraAngle = cameraAngle*pi/180; % перетворення кута в градусах у радіани
estimatedDistance = camerasDistance*imSizeX/(2*tan(cameraAngle/2)*pixelDistance);
errorDistance = estimatedDistance*tan(cameraAngle/double(imSizeX))/camerasDistance;

disp(['PoзpaxoвaHa дистанція(уміліметрах):' num2str(estimatedDistance)]); 
disp(['ПoxибKa розрахунку(уміліметрах):' num2str(errorDistance, 4)]);

l = estimatedDistance * ((xCoord2-xCoord1)/imSizeX);

%====================================================================================================%
close all;
clear all;

LPfoto = imread('H:\4_1course\MOZKZ\Lab4\LFotoAngle756x756.png');
RPfoto = imread('H:\4_1course\MOZKZ\Lab4\RFotoAngle756x756.png');

camerasDistance = 100;
cameraAngle = 54
cameraAngle = cameraAngle*pi/180; % перетворення кута в градусах у радіани;

if ndims(LPfoto) == 3
    LPfotoGray = rgb2gray(LPfoto);
end
if ndims(RPfoto) == 3 
    RPfotoGray= rgb2gray(RPfoto); 
end
[imSizeX, imSizeY] = size(LPfotoGray);
figure, imshow(LPfotoGray),title('LPfotoGray');
figure, imshow(RPfotoGray),title('RPfotoGray');

templateMarker = vision.MarkerInserter('Size', 2, 'Fill', true, 'FillColor', 'Black', 'Opacity', 1);

LlocA = [int32(462), int32(504)];
RlocA = [int32(264), int32(504)];

LlocB = [int32(462), int32(396)];
RlocB = [int32(264), int32(396)];

LlocC = [int32(406), int32(398)];
RlocC = [int32(236), int32(400)];

pixelDistanceA = abs(LlocA(1) - RlocA(1));
pixelDistanceB = abs(LlocB(1) - RlocB(1));
pixelDistanceC = abs(LlocC(1) - RlocC(1));

if LlocA(2) ~= RlocA(2)
    disp('YBAГA! На  стереозображенні  присутній  вертикальний  зсув.  Підрахунок відстані може бути невірним!')
end
stereo = imfuse(LPfotoGray, RPfotoGray, 'ColorChannels', [1 0 2]);

stereo = step(templateMarker, stereo, LlocA); 
stereo = step(templateMarker, stereo, RlocA);
stereo = step(templateMarker, stereo, LlocB); 
stereo = step(templateMarker, stereo, RlocB);
stereo = step(templateMarker, stereo, LlocC); 
stereo = step(templateMarker, stereo, RlocC);

figure, imshow(stereo), title('Червоно-блакитний композитний вид стереозображення')


estimatedDistanceA = camerasDistance*imSizeX/(2*tan(cameraAngle/2)*pixelDistanceA);
estimatedDistanceB = camerasDistance*imSizeX/(2*tan(cameraAngle/2)*pixelDistanceB);
estimatedDistanceC = camerasDistance*imSizeX/(2*tan(cameraAngle/2)*pixelDistanceC);

disp(['PoзpaxoвaHa дистанція A(уміліметрах):' num2str(estimatedDistanceA)]);
disp(['PoзpaxoвaHa дистанція B(уміліметрах):' num2str(estimatedDistanceB)]);
disp(['PoзpaxoвaHa дистанція C(уміліметрах):' num2str(estimatedDistanceC)]);

RAngleOfCB = tan(double(estimatedDistanceC-estimatedDistanceB)/double(RlocC(1)-RlocB(1)))/pi*180;
LAngleOfCB = tan(double(estimatedDistanceC-estimatedDistanceB)/double(LlocC(1)-LlocB(1)))/pi*180;

if RAngleOfCB < 0
    RAngleOfCB = RAngleOfCB + 180;
end;

if LAngleOfCB < 0
    LAngleOfCB = LAngleOfCB + 180;
end;

RAngleOfBA = tan(double(estimatedDistanceA-estimatedDistanceB)/double(RlocA(1)-RlocB(1)))/pi*180;
LAngleOfBA = tan(double(estimatedDistanceA-estimatedDistanceB)/double(LlocA(1)-LlocB(1)))/pi*180;

if RAngleOfBA < 0
    RAngleOfBA = RAngleOfBA + 180;
end;

if LAngleOfBA < 0
    LAngleOfBA = LAngleOfBA + 180;
end;

RAngleOfAC = tan(double(estimatedDistanceA-estimatedDistanceC)/double(RlocA(1)-RlocC(1)))/pi*180;
LAngleOfAC = tan(double(estimatedDistanceA-estimatedDistanceC)/double(LlocA(1)-LlocC(1)))/pi*180;

if RAngleOfAC < 0
    RAngleOfAC = RAngleOfAC + 180;
end;

if LAngleOfAC < 0
    LAngleOfAC = LAngleOfAC + 180;
end;