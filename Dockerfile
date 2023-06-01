FROM nvidia/cuda:11.3.1-devel-ubuntu20.04 AS base

ENV APP_HOME /app

ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1
ENV DISPLAY :0

RUN apt-get update \
    && apt-get -y install gcc ffmpeg python3.9 python3-pip python3-tk \
    && apt-get clean

WORKDIR $APP_HOME

COPY requirements.txt .

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

COPY . .

COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["/bin/sh", "start.sh"]