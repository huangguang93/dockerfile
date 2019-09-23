FROM centos:7.4.1708
COPY endpoint.sh  /endpoint.sh
RUN set -xe \
  && echo "==> install dependency" \
  && yum install -y wget gcc openssl openssl-devel  curl curl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel  pcre pcre-devel libxslt libxslt-devel  bzip2 bzip2-devel  libxml2 libxml2-devel gmp gmp-devel  libmcrypt libmcrypt-devel libmemcached libmemcached-devel \
  && chmod a+x /endpoint.sh \
  && echo "==> download php-7.0.14 " \
  && mkdir -p /install_tmp /code && cd /install_tmp \
  && wget https://www.php.net/distributions/php-7.0.14.tar.gz &&  wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz \
  && tar -xvf php-7.0.14.tar.gz && tar -xvf libmcrypt-2.5.7.tar.gz \ 
  && echo "==> install libmcrypt" \
  && cd /install_tmp/libmcrypt-2.5.7 && ./configure --prefix=/usr/local && make -j 8 && make install \
  && echo "==> install php-7.0.14" \
  && cd /install_tmp/php-7.0.14 \
  && echo '/usr/local/lib' >> /etc/ld.so.conf \
  && ldconfig \
  && ./configure --prefix=/usr/local --with-config-file-path=/etc/php --with-libdir=lib64 --with-iconv --with-gmp --with-openssl --with-libxml-dir --with-zlib --with-bz2 --with-curl --with-freetype-dir --with-gd --with-jpeg-dir --with-png-dir --with-zlib-dir --with-gettext --with-mcrypt --with-mysqli --with-mhash --with-pdo-mysql --without-pdo-sqlite --enable-pcntl --enable-mbstring --enable-gd-native-ttf --enable-dba --enable-ftp --enable-bcmath --enable-shmop --enable-fpm --enable-cgi --enable-sockets --enable-sysvmsg --enable-sysvsem  --enable-sysvshm --enable-zip  --enable-mbregex  --enable-soap \
  && make -j 8 && make install \
  && echo "==> clean ..." \
  && yum remove -y install gcc  openssl-devel  curl-devel  libjpeg-devel libpng-devel freetype-devel  pcre-devel  libxslt-devel   bzip2-devel  libxml2-devel  gmp-devel  libmcrypt-devel libmemcached-devel \
  && yum clean all && rm -rf /var/cache/yum  /install_tmp /var/log/lastlog /var/log/yum.log

WORKDIR /
ENV WORK_DIR="/code"
ENV PORT="8000"
EXPOSE 8000
ENTRYPOINT ["/endpoint.sh"]

