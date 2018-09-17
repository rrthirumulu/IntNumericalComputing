% Computer code for evaluating the Gauss-Seidel iteration
% Author: Raghav Thirumulu, Perm 3499720
% Date:   09/12/2018

n=50;
x=zeros(n,1);
stop=Inf; 
crit=0.1 * (1/n); 
itr=0;

while stop>crit
    x_temp=x; 
    for i=1:n
        temp=0;
        for j=1:i-1
                temp=temp+A(i,j)*x(j);
        end
        for j=i+1:n
                temp=temp+A(i,j)*x_temp(j);
        end
        x(i)=(1/A(i,i))*(b(i)-temp);
    end
    itr=itr+1;
    stop=norm(x_temp-x);
end