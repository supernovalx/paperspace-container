FROM tensorflow/tensorflow:2.0.0a0-gpu-py3-jupyter

RUN apt-get update
RUN apt-get install --no-install-recommends -y git cmake build-essential libboost-dev libboost-system-dev libboost-filesystem-dev
RUN apt-get install -y ocl-icd-libopencl1 ocl-icd-opencl-dev
RUN export OPENCL_LIBRARIES=/usr/local/cuda/lib64
RUN export OPENCL_INCLUDE_DIR=/usr/local/cuda/include
WORKDIR /notebooks
RUN git clone --recursive https://github.com/microsoft/LightGBM
WORKDIR /notebooks/LightGBM
RUN mkdir build
WORKDIR build
RUN cmake -DUSE_GPU=1 ..
RUN make -j$(nproc)
WORKDIR ..
WORKDIR python-package/
RUN python setup.py install --precompile
WORKDIR ..
RUN mkdir -p /etc/OpenCL/vendors
RUN echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN curl https://pastebin.com/raw/QUrYYjD5 > sweep.sh
RUN tr -d '\r' < sweep.sh > sweep2.sh
RUN bash sweep2.sh
