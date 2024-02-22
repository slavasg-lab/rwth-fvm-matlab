% Simulationstechnik SS 2013
% Chair for Computational Analysis of Technical Systems, RWTH Aachen
% Laboruebung 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Visualize solution

% Round coordinates to 3. digit easing the bonus point questionnaire
x = str2num( sprintf('%15.3f', X(1:nnx+1)) );
y = str2num( sprintf('%15.3f', Y(1:nny+1)) );

% Collect temperature values
T = zeros(nny+1,nnx+1);

for i=1:nny+1
    for j=1:nnx+1
		% Round temperature to 1. digit easing the bonus point questionnaire
		T(i,j) = str2num( sprintf('%15.1f',Vol(i,j).T) );
    end
end

% Plot solution at volume centers
figure(33);
set(33,'Name','Solution')
surf(x,y,T)
xlabel('X-Direction');
ylabel('Y-Direction');
title(['Temperature field: t=' num2str(t) 's']);
colorbar('location','eastoutside')
caxis([min([T0,Ttop,Tright,Tbottom,Tleft]),max([T0,Ttop,Tright,Tbottom,Tleft])])
shading interp
lighting phong
% axis tight
% axis([0,1.0001,0,1.0001])
% axis equal


AZ=0; EL=90;
view(AZ,EL);
drawnow