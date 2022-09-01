FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install gcc

RUN pip install -U pip setuptools
RUN pip install tqdm jupyterlab


WORKDIR /app
COPY ./mmdetection ./mmdetection
# install mmcv-full thus we could use CUDA operators
RUN pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.12.0/index.html
RUN pip install mmdet
# Install mmdetection
# RUN cd ./mmdetection && python setup.py install && pip install -e .

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
