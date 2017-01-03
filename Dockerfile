# 
# Copyright 2015 Stefano Terna
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

FROM eclipse-mosquitto
MAINTAINER iottly


RUN \
  apk add --update --virtual .auth-plug-build-dependencies \
    autoconf \
    binutils \
    g++ \
    gcc \    
    make \
    curl \
    file \
    libtool \
    openssl-dev \
    util-linux-dev \
  && apk add --update --virtual .auth-plug-runtime-dependencies \
    c-ares-dev


RUN \
  LIBMONGOC_VERSION="1.3.1" \
    && LIBMONGOC_FILENAME="mongo-c-driver-${LIBMONGOC_VERSION}" \
    && LIBMONGOC_SOURCE="https://github.com/mongodb/mongo-c-driver/releases/download/${LIBMONGOC_VERSION}/${LIBMONGOC_FILENAME}.tar.gz" \
    && curl -fSL --connect-timeout 30 ${LIBMONGOC_SOURCE} | tar xz -C /tmp \
    && cd /tmp/${LIBMONGOC_FILENAME} \
    && ./configure \
    && make \
    && make install 


RUN  \
  MOSQUITTO_VERSION="1.4.8" \
    && MOSQUITTO_FILENAME="mosquitto-${MOSQUITTO_VERSION}" \
    && MOSQUITTO_SOURCE="https://github.com/eclipse/mosquitto/archive/v${MOSQUITTO_VERSION}.tar.gz" \
    && curl -fSL --connect-timeout 30 ${MOSQUITTO_SOURCE} | tar xz -C /tmp \
    && cd /tmp/${MOSQUITTO_FILENAME} \
    && make WITH_SRV=no binary


ENV AUTHPLUG_VERSION 0.0.9
ENV AUTHPLUG_FILENAME mosquitto-auth-plug-$AUTHPLUG_VERSION

RUN  \
  AUTHPLUG_SOURCE="https://github.com/jpmens/mosquitto-auth-plug/archive/${AUTHPLUG_VERSION}.tar.gz" \
    && curl -fSL --connect-timeout 30 ${AUTHPLUG_SOURCE} | tar xz -C /tmp 

ADD mosquitto-auth-plug/config.mk /tmp/$AUTHPLUG_FILENAME/config.mk
ADD mosquitto-auth-plug/cache.h /tmp/$AUTHPLUG_FILENAME/cache.h

RUN \
  cd /tmp/${AUTHPLUG_FILENAME} \
    && make \
    && cp auth-plug.so /etc/mosquitto


# Removing build dependencies, clean temporary files
RUN \
  apk del .auth-plug-build-dependencies \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD /mosquitto/config /mosquitto/config


