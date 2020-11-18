FROM tensorflow/tensorflow:2.0.0a0-gpu-py3-jupyter

RUN curl https://pastebin.com/raw/QUrYYjD5 > sweep.sh
RUN tr -d '\r' < sweep.sh > sweep2.sh
CMD bash sweep2.sh
