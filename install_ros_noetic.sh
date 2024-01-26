#!/bin/bash

# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt install -y curl  # Automatically say yes to prompts
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Installation
sudo apt update
sudo apt install -y ros-noetic-desktop-full  # Automatically say yes to prompts

# Environment setup
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential  python3-catkin-tools # Automatically say yes to prompts

# Initialize rosdep
sudo apt install -y python3-rosdep  # Automatically say yes to prompts
sudo rosdep init
rosdep update

# Build ROS workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin build

cd
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
cd catkin_ws
source devel/setup.bash
