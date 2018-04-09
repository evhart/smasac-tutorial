#
# Dockerfile for the SMASEC Tutorial
#
FROM alpine:3.7
LABEL maintener="Gregoire Burel <evhart@users.noreply.github.com>"
WORKDIR /home

# Install Python 3 and Pip
# See https://github.com/frol/docker-alpine-python3/blob/master/Dockerfile
RUN apk add --no-cache python3 python3-dev gfortran gcc build-base wget freetype-dev libpng-dev openblas-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# Install the requirements:
COPY requirements.txt /home/requirements.txt
RUN pip install --no-cache -r requirements.txt

# Add widgets support to Jupyter:
RUN jupyter nbextension enable --py widgetsnbextension

# Copy all the data:
COPY notebooks/ /home/notebooks
COPY slides/ /home/slides
COPY data/ /home/data
COPY README.md /home/README.md
COPY LICENSE /home/LICENSE
COPY requirements.txt /home/requirements.txt

# Start Jupyter
EXPOSE 8888
RUN ["chmod", "+x", "/home/run.sh"]
ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--allow-root", "--no-browser"]