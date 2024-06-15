FROM alpine as builder

ARG BINJA_ZIP_NAME=binaryninja_commercial_linux.zip

# Install BinaryNinja from the zip file
RUN apk add unzip
COPY ${BINJA_ZIP_NAME} /tmp/binaryninja.zip
RUN unzip /tmp/binaryninja.zip -d /opt

FROM python
ARG BN_LICENSE

RUN apt-get update && apt-get install -y libdbus-1-3
COPY --from=builder /opt/binaryninja /opt/binaryninja

ENV BN_LICENSE=${BN_LICENSE}
RUN python3 /opt/binaryninja/scripts/install_api.py