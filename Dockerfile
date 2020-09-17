FROM alpine:3.6

ENV VER=2.11.1 METHOD=chacha20 PASSWORD=ss123456
ENV TLS_PORT=4433 PORT=8080

RUN apk add --no-cache curl \
  && curl -sL http://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz | gzip -d \
  && chmod a+x gost

WORKDIR /
EXPOSE ${TLS_PORT} $PORT

CMD exec /gost -L mwss://:$TLS_PORT -L mws://:$PORT
