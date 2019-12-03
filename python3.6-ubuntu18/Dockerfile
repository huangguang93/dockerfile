FROM ubuntu
RUN set -xe \
  && echo "==> setting TZ " \
  && echo "Asia/Shanghai" > /etc/timezone \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "==> install python3.6 " \
  && apt-get update \
  && apt-get install python3.6 python3-dev libmysqlclient-dev libmysqld-dev python3-pip tzdata -y \
  && echo "==> setting python3.6" \
  && ln -s /usr/bin/pip3 /usr/bin/pip \
  && ln -s /usr/bin/python3.6 /usr/bin/python \
  && echo "==> Clean..."  \ 
  && apt-get --purge autoremove -y python3-dev libmysqlclient-dev gcc  \
  && rm -rf /root/.cache && apt-get autoclean  \
  && apt-get clean \   
  && rm -rf /var/lib/apt/lists/* /var/cache/apk/*  /tmp/* /var/tmp/* \
  && > /var/log/bootstrap.log  && > /var/log/dpkg.log && > /var/log/alternatives.log

CMD ["/bin/bash"]
