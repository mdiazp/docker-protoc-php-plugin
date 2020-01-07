FROM ubuntu:18.04

RUN apt update && apt install -y apt-utils git make build-essential libtool autoconf automake

RUN git clone -b v1.25.0 https://github.com/grpc/grpc

WORKDIR /grpc
RUN git submodule update --init
RUN make grpc_php_plugin

#ENV CGO_ENABLED=0 GOFLAGS=-mod=vendor

#WORKDIR $HOME/projects/boukker-translator-service

# COPY ./ ./

# RUN go build -o $GOPATH/bin/server ./cmd/server/

# new stage
#FROM alpine:latest
#
#LABEL maintainer="Manuel Alejandro Diaz Perez <manueldiazp92@gmail.com>"
#
#WORKDIR /root/
#
#COPY --from=builder /go/bin/server .
#
##EXPOSE 80 443
#
#CMD ["./server"]
