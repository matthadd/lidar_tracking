vitesse = vitesse_total; % a remplacer lors de l'implémentation
position = bf1; %importdata('position.csv'); % a remplacer lors de l'implémentation

% lenv = length(vitesse);
[lignes2,colones2] = size(vitesse);
[lignes1,colones1] = size(position);

j=1
figure(1);
for i=1:3:645%colones1 %7,10,13 chaque debut de x 
X = position(1:lignes1,i);
Y = position(1:lignes1,i+1);
Z = position(1:lignes1,i+2);
VX = vitesse(1:lignes2,i);
VY = vitesse(1:lignes2,i+1);
VZ = vitesse(1:lignes2,i+2);
figure(1); %figure(j) pour plusieurs fenêtres
quiver3(X,Y,Z,VX,VY,VY);
%axis ([-20 20 -20 20 -20 20]);
%axis ([-10 10 -10 5 -5 1]);
i
axis equal
pause(1/20);
end

% X = position(1:10,4)
% Y = position(1:10,5)
% Z = position(1:10,6)
% VX = vitesse(1:10,4);
% VY = vitesse(1:10,5);
% VZ = vitesse(1:10,6);
% figure(2)
% quiver3(X,Y,Z,VX,VY,VY) 
% axis equal

%end