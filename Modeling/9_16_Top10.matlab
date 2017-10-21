
Author = 'Azir_Zhang'
%{
c = concentrate of xxx
t = data of oxide environment (blue)
n = data of deoxide environment (red)
%}
c=[1000 100 10 0]
t=[1452.3 822 389 327.7]
n=[1434.7 809.7 383 324.3]

x0 = [300 1500 500 1]

f = inline('x(1) + x(2)*(1+(x(3)*c.^(-1)).^x(4)).^(-1)', 'x', 'c')

[a,r,j]=nlinfit(c,t,f,x0); a=a'
[b,r,j]=nlinfit(c,n,f,x0); b=b'

y=0:1/100:1000;

f = a(1) + a(2)*(1+(a(3)*y.^(-1)).^a(4)).^(-1)
g = b(1) + b(2)*(1+(b(3)*y.^(-1)).^b(4)).^(-1)

h = a(1) + a(2)*(1+(a(3)*c.^(-1)).^a(4)).^(-1)
k = b(1) + b(2)*(1+(b(3)*c.^(-1)).^b(4)).^(-1)

semilogx(y, f, '', y, g, '', c(1), t(1),'-bO', c(1), n(1), '-rO', c(2), t(2),'-bO', c(2), n(2), '-rO', c(3), t(3),'-bO', c(3), n(3), '-rO', c(4), t(4),'-bO', c(4), n(4), '-rO');
grid on 
xlabel('thiosulfate log(uM)')
ylabel('chromoprotein')
title('Top 10 Oxide and Deoxide Environment')