On lxplus, do the following:

``` bash
mkdir ~/ACTS
cd ~/ACTS

wget https://github.com/hrzhao76/acts/archive/refs/heads/Add_Truth_and_Reco_Writer.zip
unzip Add_Truth_and_Reco_Writer.zip 
cd acts-Add_Truth_and_Reco_Writer/

screen -S acts 
source CI/setup_cvmfs_lcg98.sh

mkdir build
cd build
cmake ../ -DACTS_BUILD_EXAMPLES=ON -DACTS_BUILD_EXAMPLES_PYTHIA8=ON
make -j12
```

