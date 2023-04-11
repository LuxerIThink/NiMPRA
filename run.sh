#!/bin/bash
loc="/home/${USER}/Shared/RiSA_Ros2Foxy"
mkdir -p $loc
xhost +local:root
docker run -it --rm \
	--privileged \
	--name=ros2foxy \
	--shm-size=1g \
	--ulimit memlock=-1 \
	-e DISPLAY=$DISPLAY \
	-e XDG_RUNTIME_DIR=/tmp \
	-e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $loc:/root/Shared/ros2_ws \
	--device=/dev/dri:/dev/dri \
	--device=/dev/video0 \
	--net=host \
	ros2foxy \
	bash
