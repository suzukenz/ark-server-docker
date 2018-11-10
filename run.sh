#!/bin/bash

if [ ! -d /ark/ShooterGame/Binaries/Linux ]; then
  arkmanager install
fi

arkmanager run
