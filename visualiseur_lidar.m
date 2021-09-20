%% VISUALISEUR LIDAR
what_frame = 3 % quel frame traite on ?
frame_actuelle = moyenne_objet_all([limite(what_frame):limite(what_frame +1)-1],[1:4]); % on sélectionne CG + label _n
frame_suivante = moyenne_objet_all([limite(what_frame+1):limite(what_frame+2)-1],[1:4]); % on sélectionne CG + label _n+1
mode = input('mode :');
switch mode
   
%% Affichage d'une frame
    case 1
frame = table2array(frameread);
scatter3(frame(:,1),frame(:,2),frame(:,3),'r')
for i=1:length(A)
    %label = sprintf("%d",A(i,4));
    %text(A(i,1),A(i,2),A(i,3),label,'Color','r')
end


%% Affichage des CG d'une frame
    case 2
frame_cg = moyenne_objet_all([limite(what_frame):limite(what_frame + 1)-1],[1:4]);
scatter3(frame_cg(:,1),frame_cg(:,2),frame_cg(:,3),'r')
for i=1:length(frame_cg)
    label = sprintf("%d",frame_cg(i,4));
    text(frame_cg(i,1),frame_cg(i,2),frame_cg(i,3),label,'Color','r')
end


%% Affichage des résultats BF1
    case 3
mini = min(length(frame_suivante), length(frame_actuelle))
frame_actuelle = frame_actuelle([1:mini],:);
frame_suivante = frame_suivante([1:mini],:);
diff = frame_suivante - frame_actuelle;


% Methode 1 : vecteur tous quasi nuls = KNN fonctionnel
X = frame_actuelle(:,1)
Y = frame_actuelle(:,2)
Z = frame_actuelle(:,3)
% %vecteur tous quasi nuls = KNN fonctionnel
U = diff(:,1)
V = diff(:,2)
W = diff(:,3)


    case 4
        mini = min(length(frame_suivante), length(frame_actuelle))
frame_actuelle = frame_actuelle([1:mini],:);
frame_suivante = frame_suivante([1:mini],:);
diff = frame_suivante - frame_actuelle;
% Methode 2 : graphe s'approchant le sphere identité
subplot(2,1,1);
X = frame_actuelle(:,1)
Y = frame_actuelle(:,2)
Z = frame_actuelle(:,3)
% %cercle => fonction identite
U = frame_suivante(:,1)
V = frame_suivante(:,2)
W = frame_suivante(:,3);
quiver3(X,Y,Z,U,V,W)
axis equal
    case 5
 mini = min(length(frame_suivante), length(frame_actuelle))
frame_actuelle = frame_actuelle([1:mini],:);
frame_suivante = frame_suivante([1:mini],:);
diff = frame_suivante - frame_actuelle;
% graphe idéal
subplot(2,1,2);
X = frame_actuelle(:,1)
Y = frame_actuelle(:,2)
Z = frame_actuelle(:,3)

U = frame_actuelle(:,1)
V = frame_actuelle(:,2)
W = frame_actuelle(:,3)


quiver3(X,Y,Z,U,V,W)
axis equal


%% Affichage des résultats BF2

%% Affichage des résultats BF3

    case 6
for what_frame=1:4
frame_actuelle = moyenne_objet_all([limite(what_frame):limite(what_frame +1)-1],[1:4]); % on sélectionne CG + label _n

mini = min(length(vitesse_total), length(frame_actuelle));
frame_actuelle = frame_actuelle([1:mini],:);
vitesse_total = vitesse_total([1:mini],:);

X = frame_actuelle(:,1);
Y = frame_actuelle(:,2);
Z = frame_actuelle(:,3);

U = vitesse_total(:,1*what_frame);
V = vitesse_total(:,2*what_frame);
W = vitesse_total(:,3*what_frame);

quiver3(X,Y,Z,U,V,W);
axis equal

pause(1)

end

end

 