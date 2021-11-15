clear all; close all;
fileID = fopen('datos.txt','r');
formatSpec = '%f %f %f %f ';
sizeA = [4 inf];    
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
t=A(1,:);
u=A(4,:);
x1=A(2,:);
x2=A(3,:);
plot(t,[x1;x2;u])
xlabel('Time(s)')
ylabel('Amplitude')
title('Grafica de x_1, x_2 y la Ley de Control')
legend('x_1','x_2','u');
grid