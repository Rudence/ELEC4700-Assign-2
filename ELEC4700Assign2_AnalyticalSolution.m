%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% Analytical Solution 
W = 60;
L = 90;
V0 = 5;
a = W;
b = L/2;
n1 = 10;
n2 = 200;
num1 = 10; % Sets the number of meshes used
num2 = 100; 
X1 = linspace(-L/2,L/2,num1);
Y1 = linspace(0,W,num1);
[nx1,ny1] = meshgrid(X1,Y1);
X2 = linspace(-L/2,L/2,num2);
Y2 = linspace(0,W,num2);
[nx2,ny2] = meshgrid(X2,Y2);

V_analytical1 = zeros(num1,num1);% small sum n1, small mesh number num1 
V_analytical2 = zeros(num1,num1);% large sum n2, small mesh number num1
V_analytical3 = zeros(num2,num2);% small sum n1, large mesh number num2 
V_analytical4 = zeros(num2,num2);% large sum n2, large mesh number num2 

for n = 1:2:n1
    V_analytical1 = V_analytical1 + (1/n).*(cosh((n*pi.*nx1)./(a))./cosh((n*pi*(b))/(a))).*sin((n*pi.*ny1)./(a));
end 

for n = 1:2:n2
    V_analytical2 = V_analytical2 + (1/n).*(cosh((n*pi.*nx1)./(a))./cosh((n*pi*(b))/(a))).*sin((n*pi.*ny1)./(a));
end  

for n = 1:2:n1
    V_analytical3 = V_analytical3 + (1/n).*(cosh((n*pi.*nx2)./(a))./cosh((n*pi*(b))/(a))).*sin((n*pi.*ny2)./(a));
end  

for n = 1:2:n2
    V_analytical4 = V_analytical4 + (1/n).*(cosh((n*pi.*nx2)./(a))./cosh((n*pi*(b))/(a))).*sin((n*pi.*ny2)./(a));
end  

V_analytical1 = (4*V0/pi).*V_analytical1;
V_analytical2 = (4*V0/pi).*V_analytical2;
V_analytical3 = (4*V0/pi).*V_analytical3;
V_analytical4 = (4*V0/pi).*V_analytical4;

figure(4)
subplot(2,2,1)
surf(V_analytical1)
title('Analytical Solution: Large Mesh, Small Sum')
xlabel('X Direction')
ylabel('Y Direction')
colorbar
grid on

subplot(2,2,2)
surf(V_analytical2)
title('Analytical Solution: Large Mesh, Large Sum')
xlabel('X Direction')
ylabel('Y Direction')
colorbar
grid on

subplot(2,2,3)
surf(V_analytical3)
title('Analytical Solution: Small Mesh, Small Sum')
xlabel('X Direction')
ylabel('Y Direction')
colorbar
grid on

subplot(2,2,4)
surf(V_analytical4)
title('Analytical Solution: Small Mesh Large Sum')
xlabel('X Direction')
ylabel('Y Direction')
colorbar
grid on