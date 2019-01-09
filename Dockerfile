FROM golang:1.10-alpine

LABEL maintainer="Jerry Warren<jerry@forged-concepts.com>"

# Install needed packages
RUN apk update && \
    apk add --no-cache \
        curl \
        git \
        make \
        py2-pip=10.0.1-r0 \
        zip

# Install Packer
RUN go get github.com/hashicorp/packer

WORKDIR $GOPATH/src/github.com/hashicorp/packer
RUN make dev && mv ./bin/packer /bin/packer

# Install awscli
RUN pip install awscli

# Clean up time
RUN apk --purge -v del py-pip make
RUN rm -rf /var/cache/apk/* $GOPATH/src/github.com/*

WORKDIR /
ENTRYPOINT [ "/bin/sh" ]
