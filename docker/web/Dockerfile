FROM ubuntu:xenial

MAINTAINER brendan_anderson@hcpss.org

LABEL vendor="Howard County Public School System" \
	org.hcpss.superintendent.version="1.0.0" \
	org.hcpss.superintendent.name="web" \
	org.hcpss.superintendent.wordpress_version="4.8.0"

# Install PHP and Apache
RUN apt-get update && apt-get install -y \
		php \
		php-cli \
		php-mysql \
		php-gd \
		apache2 \
		libapache2-mod-php \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& a2enmod rewrite

COPY config/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY manifest /srv/manifest

# Assemble Wordpress
RUN buildDeps="wget patch git unzip" \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps \
	&& wget https://github.com/HCPSS/tasc/releases/download/v0.2.2/tasc-linux-amd64 \
		-O /usr/local/bin/tasc --secure-protocol=TLSv1 \
	&& chmod u+x /usr/local/bin/tasc \
	&& rm /var/www/html/index.html \
	&& tasc -manifest=/srv/manifest/manifest.yml -destination=/var/www/html \
	&& apt-get remove -y $buildDeps \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Twit templater
RUN buildDeps="wget" \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps \
	&& wget https://github.com/bander2/twit/releases/download/1.1.0/twit-linux-amd64 \
		-O /usr/local/bin/twit --secure-protocol=TLSv1 \
	&& chmod u+x /usr/local/bin/twit \
	&& apt-get remove -y $buildDeps \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY templates /srv/templates

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
