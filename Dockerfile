FROM osrf/ros:foxy-desktop

# Copy required package list and performed commands
COPY packages.txt .

# Enviromental variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
ENV SHARED_DIR=/root/Shared/ros2_ws

# Proceed instalation
RUN echo "Installing dependencies..." \
    && apt-get update -yq \
    && apt-get install -yq --no-install-recommends $(cat packages.txt) \
    && apt-get -y autoclean autoremove clean \
    && rm -rf /var/lib/apt/lists/*

# Set settings
RUN echo "Install ROS..." \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-get \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-cache \
    && sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" /root/.bashrc \
    && echo "# Enable completions\n\
	if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n\
		. /etc/bash_completion\n\
	fi\n\
	export USER=root" >> /root/.bashrc \
    && touch /root/.Xauthority

# Create and set workdirectory
RUN mkdir -p $SHARED_DIR/src

WORKDIR $SHARED_DIR

# Source Ros
RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc \
    && /bin/bash -c "source ~/.bashrc"
