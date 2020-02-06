% Rudi Hidvary
% 101037815 

clear
clc
close all

% Simulation Parameters 
L = 4; % Length of the spatial region
W = 4; % Width or height ofthe spatial region
V0 = 10; % Initial Voltage applied 
gnd = -10; % Ground voltage for easier reading of code 

% Matrix Definitions and sizing 
G = zeros(W*L,W*L)
B = zeros(W*L,1)
space = zeros(W,L)

% Loop used to initialize the matrix G and B to find V vector 
for x = 1:L
    for y = 1:W
        n = (x-1)*W+y
        if(x == 1)
            B(n,1) = V0
            space(y,x) = V0
            G(y,n) = 1
        elseif(x == L)
            B(n,1) = gnd
            space(y,x) = gnd
            G() = 1
        else
            %B(y,x) = -V0
        end
    end
end

spy(space)
