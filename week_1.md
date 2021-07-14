# Week 1

## Tasks for the Week:

 - [x] set up the ACTS framework on the local machine
 - [x] start generating small number of events and understand the commands
 - [x] start reading on the [ATLAS document about vertex recontruction](http://cdsweb.cern.ch/record/2670380/files/ATL-PHYS-PUB-2019-015.pdf)

## Tutorials:

If you are running MacOS or Linx, you can try to run on your host machine if you prefer. This can avoid shortage of memory that occured in Docker. And it is usually faster than docker as you don't use any virtualization. 

If you are running Windows, Docker is a good way. 

[Prerequisites](https://acts.readthedocs.io/en/latest/getting_started.html#prerequisites)

### Run on your host

#### MacOS 
1. install homebrew 
  check this page [Homebrew MacOS Setup Guide](https://sourabhbajaj.com/mac-setup/Homebrew/) for more information 
  In addition, add the `homebrew-hep` for hign energy physics. Unless you want to compile `Pythia 8` yourself, it's more convient to use brew to deal with these dependencies. 

  basically, 

  ``` bash 
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # install homebrew 
  brew tap davidchall/hep # tap the homebrew-hep for hep packages 
  ```
2. install dependencies for acts 

``` bash 
  brew install gcc cmake boost eigen pythia 
```

Then you are ready to build ACTS. 

#### Debian / Ubuntu/ Linux mint 
Note: This is a little bit advanced and you need to compile Pythia8. 

``` bash 
  sudo apt update && sudo apt upgrade -y  
  sudo apt install build-essential gcc cmake libboost-all-dev libeigen3-dev 
```
Check the following page on how to compile Pythia8. 
https://www.tifr.res.in/~ehep2019/pdfs/serb_install_ubuntu_V3.pdf

``` bash 
  ./configure --prefix=<YOUR-INSTALL-PATH>
  make -j12 
  make install 
```

Add environment variable for Pythia8 to your `.bash_rc` that CMake can find the path of Pyhtia 8 when building ACTS. 

### Docker
#### 1. Docker pull and run the [image](https://github.com/acts-project/machines/pkgs/container/ubuntu2004)
``` bash
docker pull ghcr.io/acts-project/ubuntu2004:latest
```
  - _Mac users:_ 
``` bash
docker run --name GIVECONTAINERNAME -v /home/USERNAME:/acts_project -it ghcr.io/acts-project/ubuntu2004:latest
```
  - _Windows users:_ 
``` bash 
docker run --name GIVECONTAINERNAME -v C:\Users\USERNAME:/acts_project -it ghcr.io/acts-project/ubuntu2004:latest
```

  - **reminder:** 
  you need to create a new folder, called acts_project or whatever you want to call it, 
  in the environment on your local machine so that the "-v" would refer to that location. 
  And, you need to change GIVECONTAINERANAME and USERNAME to your preference.

#### 2. Build the revised version of [ACTS](https://github.com/hrzhao76/acts/tree/Add_Truth_and_Reco_Writer)
  - copy the zip file address of ACTS
  ![image](https://user-images.githubusercontent.com/72419337/125178587-71c74f80-e19b-11eb-920b-8490a51c42c9.png)
  - follow the  bash commands below
    - for content inside [], they require your inputs for the command. Remember, "ls" command is always helpful
    - for content inside (), they are comments to inform you what the command is for, but hey are not a part of commands
``` bash
  apt install wget (install wget)
  wget [zip file address] (get the zip file from the website)
  apt install unzip (install unzip)
  unzip [file name] 
  mkdir [build directory name] (create a build directory with whatever name you want to call it)
  cmake -B [build directory name] -S [source directory name] -DACTS_BUILD_FATRAS=ON -DACTS_BUILD_EXAMPLES=ON -DACTS_BUILD_EXAMPLES_PYTHIA8=ON
  cd [build directory name]
  make -j4 (the number after -j is the number of cores you have in your local machine)
```
  - **reminder:** build the ACTS framework will consume a huge portion of your computer computing power, 
  including your CPU, RAM, and disk. So, make sure that you have minimum computing happening in the background.
  - if you run into some problems after running "make -j4", it probably occurred because of low RAM. Please, 
  reduce other computing happening on your computer and "make -j4" again. If the issue keeps occuring,
  check every command you entered and contact David or Haoran for the issue.
  
  TroubleShooting:
  
  If you are using docker and your building process is killed by ccplus, you should increse the memory.  

#### 3. Generating small number of events
  - type in the command
``` bash
  cd [build directory name]/bin
  ls
```
  - To perform a new full reco chain, you need to do four steps of actions: ttbar event generation, simulation,
   truth tracking, and vertexing + performance writing
  - **# ttar event generation**
  - Use "./ActsExamplePythia8 -h" to see detailed variable settings and understand each line.
  - Example explanation: set the random seed to certain number to compare data with your teammates, generate 
  3 events of particle truth information, give an output location and file type, set the energy level of the event to 14TeV or 14,000Gev, set the pile-up to 10 (10 interactions per bunch crossing)
  - you can choose not to input "| tee log.ActsExamplePythia" in the command since it generates a log file of the results. 
``` bash
./ActsExamplePythia8  --rnd-seed=42 --events=3  --output-dir=data/gen/ttbar_mu10 --output-root --output-csv --gen-cms-energy-gev=14000 --gen-hard-process=Top:qqbar2ttbar=on --gen-npileup=10 -l 1 | tee log.ActsExamplePythia
```
  - **# simulation**
  - Using particle truth info. as input, the fast simulations propagates it through the detector. 
  - Set 2 Tesla for the magnetic field. 
``` bash
./ActsExampleFatrasGeneric --rnd-seed=42 --input-dir=data/gen/ttbar_mu10   --output-dir=data/sim_generic/ttbar_mu10  --output-csv  --select-eta=-2.5:2.5 --select-pt-gev=0.4: --fatras-pmin-gev 0.4 --remove-neutral  --bf-constant-tesla=0:0:2 -l 1 | tee log.ActsExampleFatrasGeneric
```
  - **# Truth Tracking**
  - Read the simulation output (truth hits and truth particles), smear the true hits, creates seeds from the truth particles, builds truth tracks (uses the truth infor. to group simulated hits into tracks) and fits them. 
``` bash
./ActsExampleTruthTracksGeneric --rnd-seed=42 --input-dir=data/sim_generic/ttbar_mu10 --output-dir=data/reco_generic/ttbar_mu10 --bf-constant-tesla=0:0:2 --digi-config-file ~/sw/source/acts/Examples/Algorithms/Digitization/share/default-smearing-config-generic.json -l 1 | tee log.ActsExampleTruthTracksGeneric
```
  - **#vertexing + performance writing**
  - Setup the magnetic field, add additional particle selection, apply some primary vertexing selection cuts, find vertices, write the track parameters from fitting.
``` bash
./ActsExampleVertexFinderTrackReaderPerformanceWriter  --bf-constant-tesla=0:0:2 --input-dir=data/reco_generic/ttbar_mu10 --output-dir=data/vertexing/ttbar_mu10 -l 1 | tee log.ActsExampleVertexFinderTrackReaderPerformanceWriter
```

