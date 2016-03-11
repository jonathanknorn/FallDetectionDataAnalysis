H=[];
AH=[];
AXYZ=[];
V=[];
D=[];
W=[];
DW=[];
T=[];


MyDir = dir('Logg');
[nFiles, ~] = size(MyDir);

for idx = 4:(nFiles)
    name = MyDir(idx).name;
    disp(name)
    %name = strcat ('test',int2str(i),'.txt');
    NM =ReadFile(name);
    % lägg in clear
 [tH,tW,tD, tx, ty, tz, tCentroid, tTime, tDepthWidth,tVolym, tAX,tAY,tAZ,tAXYZ,tAH] = getData(NM);
  H= SaveData(tH,H);
  AH= SaveData(tAH,AH);
  AXYZ= SaveData(tAXYZ,AXYZ);
  V= SaveData(tVolym,V);
  D= SaveData(tD,D);
  W= SaveData(tW,W);
  DW= SaveData(tDepthWidth,DW);
  T= SaveData(tTime,T);
end