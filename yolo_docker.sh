#! /bin/bash

#install 
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce

#install docker
sudo apt install docker-ce=5:20.10.20~3-0~ubuntu-bionic
#sudo apt install docker-ce #last version

git clone https://github.com/macosma1/yolov5_object_detection_docker.git

#create the image
cd yolov5_object_detection_docker/utils/docker/ 
sudo docker build -t yolov5:v1 .
sudo docker run -it --rm   --name yolo  --net=host  -e IP_TX=192.10.25.55   -e IP_SB=10.236.1.1   -e PORT_TX=8650   -e PORT_RX=8554   -e PORT_SB=8000   -e CONF_MIN=0.6 -e DISPLAY   -e QT_X11_NO_MITSHM=1   -v /tmp/.X11-unix:/tmp/.X11-unix   -v $HOME/.Xauthority:/root/.Xauthority   --device /dev/video0   --device /dev/video1 yolov5:v1

