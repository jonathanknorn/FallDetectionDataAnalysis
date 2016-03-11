function [NM] = ReadFile(input )
%READFILE Summary of this function goes here
%   Detailed explanation goes here
M = dlmread(input);
nrows = size(M,1);
j = 1;
last =1;
NM = [];
for  i = 1:nrows;
    
	if any(M(i,2:6));
		NM(j,1) = M(i,1);
		NM(j,2) = M(i,2);
		NM(j,3) = M(i,3);
		NM(j,4) = M(i,4);
		NM(j,5) = M(i,5);
		NM(j,6) = M(i,6);
        
        if NM(j,6)< 0 
            disp('neg')
        end
        
        if j ~= 1;
            NM(j,8) = NM(j-1,8) + M(i,7);
        else;
            NM(j,8) = 0;
        end;
		
       
        j= j+1;

	else ;
        if i+1 < nrows;
            M(i+1,7) = M(i+1,7) + M(i,7);
        end;
        
        
        
		%while last-j ~= 0; 
		%	NM(last,7) = NM(last,7) + M(i,1);
		%	if last == 1;
		%		NM(last,8)= 0;
		%	else;
		%		NM(last,8) = NM(last,7) + NM(last-1,8);
		%	end;
		%	last = last +1;
		%end;
	end; 
end;


