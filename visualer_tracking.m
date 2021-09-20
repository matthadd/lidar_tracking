function[] = visualer_tracking(A,B)
 

% figure;
% pcshow([X(:,1), X(:,2), X(:,3)])
% %pcshow([X,Y,Z])
% title('FRAME');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');

%A = moyenne_objet_all([limite(1):limite(2)-1],[1:4]);
%A = table2array(frameread)
scatter3(A(:,1),A(:,2),A(:,3),'r')
%scatter3(B(:,1),B(:,2),B(:,3),'b')
%scatter3(1,1,1,'r')
%scatter3(2,2,2,'r')

for i=1:length(A)
    label_A = sprintf("%d",A(i,4));
   % label_B = sprintf("%d",B(i,4));
    text(A(i,1),A(i,2),A(i,3),label,'Color','r')
    %text(B(i,1),B(i,2),B(i,3),label,'Color','b')
        text(1, 1, 1,label,'Color','b')

end



end
