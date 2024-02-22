% Simulationstechnik SS 2013
% Chair for Computational Analysis of Technical Systems, RWTH Aachen
% Laboruebung 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
% Define input parameters

% -------Mesh-----------------------------

% Number of internal Nodes in x and y direction (odd-numbered)
nnx = 21;
nny = 21;

% Calculate total number of nodes and number of volumes
nn = (nnx+2)*(nny+2);
nv = (nny+1)*(nnx+1);

% -------Boundary conditions--------------

% Initial temperature
T0 = 293 ;       % Kelvin

% Boundary conditions 
Ttop    = 100;      % Top boundary, Kelvin
Tleft   = 100;      % Left boundary, Kelvin
Tright  = 100;      % Right boundary, Kelvin
Tbottom = 100;      % Bottom boundary, Kelvin

% -------Simulation parameters------------

% End time of the simulation
tend = 0.5;       % seconds

% Time step size
dt = 0.001;      % seconds

% Thermal conductivity
lambda = 0.017 ;    % m^2/s

