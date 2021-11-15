clear all; close all;
to=0; %Tiempo inicial 
tf=60; %Tiempo final
t=linspace(to,tf,2000); % 2000 Pasos de to a tf
xo(1)=-20; % Condición inicial de x_1
xo(2)=30;  % Condición inicial de x_2
a=1;
k=1;
options1=odeset('RelTol', 0.01);
fileID = fopen('datos.txt','w'); % Crear un archivo llamado datos.txt
xdot = @(t,x) [x(1)+a*sin(x(1))+x(2);
              (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));]; % Definimos las ecuaciones de estado
[t,x] = ode23 (xdot,t,xo,options1); % Resolvemos la ecuacion diferencial poniendo el tiempo y condiciones iniciales
u=(-2-cos(x(:,1))).*(x(:,1)+sin(x(:,1))+x(:,2))-x(:,1)-k.*(x(:,2)+2.*x(:,1)+sin(x(:,1))); % recalculamos la ley de control
y=[t,x,u]'; %Matriz para poder imprimir los datos
fprintf(fileID,'%10.6f %10.6f %10.6f %10.6f \n',y); % Imprimos los valores de en datos.txt
fclose(fileID); 
plot(t,[x u]) %Graficamos x_1, x_2 y u
xlabel('Time(s)')
ylabel('Amplitude')
title('Grafica de x_1, x_2 y la Ley de Control')
legend('x_1','x_2','u');
grid