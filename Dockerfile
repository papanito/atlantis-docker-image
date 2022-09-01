FROM ghcr.io/runatlantis/atlantis:v0.19.6

ENV PYTHONUNBUFFERED=1
RUN apk update
RUN apk add --update --no-cache python3 python3-dev musl-dev linux-headers gcc libffi-dev
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools wheel

RUN pip install --upgrade  azure-cli --no-cache-dir