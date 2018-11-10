#!/bin/bash

if [ ! -d ${APP_ROOT}/ShooterGame/Binaries/Linux ]; then
  arkmanager install
fi

cp ark.Game.ini ${APP_ROOT}/ShooterGame/Saved/Config/LinuxServer/Game.ini

arkmanager update
arkmanager checkmodupdate && arkmanager installmods
arkmanager run
