function y = sat(x,b)
a=length(x);

for i=1:1:a
  if x(i) < -b 
      y(i) = 1;
  elseif x(i) >= -b && x(i)<=b
      y(i)=-(2/(2*b))*x(i);
  elseif x(i) >  b
       y(i)=-1;  
    
  end
end
end