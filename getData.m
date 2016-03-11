function [ Height, Width, Depth,x, y,z, Centroid,Time, DepthWidth,Volym, AccelerationX,AccelerationY,AccelerationZ,AccelerationXYZ, AccelerationH  ] = getData( NM )
%GETHEIGHT Summary of this function goes here
%   Detailed explanation goes here
nrows2 = size(NM,1);
Height = NM(1:nrows2,6); % huvudetshöjd
Width = NM(1:nrows2,4) - NM(1:nrows2,3); %bredden
Depth =   NM(1:nrows2,2)- NM(1:nrows2,1);
x = NM(1:nrows2,3) + (NM(1:nrows2,4) - NM(1:nrows2,3))/2;  % Tar ut x kordinaten i rummet av snittet
y = NM(1:nrows2,6) /2;					% Tar ut y kordinat av snittet
z = NM(1:nrows2,1) + (NM(1:nrows2,2) - NM(1:nrows2,1))/2; % Tar ut z kordinat av snittet
Time = NM(1:nrows2, 8); %tiden


for i= 1 :nrows2;
DepthWidth(i,1) = sqrt(Depth(i)*Depth(i) + Width(i)*Width(i));
end;




for i = 1:nrows2;
Volym(i,1) = Depth(i,1)*Width(i,1)*Height(i,1)/1000;
end;

for i=1 : nrows2;
Centroid(i,1) = sqrt(x(i)*x(i)+y(i)*y(i)+z(i)*z(i)); % Avstånd från centroid till origo
end;


for i=2 :nrows2;
	AccelerationX(i,1) = (x(i)-x(i -1))/Time(i); % x genom delta tid
	AccelerationY(i,1) =(y(i)-y(i -1))/Time(i); % y genom delta tid
	AccelerationZ(i,1) = (z(i)-z(i -1))/Time(i); % z genom delta tid
	AccelerationXYZ(i,1) = (Centroid(i)-Centroid(i -1))/Time(i); % totala genom delta tid
	AccelerationH(i,1) = (Height(i)-Height(i-1))/Time(i); % höjden genom delta tid
end;

end

