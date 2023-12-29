ARG PHP_VERSION=""
FROM php:${PHP_VERSION:+${PHP_VERSION}-}apache

# Use php development settings
#RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"


# php-zip support
RUN set -eux; \
	sed -i "s#deb http://deb.debian.org/debian bullseye main#deb http://deb.debian.org/debian bullseye main contrib non-free#g" /etc/apt/sources.list.d/debian.sources; \
	apt-get update; \
	apt-get install -y zlib1g-dev libzip-dev unzip; \
	docker-php-ext-install zip; \
	docker-php-ext-install pdo_mysql

# enable mod_rewrite and allow override from .htacess files
RUN set -eux; \
	a2enmod rewrite; \
	sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# uncomment below to add modsecurity
#RUN set -eux; \
#	apt-get install -y modsecurity-crs libapache2-mod-security2; \ 
#	mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf; \
#        sed -i -e 's/SecRuleEngine DetectionOnly/SecRuleEngine On/g' /etc/modsecurity/modsecurity.conf; \
#	echo "SecAction \"id:900200, phase:1, nolog, pass, t:none, setvar:'tx.allowed_methods=GET HEAD POST OPTIONS PUT DELETE'\"" > /etc/modsecurity/allow_put_delete.conf

