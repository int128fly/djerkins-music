FROM python:3.8-slim

# update os
RUN apt-get update -y && \
    apt-get upgrade -y

# install required packages
RUN apt-get install -y \
    git \
    libopus-dev \
    libffi-dev \
    libsodium-dev \
    ffmpeg \
    build-essential \
    libncursesw5-dev \
    libgdbm-dev \
    libc6-dev \
    zlib1g-dev \
    libsqlite3-dev \
    tk-dev \
    libssl-dev \
    openssl

WORKDIR /home

RUN git clone https://github.com/Just-Some-Bots/MusicBot.git MusicBot -b master

WORKDIR /home/MusicBot
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade -r requirements.txt

RUN chmod +x run.sh

CMD ["bash", "run.sh"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]