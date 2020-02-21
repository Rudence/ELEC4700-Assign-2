

VX1 = V0;
VXL = 0;

% Loop used to initialize the matrix G and B to find V vector
for x = 1:L
    for y = 1:W
        n = (x-1)*W+y
        nxm = (x-2)*W+y;
        nxp = (x)*W+y;
        nym = (x-1)*W+(y-1);
        nyp = (x-1)*W+(y+1);         
        %G(n,n) = 1;
        if(x == 1)
            B(n,1) = VX1;
            space(y,x) = VX1;
            G(n,n) = 1;
        elseif(x == L)
            B(n,1) = VXL;
            space(y,x) = VXL;
            G(n,n) = 1;
        else % Calculated 
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            B(n,1) = 0;
        end
    end
end