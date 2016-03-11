

M = dlmread('test4.txt');
nrows = size(M,1);
j = 1;
last =1;
NM = [];
for  i = 1:nrows;
	if M(i,2:6);
		A = M(i,1);
		B = M(i,2);
		C = M(i,3);
		D = M(i,4);
		E = M(i,5);
		F = M(i,6);
		NM(j,1) =A;
		NM(j,2) =B;
		NM(j,3) =C;
		NM(j,4) =D;
		NM(j,5) =E;
		NM(j,6) =F;
		j= j+1;
		
	else ;
		while last-j ~= 0; 
			M(i,1);
			NM(last,7) = M(i,1);
			if last == 1;
				NM(last,8)= 0;
			else;
				NM(last,8) = NM(last,7) + NM(last-1,8);
			end;
			last = last +1;
		end;
	end; 
	
	
end;
nrows2 = size(NM,1);

x = NM(1:nrows2,3) + (NM(1:nrows2,4) - NM(1:nrows2,3))/2;  % Tar ut x kordinaten i rummet av snittet
y = NM(1:nrows2,6) /2;					% Tar ut y kordinat av snittet
z = NM(1:nrows2,1) + (NM(1:nrows2,2) - NM(1:nrows2,1))/2; % Tar ut z kordinat av snittet
Centroid = horzcat(x,y,z);			% Kobinera i hop x,y,z i en matris

Height = [];
Volym = [];
Time =[];
Width =[] ;
Depth=[];
DepthWidth =[];
Height = NM(1:nrows2,6); % huvudetshöjd
Width = NM(1:nrows2,4) - NM(1:nrows2,3); %bredden
Time = NM(1:nrows2, 8); %tiden
Depth =   NM(1:nrows2,2)- NM(1:nrows2,1);

for i= 1 :nrows2;
DepthWidth(i,1) = sqrt(Depth(i)*Depth(i) + Width(i)*Width(i));
end;

HeightDepthWidth = horzcat(Height,DepthWidth); % Lägger in bredd och höjd i samma axel

for i = 1:nrows2;
Volym(i,1) = Depth(i,1)*Width(i,1)*Height(i,1)/1000;
end;

for i=1 : nrows2;
Centroid(i, 4) = sqrt(x(i)*x(i)+y(i)*y(i)+z(i)*z(i)); % Avstånd från centroid till origo
end;

Acceleration = [];
for i=2 :nrows2;
	Acceleration(i,1) = (Centroid(i, 1)-Centroid(i -1, 1))/NM(i,7); % x genom delta tid
	Acceleration(i,2) =( Centroid(i, 2)-Centroid(i -1, 2))/NM(i,7); % y genom delta tid
	Acceleration(i,3) = (Centroid(i, 3)-Centroid(i -1, 3))/NM(i,7); % z genom delta tid
	Acceleration(i,4) = (Centroid(i, 4)-Centroid(i -1, 4))/NM(i,7); % totala genom delta tid
	Acceleration(i,5) = (Height(i, 1)-Height(i-1, 1))/NM(i,7); % höjden genom delta tid
end;


