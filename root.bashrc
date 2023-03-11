# Enable completions
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi
export USER=root
# ROS setup
source /opt/ros/$ROS_DISTRO/setup.bash