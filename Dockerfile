FROM nvidia/cuda:8.0-runtime-ubuntu16.04 

ENV FSLDIR /usr/local/fsl

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git file gcc libmng-dev bzip2 sudo perl python && \
    apt-get install -y python-pip &&\
    pip install nibabel &&\
    cd /tmp && \
    wget http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    rm -rf libpng12-0_1.2.54-1ubuntu1_amd64.deb


RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py && \
    chmod 755 fslinstaller.py && \
    su -c "python ./fslinstaller.py -D -E -d /usr/local/fsl --fslversion 5.0.11"

RUN rm -rf fslinstaller.py

RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_cuda8.0 && \
	mv eddy_cuda8.0 ${FSLDIR}/bin && \
        chmod 755 ${FSLDIR}/bin/eddy_cuda8.0  

RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_openmp && \
        mv eddy_openmp ${FSLDIR}/bin && \
        chmod 755 ${FSLDIR}/bin/eddy_openmp 

RUN cd /opt  && \
   git clone https://github.com/shots47s/fslwrappers.git && \
   chmod a+rwx /opt/fslwrappers && \
   echo "hello"
 
#COPY eddy_cuda8.0 ${FSLDIR}/bin/eddy_openmp 
#        chmod 755 eddy_cuda8.0 && \

#        mv eddy_cuda8.0 ${FSLDIR}/bin && \
#        mv ${FSLDIR}/bin/eddy_cuda ${FSLDIR}/bin/eddy_cuda8.0

ENV PATH "${PATH}:${FSLDIR}/bin"
RUN . ${FSLDIR}/etc/fslconf/fsl.sh
ENV T="T"
