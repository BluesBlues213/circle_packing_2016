# circle_packing_2016
updated March 09 2016  

This code generates random close packing (RCP) on an input of N radii following any arbitrary distribution of size.

My PhD work involves modelling of white matter microstructure in the human brain which can be modeled as hollow cylinders running in parallel. A 2-dimensional cross section of such a cylindrical bundle to its longitudinal axis can be represented by a packing of circles.

In human brains, axon sizes follow a Gamma distribution of known shape and scale. This algorithm performs RCP by minimizing the collective/summed distances of all the circles in the packing, relying on electromagnetic theory. Considering N circles of uniform charge, I assume that the packing which yields the maximum potential energy is one which has reached maximum packing density. 

The code is fast if N is on order of 10 (~2 minutes for 50 circles). However, it also copes with large samples as well. See example figure for packing result of N=3000 circles following a Gamma distribution in size. Packing density reaches 85%, the theoretial maximum based on tortuosity.  

To confirm the algorithm's robustness on first pass, if the input is circles of uniform size, it converges to hexgonal packing.
