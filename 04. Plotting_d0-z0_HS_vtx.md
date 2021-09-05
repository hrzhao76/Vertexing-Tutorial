# Week 4 

## Tasks for the Week:

 - [ ] finish the vx, vy, vz, number of vertex plots
 - [ ] import colors to differentiate different vertices in d0-z0-plot
 - [ ] learn about the definition of Hard Scratter vertex & plot vz for all HS vertices.
 - [ ] generate your own 10,000 events of datasets.

## Tutorials:

 - The image below is an example of three single Gaussian track density distributions in the d0-z0 impact parameter grid. The two hornizontal 
black lines indicate the beam axis vector at which the track density contributions (red) are calculated.

![image](https://user-images.githubusercontent.com/72419337/127596009-52e95ff6-e1ff-41b4-9828-d8dc6f01cf7d.png)

 - BUT we are going to generate `d0-z0 plot` for one event of information (preferably one with more than 10 vertices), where the horizontal axis is z0 and the vertical axis is d0.

![image](https://user-images.githubusercontent.com/72419337/127734253-376f4647-9893-4a67-a85e-c07e75edadf9.png)


### Track Parameter Review:

 - d0  : signed impact parameter - the distanc e between helix and origin at the minimum approach (`transverse distance`)
 - z0 : z position at the point of minimum approach to the origin of the helix (`longitude distance`)
 - Φ : the `azimuthal` angle of track momentum at the reference point
 - θ : the `polar` angle of track momentum at the reference point
 - q/p : charge of the reconstructed tracks over the magnitude of its momentum
![image](https://user-images.githubusercontent.com/72419337/127734203-3f1c0578-5f10-4ad1-a191-3dd8f1135b15.png)

### Hard-Scatter Vertices

 - Primary vertices are the locations of inelastic pp (proton-proton) collisions - the ultimate origins of all the reconstructed 
objects used in physics analyses.
 - Accurate and efficient assignment of charged-particle trajectories to the correct primary vertex is essential to reconstruct the full
kinematic prperies of an interaction.
 - Typically only **one** _pp_ interaction in a given bunch crossing (the interaction with the greatest transverse momentum
pT, the "hard_scatter") is of interest, and its reaction products must be isloated from the dozens of others ("pile-up")
occuring simulataneously nearby.
 
#### How to calculate transverse momentum (pT)

 - We will use track parameters: θ & q/p for the calculation. Because transverse momentum pT = (momentum p) * sinθ, `pT = 1/|q/p| * sinθ`. 
 - **Remember** pT is transverse momentum for tracks. To single out HS (hard-scratter) vertices, we need to calculate the sum of (pT squared) for each vertex, `ΣpT^2`, and take
the maximum for each event. Then, the rest of the vertices are all pile-up.

 - Task for this week:
  1. find HS vertices in Jupyter Notebook. It should be 10,000 HS vertices.
  2. check the performance of your HS vertices by creating a vz plot, similar to your vz plot for all vertices.
