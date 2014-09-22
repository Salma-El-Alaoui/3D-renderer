function [ liste ] = Triangle( matrice,nbIter )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[nbLignes,nbColonnes]=size(matrice);
liste=zeros((nbLignes-1)*(nbColonnes-1)*2,10);

   m=1;
    for i=1:1:nbLignes-1
        for j=1:1:nbColonnes-1
            
            liste(m,1)=i*(100/2^nbIter);
            liste(m,2)=j*(100/2^nbIter);
            liste(m,3)=matrice(i,j);
            liste(m,4)=(i+1)*(100/2^nbIter);
            liste(m,5)=j*(100/2^nbIter);
            liste(m,6)=matrice(i+1,j);
            liste(m,7)=(i+1)*(100/2^nbIter);
            liste(m,8)=(j+1)*(100/2^nbIter);
            liste(m,9)=matrice(i+1,j+1);
            
            if ((liste(m,3)+liste(m,6)+liste(m,9))/3)<591
                liste(m,3)=590;
                liste(m,6)=590;
                liste(m,9)=590;
            end
            
         
            liste(m+1,1)=(i+1)*(100/2^nbIter);
            liste(m+1,2)=(j+1)*(100/2^nbIter);
            liste(m+1,3)=matrice(i+1,j+1);
            liste(m+1,4)=i*(100/2^nbIter);
            liste(m+1,5)=(j+1)*(100/2^nbIter);
            liste(m+1,6)=matrice(i,j+1);
            liste(m+1,7)=i*(100/2^nbIter);
            liste(m+1,8)=j*(100/2^nbIter);
            liste(m+1,9)=matrice(i,j);
            
              if ((liste(m+1,3)+liste(m+1,6)+liste(m+1,9))/3)<591
                liste(m+1,3)=590;
                liste(m+1,6)=590;
                liste(m+1,9)=590;
              end
            
        m=m+2;
        end
    
    end

end

