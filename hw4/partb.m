clc;
clear all
N=100;
h=1/N;
x = 0:h:1;

%%%%Matrix A%%%%%%%
for i=1:N-1
a(i)=-1;% upper diagonal
end

for i=1:N
b(i)=2+h^2*pi^2; %main diagonal
end

for i=1:N-1
c(i)=-1; % lower diadonal
  
end
%%%%% matrix B
  
alpha=0;% first boundary
beta=0; %second boundary

for i=2:N
d(i)=2*pi^2*h^2*sin(pi*x(i));
end

f(1)=d(2)+alpha*(2*pi^2*h^2*sin(pi*x(1)));
for i=2:N-2
f(i)=d(i+1);
end
f(N-1)=d(N)+beta*(2*pi^2*h^2*sin(pi*x(N)));