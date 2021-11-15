to=0; %Tiempo inicial 
tf=60; %Tiempo final
t=linspace(to,tf,2000); % 2000 Pasos de to a tf
xo(1)=-20; % Condición inicial de x_1
xo(2)=30;  % Condición inicial de x_2
a=1;
k=1;
options1=odeset('RelTol', 0.01);
xdot = @(t,x) [x(1)+a*sin(x(1))+x(2);
              (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));]; % Definimos las ecuaciones de estado
[t,x] = ode23 (xdot,t,xo,options1); % Resolvemos la ecuacion diferencial poniendo el tiempo y condiciones iniciales
plot(t,x) %Graficamos x_1, x_2 y u
xlabel('Tempo(s)')
title('Grafica de x_1 y x_2 ')
legend('x_1','x_2');
grid