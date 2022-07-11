FROM ghcr.io/runatlantis/atlantis:latest

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 python3-dev musl-dev linux-headers gcc && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install wheel --no-cache

RUN pip install --upgrade  azure-cli --no-cache-dir