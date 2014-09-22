function [ matriceNouvelle ] = Diamond_square( terr,iterMax )

    matricePrecedente=terr;
    const=30;
    for i=1:1:iterMax
        
        const=const*0.5;
        [nbLignes,nbColonnes]=size(matricePrecedente);
        matriceNouvelle=zeros(nbLignes*2-1,nbColonnes*2-1);
 % copie des valeurs de la precedente matrice avec des zeros dans les nouveaux points       
       ligne=1;
       for j=1:2:nbLignes*2-1
          colonne=1;
           for k=1:2:nbColonnes*2-1
               matriceNouvelle(j,k)=matricePrecedente(ligne,colonne);
               colonne=colonne+1;
           end
           ligne=ligne+1;
       end 
       %diamond
       for j=2:2:nbLignes*2-2
           for k=2:2:nbColonnes*2-2 
               matriceNouvelle(j,k)=(matriceNouvelle(j-1,k-1)+matriceNouvelle(j-1,k+1)+matriceNouvelle(j+1,k+1)+matriceNouvelle(j+1,k-1))/4 + randn*const;
           end
       end
       %square
       %bords verticaux
       for j=2:2:nbLignes*2-2
           matriceNouvelle(j,1)=(matriceNouvelle(j-1,1)+matriceNouvelle(j+1,1)+matriceNouvelle(j,2))/3+randn*const ;
           matriceNouvelle(j,nbColonnes*2-1)=(matriceNouvelle(j-1,nbColonnes*2-1)+matriceNouvelle(j+1,nbColonnes*2-1)+matriceNouvelle(j,nbColonnes*2-2))/3+randn*const;
       end
       %bords horizontaux
        for j=2:2:nbColonnes*2-2
           matriceNouvelle(1,j)=(matriceNouvelle(1,j-1)+matriceNouvelle(1,j+1)+matriceNouvelle(2,j))/3+ randn*const;
           matriceNouvelle(nbLignes*2-1,j)=(matriceNouvelle(nbLignes*2-1,j-1)+matriceNouvelle(nbLignes*2-1,j+1)+matriceNouvelle(nbLignes*2-2,j))/3+ randn*const;
        end
       %centre
         for j=3:2:nbLignes*2-3
            for k=2:2:nbColonnes*2-2
                matriceNouvelle(j,k)=(matriceNouvelle(j-1,k)+matriceNouvelle(j+1,k)+matriceNouvelle(j,k+1)+matriceNouvelle(j,k-1))/4+ randn*const;
            end
         end
         
          
            for j=2:2:nbLignes*2-2
                 for k=3:2:nbColonnes*2-3
                matriceNouvelle(j,k)=(matriceNouvelle(j-1,k)+matriceNouvelle(j+1,k)+matriceNouvelle(j,k+1)+matriceNouvelle(j,k-1))/4+ randn*const;
                 end
            end
     matricePrecedente=matriceNouvelle;
     
    end
end

