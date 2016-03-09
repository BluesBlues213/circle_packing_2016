# circle_packing_2016
updated March 09 2016 / dphil circle packing project / Matlab

This code was developed in order to generate a random close packing of circles in 2D without overlap. The input is N circles of any distribution of size. 

Background: My DPhil work involves modelling of white matter microstructure in the human brain. White matter bundles consist largely 
of axons (or cylinder) running in parallel. A 2D cross section of such a bundle against its longitudinal axis can be represented by a 
close packing of circles. 

General distributions of axon sizes in the brain are known. Therefore, to create a geometric model, the question becomes the following: 
given a sample of N circles following by some Gamma distribution of radii, what is the maximum density that can be achieved and what 
would that packing look like?

The following code addresses this problem by minimizing the collective/summed distances of all the circles in the packing. The idea is 
based on electromagnetic principal. I imagine that the circles are ions of the same charge. I assume that the packing of maximum density is equivalent to the packing of maximum potential energy. If this is true, then the problem becomes one of minimizing the collective 
distances of N circles. The way the code does this is through placing circles iteratively/sequentially.  

To my knowledge, there is no circle packing code readily available which input is a distribution of circle sizes. This work is by no means complete or elegant. I hope that others will take the idea, improve it, and build on it!

The code is fast if the input is a small number of circles (~2 minutes for 50 circles). It also copes with large samples as well. For example, in simulation of axons, my packings included ~3000 circles. 

As a first pass to confirm the code's function, if the input is circles of uniform size, it will generate hexgonal packing (most dense 
packing) for circles of same size. For my simulations, I am able to achieve packing densities of ~83% which is close to the theoretical 
maximum of axonal packing in the brain.

I hope this is helpful!
