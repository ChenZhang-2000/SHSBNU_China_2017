Author = 'Azir_Zhang'
%{
c = concentrate of xxx
t = data of aerobic environment (blue)
n = data of anaerobic environment (red)
%}
c=[1000 100 10 0]
t=[2008.7 723.3 263.3 261]
n=[1625.7 645.7 232 234]

x0 = [500 3400 130 1]

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
ylabel('Florescence')
title('Nissle 1917 in Aerobic and Anaerobic Environment')
legend('aerobic', 'anaerobic')
