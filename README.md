3D-renderer
===========
The objective was to generate a realistic-looking landscape from a roughly described terrain.
![Modoku Logo](/src/demo.jpg)

##About

To do so, we followed these steps:
```
1.  Apply the diamond-square algorithm to add detail to the initial height map.
2.  Tesselate it.
3.  Apply a perspective transformation
4.  Color the the zones based on their position, height and orientation 
5.  Apply simplified Phong lighting
6.  Rasterise using the painter's algorithm then the Z-buffer algorithm
```
