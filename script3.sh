#!/bin/bash

release_os=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_error.log

check_exit_status() {
    if [ $? -ne 0 ]
    then
      echo "An error occured, please check $errorlog file for more insights."
    sleep 3
    else
        echo "Update was succesfull."
    sleep 3
    fi
}

if grep -q "Arch" $release_os
then
    # This is an Arch based system,
    # Run the pacman version of the command
    sudo pacman -Syu 1>> arch_update.log 2>>$errorlog
    check_exit_status
fi

if grep -q "Ubuntu" $release_os || grep -q "Debian" $release_os
then
    # This is a Debian or Ubuntu based system,
    # Run the apt version of the command
    sudo apt -y update 1>> $logfile 2>> $errorlog
    check_exit_status
fi
