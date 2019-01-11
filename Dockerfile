FROM golang:1.10-alpine as build

LABEL maintainer="Jerry Warren<jerry@forged-concepts.com>"

# Install needed packages
RUN apk update && \
    apk add --no-cache \
        curl \
        git \
        jq \
        make \
        py2-pip=10.0.1-r0 \
        zip \
    && rm /var/cache/apk/*

# Install Packer
RUN go get github.com/hashicorp/packer && \
    cd $GOPATH/src/github.com/hashicorp/packer && \
    make dev && \
    mv ./bin/packer /bin/packer && \
    rm -rf $GOPATH/* /root/.cache

# Install awscli
RUN pip install awscli

WORKDIR /
ENTRYPOINT [ "/bin/packer" ]
CMD ["--help"]
