FROM ubuntu
RUN apt-get update -qq
RUN apt-get install -y build-essential git

RUN apt-get install -y python python-setuptools python-dev python-tk

RUN easy_install pip
RUN pip install numpy scipy matplotlib notebook pandas sympy nose scikit-learn scikit-image h5py

RUN git clone --depth 1 https://github.com/Netflix/vmaf.git vmaf
ENV PYTHONPATH=/vmaf/python/src:/vmaf:/vmaf/sureal/python/src:$PYTHONPATH
ENV PATH=/vmaf:/vmaf/wrapper:/vmaf/sureal:$PATH
RUN cd /vmaf && make
