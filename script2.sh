#!/bin/bash

package=htop

sudo apt update && sudo apt install -y $package

if [ $? -eq 0 ]
then
    echo "The package was successfully installed."
    echo "Here it is: "
    which $package
else
    echo "The package did not not install."
    echo "Exited with code $?."
fi

$(which $package)
