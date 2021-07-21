# Week 2

## Task for the Week:
 - [ ] establish jupyter lab to ACTS container.
 - [ ] familiarize with ACTS commands from generating information from Pythia8 to using AMVF to do vertexing. 
 - [ ] start learning the root file structure and print out truth information and reconstructed information from the root file by using _uproot_
 - [ ] _perhaps_ start drawing some performance plot after creating your own 10000 events root file. (complete the exercise)

## Tutorials:
 - we need to run another container if you already have the container from week 1. 
#### 1. Docker pull and run the [image](https://github.com/acts-project/machines/pkgs/container/ubuntu2004) (you don't need to pull again if you already have the image)
```bash 
docker pull ghcr.io/acts-project/ubuntu2004:latest
```
 - * remember to create a folder named acts_project in your local environment
 - _Mac users:_ 
``` bash
docker run --name GIVECONTAINERNAME -e JUPYTER_ENABLE_LAB=yes -p 8899:8888 -v /home/USERNAME:/acts_project -it ghcr.io/acts-project/ubuntu2004:latest
```
  - _Windows users:_ 
``` bash 
docker run --name GIVECONTAINERNAME -e JUPYTER_ENABLE_LAB=yes -p 8899:8888 -v C:\Users\USERNAME\acts_project:/workspace -it ghcr.io/acts-project/ubuntu2004:latest
```

#### 2. setup everything
 - in the docker attached container environment, (i.e. root@d9c344cbc67f:/# )
``` bash 
 apt install python3-pip
 apt install wget
 apt install unzip
 apt install tar
 apt install vim (enter 'Y' when being asked whether to use space in the disk)
 pip3 install jupyterlab
 pip3 install uproot3 (includes numpy)
 pip3 install awkward (the format of arrays in root files)
 pip3 install matplotlib
 pip3 install scipy
 pip3 install panda
```
 - install [ROOT](https://root.cern/releases/release-62402/) in the container
``` bash 
 wget https://root.cern/download/root_v6.24.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz
 tar -xzvf root_v6.24.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz
```
 - you will notice your root directory is not empty anymore, we will use it later.


#### 3. Build the revised version of [ACTS](https://github.com/hrzhao76/acts/tree/Add_Truth_and_Reco_Writer)
 - same commands as those in week 1.
 - **Remember** DO NOT source the new version of ROOT before running acts. Let it run its default version.

#### 4. Open Jupyter Notebook 
 - To use the new version of the ROOT,
```bash
 source root/bin/thisroot.sh
```
##### Option (if you have generated the events, and you want to make the source command a default):
 - we also need to enter the command into the environment variables so that you don't have to type in this command every time we want to use ROOT
 - to edit the environment variable
```bash 
 vim ~/.bashrc
```
 - you will see something like this
![image](https://user-images.githubusercontent.com/72419337/126112939-2075209d-2423-4ae2-85b4-c27d53b8c7e7.png)
 - check out [vim editing command](https://www.radford.edu/~mhtay/CPSC120/VIM_Editor_Commands.htm) 
 - use your downward key on your keyboard go to the 4th line, click `i` to insert text, then enter
```bash
source root/bin/thisroot.sh
```
 - then click `esc`, (look at the right bottom), and click `:wq` to save the change and exit. 
 - remember to copy the token

##### open Jupyter Lab
```bash
jupyter lab --ip 0.0.0.0 --allow-root
```
 - go to any website (i.e. firefox, chrome, etc), enter `http://localhost:8899/lab?`, and go starting on your new project.
![image](https://user-images.githubusercontent.com/72419337/126114568-7d01ad35-c9c2-4015-9f60-0e6c910512a7.png)

#### 5. Jupyter Notebook
 - Introducing [uproot](https://github.com/scikit-hep/uproot3), you can read through the README.rst to learn some of the basic commands regarding to uproot.
 - make sure the root file is in the same directory when creating a jupyter notebook
 - using uproot to read the root file and print out the truth information [.ipynb file attached](https://github.com/dlai211/Vertexing-Tutorial/blob/main/week_2.ipynb)

## Exercise:
 - Isolate _x-position, y-position, z-position, and number of vertex per events_ and create histograms for each. 
![image](https://user-images.githubusercontent.com/72419337/126566289-370449ea-c902-4a85-b0d4-cc8362708bb2.png)
![image](https://user-images.githubusercontent.com/72419337/126566496-f7c89179-b27b-48f4-afa5-ef597024cd1c.png)

