FROM python:3.7.0-stretch

MAINTAINER Arun Thekkuden "arun.manuel14@gmail.com"

ENV HOME /root
ENV APP_HOME /application/
ENV C_FORCE_ROOT=true
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \
        apt-transport-https \
        ca-certificates \
        gnupg \
        curl \
        git \
        imagemagick \
        libpq-dev \
        libxml2-dev \
        libxslt1-dev \
        openssh-client \
        file \
        libtiff5-dev \
        libjpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        liblcms2-dev \
        tcl8.6-dev \
        tk8.6-dev \
        python-tk \
        libncurses5-dev


# Clean up APT and bundler when done.
RUN rm -rf /usr/share/doc \
           /usr/share/man \
           /usr/share/groff \
           /usr/share/info \
           /usr/share/lintian \
           /usr/share/linda \
           /usr/share/locale/ \
           /var/cache/man

# Clean up APT when done.
RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME


# Install pip packages
ADD ./server/requirements/base.txt $APP_HOME
ADD ./server/requirements/local.txt $APP_HOME
RUN pip install -r local.txt
RUN rm -rf local.txt

