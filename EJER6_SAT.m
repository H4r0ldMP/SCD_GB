clear ;close all; 

vini=[2 0];%condiciones iniciales
n=20;
h=0.001 ; 
matr=zeros(4,n/h+1) ;
matr2=zeros(4,n/h+1) ;
tt=0:h:n;
n1=0;
for trange=0:h:n 
n1=n1+1;
t=trange;
%parametros de control
eta=2;
lamda=5;
%parametros del sistema
xddotd=-2*(2*pi/2)*(2*pi/2)*sin(2*pi*t/2); 
xdotd =2*(2*pi/2)*cos(2*pi*t/2); 
x_d =2*sin(2*pi*t/2) ; 
% sistema no lineal
fun = @(t,x)[x(2);0.5*(x(2)^2)*cos(3*x(1))+(-1.5*x(2)^2*cos(3*x(1))+xddotd-lamda*(x(2)-xdotd)-(0.5*(x(2)^2)*cos(3*x(1))+eta)*sign((x(2)-xdotd)+lamda*(x(1)-x_d)))];

k1=fun(trange,[vini(1),vini(2)]); 
k2= fun(trange+h/2 ,[vini+(h/2).*k1]);
k3= fun(trange+h/2 ,[vini+(h/2).*k2]);
k4= fun(trange+h,[vini+h.*k3]);

vini= vini +(k1+2*k2+2*k3+k4)*h/6;

% ley de control modos deslizantes

u=-1.5*vini(2)^2*cos(3*vini(1))+xddotd-lamda*(vini(2)-xdotd)-(0.5*(vini(2)^2)*cos(3*vini(1))+eta)*sign((vini(2)-xdotd)+lamda*(vini(1)-x_d)) ;

% varia para mas variables de estado para hacer la grafica
matr(1,n1)=vini(1); 
matr(2,n1)=vini(2);
matr2(1,n1)=u ;

x_dd(n1)=x_d;
dx_e(2,n1)=vini(2)-xdotd;

end
figure
    hold on
    plot(tt,matr(1,:));
    plot(tt,matr(2,:));
    plot(tt,matr2(1,:));
    grid on
    legend ('x(1)','x(2)','u')
    
    hold off
figure
    hold on
    plot(tt,x_dd,'k--');
    plot(tt,matr(1,:));
    xlabel('tiempo') ; 
    ylabel('x_d,x');
    legend ('x_d','x')
    title('Respuesta del valor deseado y el valor actual de x')
    grid;
    hold off
    
