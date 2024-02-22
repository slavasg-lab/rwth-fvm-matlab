% Simulationstechnik SS 2013
% Chair for Computational Analysis of Technical Systems, RWTH Aachen
% Laboruebung 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initializes distances from a volume center to its neighbouring 
% volume centers

% Generate mesh and control volumes
meshgeneration

% Apply boundary conditions
boundary

% Matrix storing the absolute value of the distances to a neighbouring 
% volume center in the directions of the compass N,E,S,W
drN = zeros(nny+1, nnx+1);
drE = zeros(nny+1, nnx+1);
drS = zeros(nny+1, nnx+1);
drW = zeros(nny+1, nnx+1);

%%%%%%%%%  Y O U R  P A R T  O F  C O D E  S T A R T S  H E R E  %%%%%%%%%%

% Iteratate over all inner volumes (without boundary volumes)
for i=2:nny
    for j=2:nnx
        
        % Absolute distance in direction N
        drN( i, j  ) = abs(Vol(i,j).y-Vol(i+1,j).y) ;

        % Absolute distance in  direction E
        drE(  i, j ) = abs(Vol(i,j).x-Vol(i,j+1).x);
        
        % Absolute distance in  direction S
        drS(  i, j ) = abs(Vol(i,j).y-Vol(i-1,j).y) ;
        
        % Absolute distance in  direction W
        drW( i, j  ) = abs(Vol(i,j).x-Vol(i,j-1).x);
        
    end
end

%%%%%%%%%  Y O U R  P A R T  O F  C O D E  E N D S  H E R E  %%%%%%%%%%%%%%

%Initialize volume data for solver
VolNew = Vol;
