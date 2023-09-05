ARG tag=v0.25.0
FROM ghcr.io/runatlantis/atlantis:${tag} as base

ENV PYTHONUNBUFFERED=1
RUN apk update
RUN apk add --update --no-cache \
        python3 \
        python3-dev \
        musl-dev \
        linux-headers \
        gcc \
        libffi-dev \
        cargo \
        make \
        openssl-dev
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --no-cache-dir --upgrade pip \
        setuptools \
        setuptools_rust \
        wheel \
        bcrypt \
        asn1 \
        knack \
        azure-cli-telemetry
RUN pip3 install --upgrade --no-cache-dir \
        azure-cli-core \
        azure-cli 

FROM base as pwsh
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-alpine?view=powershell-7.3

# Install required dependencies
RUN apk add --update --no-cache \
    userspace-rcu \
    zlib \
    icu-libs
# Download the powershell '.tar.gz' archive
RUN curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/powershell-7.3.4-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz

# Create the target folder where powershell will be placed
RUN mkdir -p /opt/microsoft/powershell/7

# Expand powershell to the target folder
RUN tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7

# Set execute permissions
RUN chmod +x /opt/microsoft/powershell/7/pwsh

# Create the symbolic link that points to pwsh
RUN ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/powershell
RUN powershell -c 'Install-Module -Name Az -Scope AllUsers -Repository PSGallery -Force'
RUN powershell -c 'Install-Module -Name SqlServer -Scope AllUsers -Repository PSGallery -Force'