%%tableau donnant les altitudes en metres aux points d'un maillage r?gulier
%%dont la taille de la maille est de 100m
%%x  va donc de 0 ? (13-1)*100 m?tres
%%y  va donc de 0 ? (10-1)*100 m?tres
%%pour se faire une idee de ce terrain il suffit de faire : 
%%surf(0:100:(13-1)*100,0:100:(10-1)*100,Terr);

Terr=[670   672   670   675   690   680   650   675   690   680   700   892   895;
      680   665   640   630   650   645   630   628   648   650   680   875   893;
      630   615   585   580   585   600   590   610   603   603   630   850   895;
      595   568   555   560   575   580   575   570   580   610   625   800   850;
      550   540   538   550   595   575   600   570   575   620   613   700   730;
      525   530   538   550   603   625   615   580   570   610   590   610   720;
      545   540   538   597   575   605   593   578   573   593   608   595   695;
      615   560   543   579   569   560   563   570   580   595   619   638   650;
      625   598   560   559   586   558   578   585   600   615   655   680   683;
      610   600   610   605   615   618   625   638   648   665   680   700   705];

  

matrice=Diamond_square(Terr,2);
listeTriangle=Triangle(matrice,2);

% algorithme du peintre
liste=Profondeur(listeTriangle,-50,-50,1200);
Perspective(liste, -50,-50,1200, 350,350,600,20, 0,-400,1500,2);

%zbuffer
[couleurZbuffer,new]=PerspectiveInv(listeTriangle, -50,-50,1200, 350 ,350,600, 20, 0,-400,1500);
listeOrd=Profondeur(new,-50,-50,1200);
Zbuffer(listeOrd,couleurZbuffer);


