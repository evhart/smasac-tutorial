#
# Dockerfile for the SMASEC Tutorial
#
FROM alpine:edge
LABEL maintener="Gregoire Burel <evhart@users.noreply.github.com>"
WORKDIR /home

# Install Python 3 and Pip
# See https://github.com/frol/docker-alpine-python3/blob/master/Dockerfile
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# There is a bug with pandas and pip 10, we use v9.0.3 instead.
RUN apk add --no-cache git python3 python3-dev py3-numpy py3-numpy-f2py py3-scipy py-numpy-dev gfortran gcc build-base wget \
    freetype-dev libpng-dev openblas-dev cython cython-dev geos@testing geos-dev@testing gdal@testing gdal-dev@testing \ 
    jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev harfbuzz-dev fribidi-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    python3 -m pip install --upgrade pip==9.0.3 setuptools && \
    ln -sf pip3 /usr/bin/pip && \
    ln -sf python3 /usr/bin/python && \
    rm -r /root/.cache

# Install the requirements:
COPY requirements.txt /home/requirements.txt
RUN python3 -m pip install --no-cache -r requirements.txt

# Add widgets support to Jupyter:
RUN jupyter nbextension enable --py widgetsnbextension

# Install spacy models:
RUN python3 -m spacy download en && \
    python3 -m spacy download en_core_web_sm

# Copy all the data:
COPY notebooks/ /home/notebooks
COPY slides/ /home/slides
COPY references/ /home/references
COPY data/ /home/data
COPY README.md /home/README.md
COPY LICENSE /home/LICENSE
COPY header.png /home/header.png

# Start Jupyter
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--allow-root", "--no-browser"]


# The Jupyter server can be started by starting the container using the following command:
# $ docker run -it -p 8888:8888 -p 5000:5000 --name smasac-tutorial evhart/smasac-tutorial:latest
# 
# Then, the Jupyter server should start and output the URI that needs to be used for connecting to the server. For example:
#
# Copy/paste this URL into your browser when you connect for the first time,
#     to login with a token:
#         http://localhost:8888/?token=<SOME_TOKEN>
# 
# Simply copy the URI from your terminal into your web browser for accessing the Jupyter server.