FROM alpine:latest
RUN apk update 
RUN apk add --no-cache \
git \
bash \
musl-dev \
linux-headers \
python3 \
py3-pip gcc \
python3-dev \
php php-json openssh
RUN pip3 install --break-system-packages requests packaging psutil
WORKDIR /root/seeker
COPY . .
EXPOSE 8080
ENTRYPOINT ["python3", "/root/seeker/seeker.py"]
CMD ["-p", "8080", "-t", "1", "-k", "https://drive.google.com/file/d/0B_HeOMAKGYucekJGeExlZFVhVUk"]
