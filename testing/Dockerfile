ARG BUILD_FROM
FROM $BUILD_FROM

ENV HOME /data
ENV LANG C.UTF-8

RUN apk add --no-cache python3
RUN apk add --no-cache jq

WORKDIR /data

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

#Build arguments
ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL io.hass.version=${BUILD_VERSION} io.hass.type="addon" io.hass.arch="${BUILD_ARCH}"