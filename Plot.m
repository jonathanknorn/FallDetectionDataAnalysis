%Höjd och djup bredd
figure('Name','Acceleration och lite annat')
subplot(3,1,1)
plot(T, V)
%plot(T, H, T, V)
%plot(T, HeightDepthWidth, T, V)
title('The size of the object')
legend('Volume')
xlabel('Time in ms')
ylabel('Volym in dm^3')
grid on

nrows2 = size(NM,1);
%Acceleration av origo och höjd
subplot(3,1,2)
plot(T,AH, T, AXYZ);
%plot(NM(1:nrows2,8),AH(1:nrows2,4));
title('Acceleration')
legend('Acceleration Height', 'Acceleration XYZ')
xlabel('Time in ms')
ylabel('cm/ms^2')
grid on

%Acceleration av h�jd
subplot(3,1,3)
plot(T, H);
legend( 'Height')
xlabel('Time in ms')
ylabel('cm/ms^2')
grid on


figure('Name','Position In The Room')
c = 1:numel(T);     
h = surface([tx(:), tx(:)], [tz(:), tz(:)], [ty(:), ty(:)], ...
    [c(:), c(:)], 'EdgeColor','flat', 'FaceColor','none');
colormap( jet(numel(T)) );
zlim([0 300])	% sätter y axel	
axis([-300 300 0 500])
grid on
set(gca,'XDir','reverse');
campos([-400, 500, 0])  % sätter x och y axlar Kopplar mot punkt 6
title('Position In The Room')
xlabel('X')
ylabel('Z')
zlabel('Y')

