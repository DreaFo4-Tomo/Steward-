function P2 = func2(fr)%主函数
P2=[];
i=1;
for z=0:1:15
    if fr == subfunc(5,0,6,3,3*sqrt(2),3,5,z,3)
        P2(i,1) = z;
        i=i+1;
    end
end
end

function fr = subfunc(x1,x2,y2,L1,L2,L3,P1,P2,P3)%子函数
syms fr xa xb ya yb xc yc;
eq1 = xa^2+ya^2-P1^2;
eq2 = (xb-x1)^2+yb^2-P2^2;
eq3 = (xc-x2)^2+(yc-y2)^2-P3^2;
eq4 = (xc-xb)^2+(yc-yb)^2-L1^2;
eq5 = (xc-xa)^2+(yc-ya)^2-L2^2;
eq6 = (xb-xa)^2+(yb-ya)^2-L3^2;
%求解方程组
[xa,xb,xc,ya,yb,yc] = solve(eq1,eq2,eq3,eq4,eq5,eq6);
solutions = double([xa,xb,xc,ya,yb,yc]);
xa = solutions(:,1);xb = solutions(:,2);xc = solutions(:,3);
ya = solutions(:,4);yb = solutions(:,5);yc = solutions(:,6);
i=1;j=1;
n=size(solutions,1);
%去掉为负数的结果
while (i<=n)
    if ~(isreal(xa(i,1)) && isreal(xb(i,1)) && isreal(xc(i,1)) && isreal(ya(i,1)) && isreal(yb(i,1)) && isreal(yc(i,1)))
        solutions(j,:)=[];
        j=j-1;
    end
    i=i+1;j=j+1;
end
fr=size(solutions,1);
end