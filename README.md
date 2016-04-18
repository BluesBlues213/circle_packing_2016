# Motivation and Theory

Updated March 09 2016  

This algorithm produces random close packing or RCP on an input of N radii following any arbitrary distribution of size.

This script was developed as part of my PhD project, which involves modelling white matter microstructure. White matter bundles in the human brain consist of axons (or hollow cylinders) running uni-directionally. A 2-dimensional cross section of such a cylindrical bundle can be represented by a packing of circles. In human anatomy, axon size follow a Gamma distribution of known shape factor. 

This algorithm is developed with motivation from electromagnetic theory. Given N charged particles, the task cast is to produce the configuration of maximum potential energy by minimizing the sum of distances of the circles - the assumption being that such a configuration is equivalent to or at least close to that of maximum packing density. Resultant density converges to 83%, which is close to the theoretical maximum by tortuosity calculations.   

For small N (~50) algorithm takes ~2 minutes with 8GB of RAM. For large N (~3000), algorithm takes 10 hours. To confirm the method's robustness on first pass, if the input is circles of uniform size, it converges to hexgonal close packing (HCP). 

Packing result for N=3332 circles, Gamma distributed in size with shape factor 3.81, is shown in result_v1.png

# Input / Output

function [NWP,NWR] = pack_v(f) ... outputs positions of circles (NWP) and corresponding radii (NWR) given an input vector (f) of radii size.

