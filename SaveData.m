function [ M ] = SaveData( tM, M )
%SAVEDATA Summary of this function goes here
%   Detailed explanation goes here
[~,n] = size(M);
tn= size(tM);
for i=1 : tn;
M(i,n+1)= tM(i);

end

