# Enable completions
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi
export USER=root
# ROS setup
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
