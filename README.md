# circle_packing_2016
updated March 09 2016 / dphil circle packing project / Matlab

This code generates random close packing (RCP) on an input of N radii. 

My DPhil work involves modelling of white matter microstructure in the human brain. White matter are modelled as axona (or hollow cylinders) running in parallel. A 2-dimensional cross section of such a bundle to its longitudinal axis can be represented by a packing of circles. 

In human brains, axon size follow a Gamma distribution of known shape and scale. This algorithm performs RCP by minimizing the collective/summed distances of all the circles in the packing. My theory is based on the electromagnetic principal. Considering the circles to be ions of like charge, I assume that the packing which yields the maximum potential energy is one which has reached maximum packing density. 

Algorithm was written as I could not find alternative circle packing code readily available which input is a distribution of circle sizes. This work is by no means complete or superbly elegant. I hope that you will find it helpful and help improve my existing approach. 
The code is fast if N is on order of 10 (~2 minutes for 50 circles). However, it also copes with large samples as well. For example, in simulation of axons, my packings included ~3000 circles. 

To confirm the algorithm's robustness on first pass, if the input is circles of uniform size, it reaches hexgonal packing. For my purposes, I am able to achieve packing densities of ~83% which is close to the theoretical maximum.

Ti
