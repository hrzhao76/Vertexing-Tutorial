# Week 1

## Tasks for the Week:

- set up the ACTS framework on the local machine
- start generating small number of events and understand the commands

## Tutorials:

#### 1. Docker pull and run the [image](https://github.com/acts-project/machines/pkgs/container/ubuntu2004)
```terminal
  docker pull ghcr.io/acts-project/ubuntu2004:latest
```
  - _Mac users:_ 
```terminal
docker run --name GIVECONTAINERNAME -v /home/USERNAME:/acts_project -it ghcr.io/acts-project/ubuntu2004:latest
```
  - _Windows users:_ 
```terminal 
docker run --name GIVECONTAINERNAME -v C:\Users\USERNAME:/acts_project -it ghcr.io/acts-project/ubuntu2004:latest
```

  - **reminder:** 
  you need to create a new folder, called acts_project or whatever you want to call it, 
  in the environment on your local machine so that the "-v" would refer to that location. 
  And, you need to change GIVECONTAINERANAME and USERNAME to your preference.

#### 2. Build the revided version of [ACTS](https://github.com/hrzhao76/acts/tree/Add_Truth_and_Reco_Writer)
  - copy the zip file address of ACTS
  ![image](https://user-images.githubusercontent.com/72419337/125178587-71c74f80-e19b-11eb-920b-8490a51c42c9.png)
  - follow the terminal commands below
    - for content inside [], they require your inputs for the command. Remember, "ls" command is always helpful
    - for content inside (), they are comments to inform you what the command is for, but hey are not a part of commands
```terminal
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
  
#### 3. Generating small number of events
  - type in the command
```terminal
  cd [build directory name]/bin
  ls
```
  - To perform a new full reco chain, you need to do four steps of actions: ttbar event generation, simulation,
   truth tracking, and vertexing + performance writing
  - **ttar event generation**
  - we need to set the random seed to certain number to compare data with your teammates, generate 
  3 events, give an output location and file type, set the energy level of the event to 14TeV or 14,000GeV
  set the pile-up to 10 (10 interactions 
```terminal
./ActsExamplePythia8  --rnd-seed=42 --events=3  --output-dir=data/gen/ttbar_mu10 --output-root --output-csv --gen-cms-energy-gev=14000 --gen-hard-process=Top:qqbar2ttbar=on --gen-npileup=10 -l 1 | tee log.ActsExamplePythia
```
  
