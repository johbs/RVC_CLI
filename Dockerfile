# syntax=docker/dockerfile:1

FROM python:3.10-bullseye

WORKDIR /app

RUN apt update && apt install -y -qq ffmpeg aria2 && apt clean

COPY . .

# Debugging step to check the contents of /app
RUN echo "Listing contents of /app:" && ls -la /app

# Ensure install.sh exists and has the right permissions
RUN pip3 install --no-cache-dir -r requirements.txt

# Download prerequisites
RUN python /app/rvc.py prerequisites --pretraineds_v1 True --pretraineds_v2 True --models True --exe True

# Copy the audio file into the container
COPY audio.mp3 audio.mp3
COPY Jari2.pth Jari2.pth
COPY Jari2.index Jari2.index

ENTRYPOINT ["/bin/bash"]
