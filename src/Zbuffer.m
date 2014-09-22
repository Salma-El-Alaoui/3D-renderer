function [ buf ] = Zbuffer(triangleOrd, couleurs )
maxi=max(triangleOrd);
mini=min(triangleOrd);

yMax=max([maxi(1,2) maxi(1,5) maxi(1,8)]);
yMin=min([mini(1,2) mini(1,5) mini(1,8)]);

xMax=max([maxi(1,1) maxi(1,4) maxi(1,7)]);
xMin=max([mini(1,1) mini(1,4) mini(1,7)]);

buf=ones(round(yMax-yMin),round(xMax-xMin));
dec = -[(xMin + 1) (yMin + 1)];
size(buf)

    for i=1:size(triangleOrd,1)
        triangle=[triangleOrd(i,1:2);triangleOrd(i,4:5);triangleOrd(i,7:8)];
        triangle=triangle + (ones(3,1) * dec);
       
        triangle = max(triangle, 1);

        buf= tpiRemplirTriangleBuffer(buf,triangle,triangleOrd(i,10));
    end
 
  im=ones(round(yMax-yMin),round(xMax-xMin));
 for i=1:size(triangleOrd,1)
        triangle=[triangleOrd(i,1:2);triangleOrd(i,4:5);triangleOrd(i,7:8)];
        triangle=triangle + (ones(3,1) * dec);
       
        triangle = max(triangle, 1);

        im= tpiRemplirTriangleImage(im,buf,triangle,triangleOrd(i,10),couleurs(i,:));
end
  figure(3);  
  image(im);

end

