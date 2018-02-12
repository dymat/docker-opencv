# Ubuntu 16.04 with OpenCV+Modules and python2.7

Docker image based on Ubuntu 16.04 with python 2.7 and compiled opencv 3.4.0 with all modules from https://github.com/opencv/opencv_contrib

# License

* https://github.com/opencv/opencv/blob/master/LICENSE
* https://github.com/opencv/opencv_contrib/blob/master/LICENSE

# Usage

In your python script simply import OpenCV `import cv2`.

# Use Camera

`$ xhost +local:   # (optional) for displaying images with cv.imshow()`

`$ docker run -it --rm --device=/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v ~/myscripts/:/data dymat/opencv python /data/video.py`

# Version built with CUDA

If you need OpenCV with CUDA support:

`$ docker pull dymat/opencv:cuda`

# Use on ARM-Architectures

If you want to use this image on ARM-Architectures use `dymat/opencv:arm32v7`, which is based on `arm32v7/ubuntu` and compiled on Raspberry Pi 3 (ARMv7).

`$ docker pull dymat/opencv:arm32v7`
