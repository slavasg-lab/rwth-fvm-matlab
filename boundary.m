% Simulationstechnik SS 2013
% Chair for Computational Analysis of Technical Systems, RWTH Aachen
% Laboruebung 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Boundary conditions
% ATTENTION: This way to prescribe the boundary values is just for
% simplicity! For the correct approach recall lecture V30/31 p.11

% Set values at top boundary
for j=1:nnx+1
    Vol(nny+1,j).T = Ttop;
end

% Set values at bottom boundary
for j=1:nnx+1
    Vol(1,j).T = Tbottom;
end

% Set values at left boundary
for i=1:nny+1
    Vol(i,1).T = Tleft;
end

% Set values at right boundary
for i=1:nny+1
    Vol(i,nnx+1).T = Tright;
end