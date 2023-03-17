xhost +local:root
docker run -it --rm \
	--name=ros2foxy \
	--shm-size=1g \
	--ulimit memlock=-1 \
	-e DISPLAY=$DISPLAY \
	-e XDG_RUNTIME_DIR=/tmp \
	-e QT_X11_NO_MITSHM=1 \
        -v "/tmp/.X11-unix:/tmp/.X11-unix" \
	-v "/home/$SUDO_USER/Nimpra_Shared:/root/Shared:rw" \
	--device=/dev/dri:/dev/dri \
	--device=/dev/video0 \
	--net=host \
	ros2foxy \
	bash
