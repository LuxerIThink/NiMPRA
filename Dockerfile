FROM osrf/ros:foxy-desktop

COPY linux_packages.txt .
COPY root.bashrc .

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Installing dependencies..." \
    && apt-get update -yq \
    && apt-get install -yq --no-install-recommends tzdata \
    && apt-get install -yq --no-install-recommends $(cat linux_packages.txt) \
    && apt-get -y autoclean autoremove clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Install ROS..." \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-get \
    && sed -i 's/--no-generate//g' /usr/share/bash-completion/completions/apt-cache \
    && sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" /root/.bashrc \
    && cat root.bashrc >> /root/.bashrc \
    && touch /root/.Xauthority

WORKDIR /root/
