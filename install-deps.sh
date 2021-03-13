#!/bin/bash

case $(grep --max-count 1 ID /etc/os-release) in
	*ubuntu)
		sudo apt-get update
		sudo apt-get upgrade -y
		sudo apt-get install -y python3-pip
		;;
	*)
		echo "unsupported release"
		exit 1
		;;
esac
