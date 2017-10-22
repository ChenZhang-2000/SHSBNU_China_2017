Author = 'Azir_Zhang'
%{
c = concentrate of xxx
t = data of TOP 10 (blue)
n = data of Nissle 1917 (red)
%}
c=[0 10 50 100 300 700 1000]
t=[142 533.7 1346.3 2211 2910 3304 3047.3]
n=[203.7 309.3 951.7 1849 3002.7 3411.7 3273.3]

x0 = [500 3400 130 1]

f = inline('x(1) + x(2)*(1+(x(3)*c.^(-1)).^x(4)).^(-1)', 'x', 'c')

[a,r,j]=nlinfit(c,t,f,x0); a=a'
[b,r,j]=nlinfit(c,n,f,x0); b=b'

y=0:1/100:1000;

f = a(1) + a(2)*(1+(a(3)*y.^(-1)).^a(4)).^(-1)
g = b(1) + b(2)*(1+(b(3)*y.^(-1)).^b(4)).^(-1)

h = a(1) + a(2)*(1+(a(3)*c.^(-1)).^a(4)).^(-1)
k = b(1) + b(2)*(1+(b(3)*c.^(-1)).^b(4)).^(-1)

semilogx(y, f, '', y, g, '', c(1), t(1),'-bO', c(1), n(1), '-rO', c(2), t(2),'-bO', c(2), n(2), '-rO', c(3), t(3),'-bO', c(3), n(3), '-rO', c(4), t(4),'-bO', c(4), n(4), '-rO', c(5), t(5),'-bO', c(5), n(5), '-rO', c(6), t(6),'-bO', c(6), n(6), '-rO', c(7), t(7),'-bO', c(7), n(7), '-rO');
grid on 
xlabel('thiosulfate log(uM)')
ylabel('Florescence')
title('Top 10 and Nissle 1917 in Aerobic Environment')
legend('Top10', 'Nissel1917')