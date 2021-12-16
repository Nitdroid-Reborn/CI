#!/bin/bash
#
# Nitdroid Kernel Script 2021
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export JAVA_HOME="/usr/lib/jvm/jdk1.6.0_45"

##################################################################
sudo apt-get update && sudo apt-get install wget -y
mkdir /tmp/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > /tmp/bin/repo
chmod a+x /tmp/bin/repo
git config --global http.sslVerify false
wget https://github.com/Nitdroid-Reborn/CI/releases/download/Java-Oracle-6u45/jdk-6u45-linux-x64.bin
chmod +x jdk-6u45-linux-x64.bin
./jdk-6u45-linux-x64.bin
sudo mv jdk1.6.0_45 /usr/lib/jvm/
sudo ln -sf /usr/lib/jvm/jdk1.6.0_45/bin/java /usr/bin/java
sudo ln -sf /usr/lib/jvm/jdk1.6.0_45/bin/javac /usr/bin/javac
sudo ln -sf /usr/lib/jvm/jdk1.6.0_45/bin/javaws /usr/bin/javaws
##################################################################
sudo apt-get install software-properties-common -y
sudo add-apt-repository --yes ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python3.6 python2.7 -y
sudo ln -sf python2.7 /usr/bin/python
mkdir -p /tmp/Nitdroid && cd /tmp/Nitdroid
python3.6 /tmp/bin/repo init -u https://github.com/Nitdroid-Reborn/nitdroid_platform_manifest.git -b jb
python3.6 /tmp/bin/repo sync -v -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
##################################################################
