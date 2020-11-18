FROM tensorflow/tensorflow:2.0.0a0-gpu-py3-jupyter

CMD curl https://pastebin.com/raw/f7JHCZzK > sweep.sh && tr -d '\r' < sweep.sh > sweep2.sh && bash sweep2.sh
