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

FROM gcc
MAINTAINER iottly

RUN mkdir /build
RUN mkdir /publish

WORKDIR /build

RUN apt-get update

RUN apt-get -y install pkg-config libssl-dev libsasl2-dev && \
	wget https://github.com/mongodb/mongo-c-driver/releases/download/1.3.1/mongo-c-driver-1.3.1.tar.gz && \
	tar xzf mongo-c-driver-1.3.1.tar.gz && \
	cd mongo-c-driver-1.3.1 && \
	./configure	&& \
	make && \
	make install


RUN apt-get -y install libc-ares-dev uuid-dev xsltproc docbook-xsl && \
	wget https://github.com/eclipse/mosquitto/archive/v1.4.8.tar.gz && \
	tar xzf v1.4.8.tar.gz && \
	cd mosquitto-1.4.8 && \
	make && \
	make install


RUN wget https://github.com/jpmens/mosquitto-auth-plug/archive/0.0.9.tar.gz && \
	tar xzf 0.0.9.tar.gz

ADD config.mk /build/mosquitto-auth-plug-0.0.9/config.mk
ADD cache.h /build/mosquitto-auth-plug-0.0.9/cache.h

RUN cd mosquitto-auth-plug-0.0.9 && \
	make && \
	cp auth-plug.so /publish/auth-plug.so




