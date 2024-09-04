#!/bin/bash
#In order to build Fast DDS you need to install the Foonathan Memory dependency.
cd ~
git clone https://github.com/eProsima/foonathan_memory_vendor.git
cd foonathan_memory_vendor
mkdir build && cd build
cmake ..
cmake --build . --target install
#Installation from Sources
#Fast DDS
git clone --recursive https://github.com/eProsima/Fast-DDS.git -b v2.0.2 ~/FastDDS-2.0.2
cd ~/FastDDS-2.0.2
mkdir build && cd build
#If you are on Linux, execute:
cmake -DTHIRDPARTY=ON -DSECURITY=ON ..
make -j$(nproc --all)
sudo make install
#Fast-RTPS-Gen
git clone --recursive https://github.com/eProsima/Fast-DDS-Gen.git -b v1.0.4 ~/Fast-RTPS-Gen \
&& cd ~/Fast-RTPS-Gen/gradle/wrapper
