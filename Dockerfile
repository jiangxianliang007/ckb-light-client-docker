FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends wget apt-utils unzip ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

ENV VERSION 0.3.8
RUN wget https://github.com/nervosnetwork/ckb-light-client/releases/download/v${VERSION}/ckb-light-client_v${VERSION}-x86_64-linux-portable.tar.gz -O /tmp/ckb-light-client.tar.gz
RUN cd /tmp && tar zxvf ckb-light-client.tar.gz
RUN cp /tmp/ckb-light-client /bin/ckb-light-client
RUN rm -rf /tmp/ckb-light-client.tar.gz

RUN mkdir /data
RUN mkdir /config

WORKDIR /data

EXPOSE 9000

ENV RUST_LOG=info
ENV ckb_light_client=info
ENTRYPOINT ["/bin/ckb-light-client"]
