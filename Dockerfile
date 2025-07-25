FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && apt update -y \
 && apt install awscli -y
 
RUN apt update -y && apt install awscli -y

RUN pip install -r requirements.txt
CMD ["python3", "app.py"]

