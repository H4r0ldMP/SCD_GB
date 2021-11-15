clear all; close all;
to=0; %Tiempo inicial 
tf=60; %Tiempo final
t=linspace(to,tf,2000); % 2000 Pasos de to a tf
xo(1)=-20; % Condición inicial de x_1
xo(2)=30;  % Condición inicial de x_2
%a=1;
k=1;
options1=odeset('RelTol', 0.01);
for i=1:4
  a=-1+4*rand(1);  
  xdot = @(t,x) [x(1)+a*sin(x(1))+x(2);
              (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));]; % Definimos las ecuaciones de estado
  [t,x] = ode45 (xdot,t,xo,options1); % Resolvemos la ecuacion diferencial poniendo el tiempo y condiciones iniciales
  u=(-2-a*cos(x(:,1))).*(x(:,1)+a*sin(x(:,1))+x(:,2))-x(:,1)-k.*(x(:,2)+2.*x(:,1)+a*sin(x(:,1))); % recalculamos la ley de control 
  subplot(2,2,i)
  plot(t,[x u]) %Graficamos x_1, x_2 y u
  xlabel('Time(s)')
  title(['Grafica de x_1, x_2 y la Ley de Control con a=' num2str(a)])
  legend('x_1','x_2','u');
  A(i)=a;
  grid
  x1_t(i,:)=x(:,1);
  x2_t(i,:)=x(:,2);
  u_t(i,:)=u;
endfor
figure
plot(t,[x1_t;x2_t;u_t])
xlabel('Time(s)')
title('Graficas de x_1, x_2 y la Ley de Control para 4 valores aletorios de a')
legend('x_1.1','x_1.2','x_1.3','x_1.4','x_2.1','x_2.2','x_2.3','x_2.4','u1','u2','u3','u4');
grid