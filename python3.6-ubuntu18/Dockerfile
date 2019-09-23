FROM ubuntu
RUN set -xe \
  && echo "==> install python3.6 " \
  && apt-get update \
  && apt-get install python3.6 python3-dev libmysqlclient-dev libmysqld-dev python3-pip -y \
  && echo "==> setting python3.6" \
  && ln -s /usr/bin/pip3 /usr/bin/pip \
  && ln -s /usr/bin/python3.6 /usr/bin/python \
  && echo "==> Clean up..."  \ 
  && apt-get clean \   
  && rm -rf /var/lib/apt/lists/* /var/cache/apk/* \
  && > /var/log/bootstrap.log  && > /var/log/dpkg.log && > /var/log/alternatives.log

CMD ["/bin/bash"]
