function [ listeTriangle ] = Profondeur( listeTriangle, Pox, Poy, Poz )
[m,n]= size(listeTriangle);

    for i=1:1:m
        baryX=(listeTriangle(i,1)+listeTriangle(i,4)+listeTriangle(i,7))/3;
        baryY=(listeTriangle(i,2)+listeTriangle(i,5)+listeTriangle(i,8))/3;
        baryZ=(listeTriangle(i,3)+listeTriangle(i,6)+listeTriangle(i,9))/3;

        listeTriangle(i,10)=sqrt((baryX-Pox)^2+(baryY-Poy)^2+(baryZ-Poz)^2)^2;
        

    end
    sortrows(listeTriangle,-10);
end
