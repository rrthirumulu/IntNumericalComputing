% Computer code for evaluating the Jacobi iteration
% Author: Raghav Thirumulu, Perm 3499720
% Date:   09/12/2018

n=50;
x=zeros(n,1);
stop=Inf; 

crit = 0.1 * (1/n); 
itr=0;

while stop>crit
    x_temp=x;
    for i=1:n
        sigma=0;
        for j=1:n
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end 
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    itr=itr+1;
    stop=norm(x_temp-x);
end
