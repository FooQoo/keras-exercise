FROM nvidia/cuda:8.0-cudnn6-runtime

RUN apt-get update
RUN apt-get install -y curl git unzip imagemagick bzip2
RUN git clone git://github.com/yyuu/pyenv.git .pyenv

WORKDIR /
ENV HOME  /
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install anaconda3-5.0.1
RUN pyenv global anaconda3-5.0.1
RUN pyenv rehash

RUN pip install opencv-python tqdm keras tensorflow-gpu h5py kaggle-cli gym
RUN pip install --upgrade tensorflow-gpu==1.4
RUN pip install --upgrade keras==2.1.3
RUN pip install chainer
RUN pip install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp36-cp36m-manylinux1_x86_64.whl 
RUN pip install torchvision
