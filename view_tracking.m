function[label_num data_num] = view_tracking(moyenne_objet_all,moyenne_objet_all_bis,label_all2,data_all2,limite,num)

moyenne_objet_all_bis = [ moyenne_objet_all_bis; NaN*ones(length(moyenne_objet_all)-length(moyenne_objet_all_bis),9)];
B = moyenne_objet_all_bis(:,4)==num;
C= moyenne_objet_all(:,4).*B;
taille_matrice = length(label_all2(:,1))* length(label_all2(1,:));
repere = [1];
k=2;
for i = 2:taille_matrice
    if label_all2(i)==99999
        repere(k)=i;
        k=k+1;
    end 
end
c_bis = find(C);
label_num= [ ];
indice_num = [ ];
repere(end+1)=length(label_all2);
i=1;
j=1;
r=1;
while(limite(r)<= c_bis(1))
    r=r+1;
end
r=r-1;% r permet de trouver le numéro frame adequat correpondant à la première apparition de l'objet
compteur = 1;
center_num = [ ];
for i = 1: length(c_bis)
    center1 = center_num;
    center_num = [ ];
    indice_num = [ ]; %a decommnenter si besoin 
    center_num  =  moyenne_objet_all(c_bis(compteur),1:3);
    compteur = compteur + 1 ; 
    for j = repere(r):repere(r+1)
        if (label_all2(j)==C(c_bis(i)))
            label_num = [label_num ; label_all2(j)];
            indice_num = [indice_num ; j];
        end          
    end
    r=r+1;
    if (compteur == 2)
        vitesse_x = 0;
        vitesse_y = 0;
        vitesse_z = 0;
    else
        vitesse_x = (- center1(1) + center_num(1))*10;
        vitesse_y = (- center1(2) + center_num(2))*10;
        vitesse_z = (- center1(3) + center_num(3))*10;
    end
     data_num = data_all2(indice_num,1:3);
     %data_num = [data_num ; [0 0 0]; [15 -10 1 ]; [-15 -15 1]; [10 15 1]; [15 10 1]];
     data_num = [data_num ; [0 0 0]; [3 -3 1]; [-3 -3 1]; [-3 3 1]; [3 3 1]];
     %data_num = [data_num ; [0 0 0]];
     pcshow(pointCloud(data_num))
     colormap(hsv(1));
     hold on 
     scatter3(center_num(1,1), center_num(1,2),center_num(:,3),100,'w')
     val = int2str(num);
     val2 = strcat('vx=',num2str(vitesse_x),' , ', 'vy=',num2str(vitesse_y),',', 'vz=', num2str(vitesse_z));
     val3 = strcat ('x=',num2str(center_num(1)),' , ', 'y=', num2str(center_num(2)),' ,', 'z=',num2str(center_num(3)));
     text(center_num(1,1)+ 0.1,center_num(1,2)+0.1,center_num(1,3)+1,val,'Color','w');
     text(center_num(1,1)+ 0.1,center_num(1,2)+0.1,center_num(1,3)+3,val2,'Color','g');
      text(center_num(1,1)+ 0.1,center_num(1,2)+0.1,center_num(1,3)+2,val3,'Color','b');
     hold off
     pause(2);
     
end



data_num = data_all2(indice_num,1:3);
%val_abberant_indice = find(data_num==99999);
%data_num(val_abberant_indice)=0;

%pcshow(pointCloud(data_num))
%colormap(hsv(length(repere)-2));

end 


   