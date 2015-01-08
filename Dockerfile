from ubuntu:12.04
# Set locale to UTF8
RUN locale-gen --no-purge en_GB.UTF-8 
RUN update-locale LANG=en_GB.UTF-8
RUN dpkg-reconfigure locales
ENV LANGUAGE en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8

RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN usermod -d /config nobody
RUN usermod -d /output nobody

RUN apt-get update && \
apt-get install -y python-pip && \
pip install flexget

VOLUME /config
VOLUME /output
RUN ln -sf /config /root/.flexget
RUN echo "flexget daemon start" /start.sh && \
chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
