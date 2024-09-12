#!/bin/bash
mkdir -p ~/ardu_ws/src
cd ~/ardu_ws
vcs import --recursive --input  https://raw.githubusercontent.com/ArduPilot/ardupilot/master/Tools/ros2/ros2.repos src

cd ~/ardu_ws
sudo apt update
rosdep update
source /opt/ros/humble/setup.bash
rosdep install --from-paths src --ignore-src

sudo apt install default-jre
cd ~/ardu_ws
git clone --recurse-submodules https://github.com/ardupilot/Micro-XRCE-DDS-Gen.git
cd Micro-XRCE-DDS-Gen
./gradlew assemble
echo "export PATH=\$PATH:$PWD/scripts" >> ~/.bashrc

source ~/.bashrc
microxrceddsgen -version
# openjdk version "11.0.18" 2023-01-17
# OpenJDK Runtime Environment (build 11.0.18+10-post-Ubuntu-0ubuntu122.04)
# OpenJDK 64-Bit Server VM (build 11.0.18+10-post-Ubuntu-0ubuntu122.04, mixed mode, sharing)
# microxrceddsgen version: 1.0.0beta2

cd ~/ardu_ws
colcon build --packages-up-to ardupilot_dds_tests

colcon build --packages-up-to ardupilot_dds_tests --event-handlers=console_cohesion+

cd ~/ardu_ws
source ./install/setup.bash
colcon test --executor sequential --parallel-workers 0 --base-paths src/ardupilot --event-handlers=console_cohesion+
colcon test-result --all --verbose
