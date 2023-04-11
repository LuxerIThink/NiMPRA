FROM osrf/ros:foxy-desktop

COPY packages.txt .
COPY root.bashrc .

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
ENV SHARED_DIR=/root/Shared/ros2_ws

RUN echo "Installing dependencies..." \
    && apt-get update -yq \
    && apt-get install -yq --no-install-recommends $(cat packages.txt) \
    && apt-get -y autoclean autoremove clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Install ROS..." \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-get \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-cache \
    && sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" /root/.bashrc \
    && cat root.bashrc >> /root/.bashrc \
    && touch /root/.Xauthority

RUN mkdir -p $SHARED_DIR/src

WORKDIR $SHARED_DIR
