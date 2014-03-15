# RethinkDB
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER Jeffery Utter "jeff@jeffutter.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen $LANG; echo "LANG=\"${LANG}\"" > /etc/default/locale; dpkg-reconfigure locales

RUN apt-get update;\
    apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:rethinkdb/ppa;\
    apt-get update  
RUN apt-get install -y rethinkdb

EXPOSE 8080

CMD ["rethinkdb", "--bind", "all"]
