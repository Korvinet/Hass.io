ARG BUILD_FROM
FROM $BUILD_FROM

ENV HOME /data
ENV LANG C.UTF-8

RUN apk add --no-cache jq

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

COPY ngrok /
RUN chmod a+x /ngrok

CMD [ "/run.sh" ]