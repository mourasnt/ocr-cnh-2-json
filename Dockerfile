FROM python:3.7
MAINTAINER Juliano Lazzarotto "jl.br.nh@gmail.com"

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        curl \
        unzip \
        yasm \
        pkg-config \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libpq-dev

RUN apt-get -y install tesseract-ocr

RUN pip install pillow
RUN pip install pytesseract
RUN pip install numpy
RUN pip install imutils
RUN pip install "scikit-image==0.19.3"
RUN pip install "opencv-python-headless==4.9.0.80"

RUN apt-get install -y nodejs npm

WORKDIR /app
COPY . /app

RUN npm install --global yarn
RUN yarn install --prod

EXPOSE 8080
CMD [ "node", "index.js" ]
