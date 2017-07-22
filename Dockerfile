FROM 	ubuntu:16.04

RUN 	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends python python-pip build-essential cmake git pkg-config libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran libavresample-dev libgphoto2-dev 

RUN	pip install numpy

RUN	cd /opt && \
	git clone https://github.com/opencv/opencv_contrib.git && \
	cd opencv_contrib && \
	git checkout 3.2.0 && \	
	cd /opt && \
	git clone https://github.com/opencv/opencv.git && \
	cd opencv && \
	git checkout 3.2.0 && \

RUN	mkdir build && \
	cd build && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_C_EXAMPLES=OFF \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
		-D BUILD_EXAMPLES=ON ..

RUN	make -j4

RUN	make install && \
	ldconfig


CMD /bin/bash
