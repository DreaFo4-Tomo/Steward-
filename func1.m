function [theta,xa,xb,xc,ya,yb,yc,solutions] = func1(x1,x2,y2,L1,L2,L3,P1,P2,P3)
syms theta xa xb ya yb xc yc;
eq1 = xa^2+ya^2-P1^2;
eq2 = (xb-x1)^2+yb^2-P2^2;
eq3 = (xc-x2)^2+(yc-y2)^2-P3^2;
eq4 = (xc-xb)^2+(yc-yb)^2-L1^2;
eq5 = (xc-xa)^2+(yc-ya)^2-L2^2;
eq6 = (xb-xa)^2+(yb-ya)^2-L3^2;
%theta为AB与x轴的夹角
eq7 = theta - asin((yb-ya)/L3);
%求解方程组
[theta,xa,xb,xc,ya,yb,yc] = solve(eq1,eq2,eq3,eq4,eq5,eq6,eq7);
solutions = double([theta,xa,xb,xc,ya,yb,yc]);

xa = solutions(:,2);xb = solutions(:,3);xc = solutions(:,4);
ya = solutions(:,5);yb = solutions(:,6);yc = solutions(:,7);

i=1;
j=1;
n=size(solutions,1);
%去掉为负数的结果
while (i<=n)
    if ~(isreal(xa(i,1)) && isreal(xb(i,1)) && isreal(xc(i,1)) && isreal(ya(i,1)) && isreal(yb(i,1)) && isreal(yc(i,1)))
        solutions(j,:)=[];
        j=j-1;
    end
    i=i+1;j=j+1;
end
%将theta从弧度转换为角度
solutions(:,1) = rad2deg(solutions(:,1));
theta = solutions(:,1);
xa = solutions(:,2);xb = solutions(:,3);xc = solutions(:,4);
ya = solutions(:,5);yb = solutions(:,6);yc = solutions(:,7);

