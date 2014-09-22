function[couleurZbuffer, new]= Perspective( listeTriangle,Pox, Poy, Poz,Prx,Pry,Prz,d,Six,Siy,Siz,n)

    T=[1 0 0 Pox; 0 1 0 Poy ; 0 0 1 Poz ; 0 0 0 1];

    wx =Pox-Prx;
    wy =Poy-Pry;
    wz=Poz-Prz;

    w=[wx ; wy ;wz];
    w=w/norm(w);
    z=[0 0 1];
    u=cross(z,w);
    u=u/norm(u);
    v=cross(w,u);
    v=v/norm(v);
    v=-v;

    R=[u(1) v(1) w(1) 0; u(2) v(2) w(2) 0; u(3) v(3) w(3) 0 ; 0 0 0 1];

    P=[1 0 0 0; 0 1 0 0; 0 0 1 0 ; 0 0 1/d 1 ];

    figure(4);
    hold on;
    
    [x, y]=size(listeTriangle);
    
    trans=P*inv(R)*inv(T);
    
    couleurZbuffer=zeros(x,3);
   
    new=zeros(x,10);
    for i=1:1:x
        PtA=[listeTriangle(i,1); listeTriangle(i,2);listeTriangle(i,3);1];
        PtB=[listeTriangle(i,4); listeTriangle(i,5);listeTriangle(i,6);1];
        
        PtC=[listeTriangle(i,7); listeTriangle(i,8);listeTriangle(i,9);1];
        Atrans=trans*PtA;
        Btrans=trans*PtB;
        Ctrans=trans*PtC;

        Atrans=Atrans/Atrans(4);
        Btrans=Btrans/Btrans(4);
        Ctrans=Ctrans/Ctrans(4);
        
        new(i,1:3)=Atrans(1:3,1);
        new(i,4:6)=Btrans(1:3,1);
        new(i,7:9)=Ctrans(1:3,1);
        
        %Illumination
        La= 0.5 ;
        A=PtA(1:3,1);
        B=PtB(1:3,1);
        C=PtC(1:3,1);

        n= cross(B-A,C-A);
        n=n/norm(n);

        p= (A+B+C)/3;

        Si=[Six;Siy;Siz];
        if(dot(Si-p,n))>0
             Ld= 0.5 *dot((Si-p)/norm(Si-p),n);
             

        else
            Ld=0;
        end

        L=Ld+La;
   
        %Affichage des triangles
        %bleu
       if ((listeTriangle(i,3)+listeTriangle(i,6)+listeTriangle(i,9))/3)<591
                z= 00.91; 
                y=0.75;
                x= 0.05 ; 
         couleurZbuffer(i,:)= L*[x y z];
         h= fill( [Atrans(1);Btrans(1);Ctrans(1)], [Atrans(2);Btrans(2);Ctrans(2)],couleurZbuffer(i,:) );
         set(h,'edgecolor','none'); 

        elseif (listeTriangle(i,3)+listeTriangle(i,6)+listeTriangle(i,9))/3<=597
            %sable
                   x=1;
                   y=0.91;
                   z=0.84;
                 
            couleurZbuffer(i,:)=L*[x  y z];
            h= fill( [Atrans(1);Btrans(1);Ctrans(1)], [Atrans(2);Btrans(2);Ctrans(2)],couleurZbuffer(i,:) );
             set(h,'edgecolor','none'); 

        elseif (listeTriangle(i,3)+listeTriangle(i,6)+listeTriangle(i,9))/3<=635
            %vert
            couleurZbuffer(i,:)= L*[0.27 0.55 0];
            h= fill( [Atrans(1);Btrans(1);Ctrans(1)], [Atrans(2);Btrans(2);Ctrans(2)],  couleurZbuffer(i,:) );
             set(h,'edgecolor','none'); 

        elseif (listeTriangle(i,3)+listeTriangle(i,6)+listeTriangle(i,9))/3<=745+10*randn(1)
            
            couleurZbuffer(i,:)=L*[0.5 0.53 0.47];
            h= fill( [Atrans(1);Btrans(1);Ctrans(1)], [Atrans(2);Btrans(2);Ctrans(2)],couleurZbuffer(i,:) );
             set(h,'edgecolor','none'); 

       else
            couleurZbuffer(i,:)=L*[0.93 0.93 0.93];
            h= fill( [Atrans(1);Btrans(1);Ctrans(1)], [Atrans(2);Btrans(2);Ctrans(2)], couleurZbuffer(i,:) );
            set(h,'edgecolor','none'); 
        end

    end
end
