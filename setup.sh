#!/bin/bash

bash ./install/install.sh
bash ./install/other_installs.sh
bash ./config.sh

cd autologin
bash autologin.sh
cd ..
cd Theme
bash ./theme.sh


