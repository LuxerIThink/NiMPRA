# Ros 2 Foxy Docker

## Introduction

It'a a easy to use Docker container package with ROS 2 Foxy distro.
Created mainly for Robotics and Autonomus Systems specialization
students in Poznan University of Technology.

## Quick guide

### Build and run

To build Dockerfile use this command:
```
./build
```

To run Docker container use this command:
```
./run
```

### Moving in container shortcuts

Leave container:
<kbd> <br> CTRL <br> </kbd> + <kbd> <br> D <br> </kbd>

Kill active proces:
<kbd> <br> CTRL <br> </kbd> + <kbd> <br> C <br> </kbd>

Create new terminal:
<kbd> <br> CTRL <br> </kbd> + <kbd> <br> SHIFT <br> </kbd> + <kbd> <br> N <br> </kbd>

Create new tab:
<kbd> <br> CTRL <br> </kbd> + <kbd> <br> SHIFT <br> </kbd> + <kbd> <br> T <br> </kbd>

Change tab:

<kbd> <br> CTRL <br> </kbd> + <kbd> <br> SHIFT <br> </kbd> + <kbd> <br> -> <br> </kbd>

or

<kbd> <br> CTRL <br> </kbd> + <kbd> <br> SHIFT <br> </kbd> + <kbd> <br> <- <br> </kbd>


### Shared folder

This script create you shared folder with container in location
```
/home/$USER/Shared/RiSA_Ros2Foxy
```

### Ros 2 Foxy Hello World

In one tab run
```
ros2 run turtlesim turtlesim_node
```

in another
```
ros2 run turtlesim turtle_teleop_key
```

While you are focused in second tab you can move turtle in new window. <br>
Rest instruction you find in offical ROS 2 Foxy [Wiki](https://docs.ros.org/en/foxy/index.html)
