function[L] = tri_regroupemen_2(labels,numClusters)
taille = size(labels);
L=zeros(numClusters+1,numClusters+1);
for j=1:taille(1);
    for i=1:taille(2);
        if(labels(j,i)~=0)
            L(j,labels(j,i)) =  L(j,labels(j,i))+1 ;   
        end
    end
end
end