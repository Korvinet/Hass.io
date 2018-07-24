ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3
RUN apk add --no-cache curl
RUN apk add --no-cache jq
RUN python3 -m pip install requests

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

COPY lutron_pico.py /
RUN chmod a+x /lutron_pico.py

CMD [ "/run.sh" ]