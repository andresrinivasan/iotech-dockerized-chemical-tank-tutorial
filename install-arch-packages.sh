#!/bin/sh

arch=$(dpkg --print-architecture)
if [ "$arch" = "amd64" ]; then
  iotech_arch=amd64
  procsys_arch=linux-x64
else
  iotech_arch=arm64
  procsys_arch=linux-aarch64
fi

edgexpert_deb=edgexpert-2.3.2_$iotech_arch.deb
wget https://iotech.jfrog.io/artifactory/edgexpert-releases/edgexpert/deb/$edgexpert_deb
dpkg -i $edgexpert_deb

procsys_sh=prosys-opc-ua-simulation-server-$procsys_arch-5.4.6-148.sh
wget https://www.prosysopc.com/opcua/apps/JavaServer/dist/5.4.6-148/$procsys_sh
sh ./$procsys_sh -q -dir ./prosys-simulator

