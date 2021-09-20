position = bf1;

[lignes2,colones2] = size(vitesse_total);
[lignes1,colones1] = size(position);
sel = [10:25]



k=1
    figure(1);
    for i=1:3:300%900 %i=1:3:length(position(1,:))- 3
        
        %construit de tous les vecteurs
        X = position(:,i);
        Y = position(:,i+1);
        Z = position(:,i+2);
        VX = vitesse_total(:,i);
        VY = vitesse_total(:,i+1);
        VZ = vitesse_total(:,i+2);
        
        % construction des vecteurs selectionnées
        X1= X(sel);
        Y1 = Y(sel);
        Z1 = Z(sel);
        VX1 = VX(sel);
        VY1 = VY(sel);
        VZ1 = VZ(sel);
        
        % construction des vecteurs non selectionnées en retirant les vecteurs sel
        % de vecteurs tot
        X(sel) = [];
        Y(sel) = [];
        Z(sel) = [];
        VX(sel) = [];
        VY(sel) = [];
        VZ(sel) = [];
%         if (i+2)/3 == 67
%              figure(1); %figure(j) pour plusieurs fenêtres
%         quiver3(X,Y,Z,VX,VY,VZ, 'b'); % no sel
%         %axis equal
%         axis (1.5*[ -10    10   -10    10   -10    10]);
%         hold on
%         quiver3(X1, Y1, Z1, VX1, VY1, VZ1,'r'); % sel
%         %axis equal
%         axis (1.5*[ -10    10   -10    10   -10    10]);
%         hold off
%         pause(300)
%         end
        
        figure(1); %figure(j) pour plusieurs fenêtres
        quiver3(X,Y,Z,VX,VY,VZ, 'b'); % no sel
        %axis equal
        axis (1.5*[ -10    10   -10    10   -10    10]);
        hold on
        quiver3(X1, Y1, Z1, VX1, VY1, VZ1,'r'); % sel
        %axis equal
        axis (1.5*[ -10    10   -10    10   -10    10]);
        hold off
        (i+2)/3/2
        pause(1/20);
    end