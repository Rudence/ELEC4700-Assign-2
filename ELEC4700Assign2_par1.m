% Rudi Hidvary
% 101037815 

clear
clc
close all

L = 6;
W = 6;
V0 = 10;

G = zeros(W*L,W*L)
B = zeros(W*L,1)

for y = 1:W
    for x = 1:L
        if(x == 1)
            B(y,1) = V0
        elseif(x == L)
            B(y,L) = -V0
        else
            B(y,x) = -V0
        end
    end
end
