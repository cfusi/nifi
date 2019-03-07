FROM openjdk:8-jre-alpine

ARG UID=1000
ARG GID=1000
ARG MINIFI_VERSION=0.5.0

ENV MINIFI_BASE_DIR /opt/minifi
ENV MINIFI_HOME $MINIFI_BASE_DIR/minifi-$MINIFI_VERSION
ENV MINIFI_BINARY minifi-0.5.0-bin.tar.gz

WORKDIR $MINIFI_BASE_DIR
# COPY TO IMAGE
ADD ./* ${MINIFI_BASE_DIR}/

# Setup MiNiFi user
RUN addgroup -g $GID minifi && \
    adduser -S -H -G minifi minifi && \
    ./setup.sh && \
    chown -R minifi:minifi $MINIFI_HOME

USER minifi

# Startup MiNiFi
CMD ./start.sh
