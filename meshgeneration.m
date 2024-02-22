% Simulationstechnik SS 2013
% Chair for Computational Analysis of Technical Systems, RWTH Aachen
% Laboruebung 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generates the mesh and gathers all required geometry information

if ( (mod(nnx,2) == 0) || (mod(nny,2) == 0))
    error('mesh:nnCheck', ['The number of nodes in x and y direction must ' ...
                           'be odd-numbered!']);
end

% Mesh: temporarily stores node numbers and their arrangment in a matrix
Mesh = zeros(nny+2,nnx+2);

% NodeCoords(i,1): x coordinate of node i; NodeCoords(i,2): y coordinate
NodeCoords = zeros(nn,2);

% X: x coordinates of all volume centers in the same row
X = zeros(nnx+2,1);

% Y: y coordinates of all volume centers in the same column
Y = zeros(nny+2,1);

counter = 1;

    
for i=1:nny+2   % loop of rows (y-direction)
	for j=1:nnx+2   % loop of columns (x-direction)
		Mesh(i,j) = counter;
        
		% Mesh is quadratically refined to the boundaries
		if (j <= round((nnx+2)/2) )
			NodeCoords(counter,1) = 0.5*(j-1).^2/(round((nnx+1)/2)).^2;
		else
			NodeCoords(counter,1) = 1-0.5*(mod(2*round((nnx+2)/2)-1,j)).^2/(round((nnx+1)/2)).^2;
		end
		if (i <= round((nny+2)/2) )
			NodeCoords(counter,2) = 0.5*(i-1).^2/(round((nny+1)/2)).^2;
		else
			NodeCoords(counter,2) = 1-0.5*(mod(2*round((nny+2)/2)-1,i)).^2/(round((nny+1)/2)).^2;
		end

		% Round coordinates to 3. digit easing the bonus point questionnaire
		NodeCoords(counter,1) = str2num( sprintf('%15.3f', NodeCoords(counter,1)) );
		NodeCoords(counter,2) = str2num( sprintf('%15.3f', NodeCoords(counter,2)) );
        
		% Store node coordinates for mesh plot
		X(j) = NodeCoords(counter,1);
		Y(i) = NodeCoords(counter,2);
		counter = counter+1;
    end
end

% Plot mesh
fmesh = figure('Name','Mesh <Press any key to continue>');
for i=1:nny+2
	plot(X(:),ones(nnx+2)*Y(i),'k');
	hold on
end
for i=1:nnx+2
	plot(ones(nny+2)*X(i),Y(:),'k');
	hold on
end
axis equal
axis tight
xlabel('X-Direction');
ylabel('Y-Direction');
title('Mesh');
hold on

display('Pausing... <Press any key to continue>');
pause;


% Plot control volumes boundaries
set(gcf,'Name', 'Control volumes <Press any key to continue>')
for i=1:nny+2
	plot3(X(:),ones(nnx+2)*Y(i),ones(nnx+2)*-0.001 ,'r','LineWidth', 2.0)
% 	plot(X(:),ones(nnx+2)*Y(i),'k');
% 	hold on
end
for i=1:nnx+2
    plot3(ones(nny+2)*X(i),Y(:),ones(nny+2)*-0.001,'r','LineWidth', 2.0);
%     plot(ones(nny+2)*X(i),Y(:),'k');
%     hold on
end



% Store the general volume data:
% -------------------------------------------------------
% Vol(i,j).x: x coordinate of the volume center of volume in row i, column j
% Vol(i,j).y: y coordinate of the volume center of volume in row i, column j
% Vol(i,j).T: temperature of the volume of volume in row i, column j
% Vol(i,j).dx: width of the volume of volume in row i, column j
% Vol(i,j).dy: height of the volume of volume in row i, column j

% Allocate matrix of structures
Vol(nny+1, nnx+1).x = 0;
Vol(nny+1, nnx+1).y = 0;
Vol(nny+1, nnx+1).T = 0;
Vol(nny+1, nnx+1).dx = 0;
Vol(nny+1, nnx+1).dy = 0;

% Loop over all volumes starting at origin, row-wise
for i=1:nny+1
    for j=1:nnx+1
		Vol(i,j).dx = NodeCoords(Mesh(i,j+1),1) - NodeCoords(Mesh(i,j),1);
        Vol(i,j).dy = NodeCoords(Mesh(i+1,j),2) - NodeCoords(Mesh(i,j),2);
        Vol(i,j).x  = NodeCoords(Mesh(i,j),1) + Vol(i,j).dx/2;
        Vol(i,j).y  = NodeCoords(Mesh(i,j),2) + Vol(i,j).dy/2;
        Vol(i,j).T  = T0;
        
        X(j) = Vol(i,j).x;
    end
    Y(i) = Vol(i,j).y;
end

% Plot control volume centers
display('Plotting ...');
for i=1:nny+1
    for j=1:nnx+1       
        plot(Vol(i,j).x, Vol(i,j).y,'.k');
    end
end
title('Control volumes');
hold off

display('Pausing... <Press any key to continue>');
pause
set(gcf,'Name', 'Control volumes')
