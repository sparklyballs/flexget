FROM phusion/baseimage:0.9.15
MAINTAINER smdion <me@seandion.com>
ENV DEBIAN_FRONTEND noninteractive
# Set correct environment variables
ENV HOME /root
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
# Use baseimage-docker's init system
CMD ["/sbin/my_init"]
# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN usermod -d /config nobody
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
apt-get update -qq && \
apt-get install -qq --force-yes python2.7 python-dev python-pip python-transmissionrpc && \
apt-get autoremove && \
apt-get autoclean && \
pip install flexget && \
pip install --upgrade six>=1.70 && \
chown -R nobody:users /usr/local/bin/flexget
VOLUME /config
VOLUME /output


# Add flexget to runit
RUN mkdir /etc/service/flexget
ADD start.sh /etc/service/flexget/run
RUN chmod +x /etc/service/flexget/run
