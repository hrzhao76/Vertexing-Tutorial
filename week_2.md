# Week 2

## Task for the Week:
 - [ ] familiarize with ACTS commands from generating information from Pythia8 to using AMVF to do vertexing. 
 - [ ] start learning the root file structure and print out truth information and reconstructed information from the root file by using _uproot_
 - [ ] _perhaps_ start drawing some performance plot after creating your own 10000 events root file. (complete the exercise)

## Tutorials:
 - Introducing [uproot](https://github.com/scikit-hep/uproot3), you can read through the README.rst to learn some of the basic commands regarding to uproot.
 - open jupyter notebook (could be either in the local machine or in the virtual machine)
  - _open jupyter lab/notebook in the virtual machine_ (assuming you have installed Alan's ubuntu vm system in your docker)
```bash
docker start [container name]
docker attach [container name] 
```
 - should be popping up something like "root@d21afb0566d9:/# "
```bash
alias (to check all the application)
root_py3 (we want to enable python 3 for the jupyter notebook)
jupyter lab --ip 0.0.0.0 --allow-root
```
 - **import root file from ACTS container to local machine or to another virtual machine**
```bash
docker cp [acts virtual machine name]:/[build directory]/bin/[file name] home/USERNAME/acts_project
docker cp home/USERNAME/acts_project [virtual machine name]:/[location you want to copy]
```

### Jupyter Notebook
 - make sure the root file is in the same directory when creating a jupyter notebook
 - using uproot to read the root file and print out the truth information [.ipynb file attached](https://github.com/dlai211/Vertexing-Tutorial/blob/main/week_2.ipynb)

## Exercise:
 - Isolate _x-position, y-position, z-position, and number of vertex per events_ and create histograms for each. 
