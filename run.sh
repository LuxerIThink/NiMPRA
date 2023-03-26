#!/bin/bash
xhost +local:root

if [ -z "$SUDO_USER" ]; then
	echo "\$SUDO_USER is empty please, ruin it as SUDO or set it beforehand" 1>&2
	exit 1
fi;

docker run -it --rm \
	--privileged \
	--name=ros2foxy \
	--shm-size=1g \
	--ulimit memlock=-1 \
	-e DISPLAY=$DISPLAY \
	-e XDG_RUNTIME_DIR=/tmp \
	-e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/$SUDO_USER/Shared/RiSA_PNiMPRA:/root/Shared \
	--device=/dev/dri:/dev/dri \
	--device=/dev/video0 \
	--net=host \
	ros2foxy \
	bash
