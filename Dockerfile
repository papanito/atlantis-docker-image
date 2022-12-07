FROM ghcr.io/runatlantis/atlantis:v0.19.9

ENV PYTHONUNBUFFERED=1
RUN apk update
RUN apk add --update --no-cache python3 python3-dev musl-dev linux-headers gcc libffi-dev cargo make openssl-dev
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache --upgrade pip setuptools setuptools_rust wheel bcrypt asn1 knack azure-cli-telemetry
RUN pip3 install --upgrade azure-cli-core azure-cli --no-cache-dir
