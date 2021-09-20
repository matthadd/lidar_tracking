mode = input('mode :');

switch mode

    case 1
%% Affichage du poids de chaque label
X = [1:length(comp_nbr_pts(:,1))].';
for i=1:length(comp_nbr_pts(1,:))
    Y = comp_nbr_pts(:,i);
    scatter(X, Y, 'r')
    pause(1)
    
    %%label = sprintf("%d",frame_cg(i,4));
    %%text(Xy,Y,Z,label,'Color','r')

end

    case 2

%% Affichage du poids et du deplacement de chaques objets
X = [1:length(comp_nbr_pts(:,1))].';
for i=1:length(comp_nbr_pts(1,:))
    Y = comp_nbr_pts(:,i);
    Z = deplacement(:,i);
    scatter3(X, Y, Z,'r')
    pause(1)
end
end