FROM  ubuntu:14.04

MAINTAINER "kallel wassim" <kallel.wassim@gmail.com>

#
# install wget 
#
RUN apt-get update \
	&& apt-get install -y --no-install-recommends unzip \
    && apt-get -y install wget
	
	
RUN mkdir -p /opt/ibm 

#
# install openliberty 
#

RUN cd /opt \ && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jre-8u171-linux-x64.tar.gz"

RUN cd /opt  \ 
 && ls -atlr \
 && mkdir jre1.8 \
 && tar -xvf jre-8u171-linux-x64.tar.gz -C jre1.8 --strip-components 1 \
 && rm -rf jre-8u171-linux-x64.tar.gz \
 && ls -atlr

ENV JAVA_HOME=/opt/jre1.8

RUN  cd /tmp \
	&& wget https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/2018-03-09_2209/openliberty-18.0.0.1.zip \
    && unzip openliberty-18.0.0.1.zip \
    && mv /tmp/wlp /opt/ibm/. 
    

ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ADD server.env /opt/ibm/wlp/usr/servers/defaultServer/
ADD jvm.options /opt/ibm/wlp/usr/servers/defaultServer/
ADD sample.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/


ENTRYPOINT ["/opt/ibm/wlp/bin/server","run","defaultServer"]


    
    
 

   
