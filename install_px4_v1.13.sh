#!/bin/bash
#在安装之前需要安装Java JDK 11（PX4官网没有指引）
sudo apt update
sudo apt install openjdk-11-jdk
#java -version
#克隆PX4 v1.13 固件（官网也没找到）
sudo apt install git
#px4 v1.13版本
cd ~
git clone -b v1.13.0-beta1 https://github.com/PX4/PX4-Autopilot.git --recursive
cd PX4-Autopilot/
git submodule update --init --recursive
cd ..
sudo apt update
sudo apt install python3-pip
sudo pip install --upgrade python-dateutil
