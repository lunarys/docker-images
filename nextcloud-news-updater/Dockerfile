FROM php

# Install news updater and requirements
RUN apt-get update \
	&& apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools python3-wheel libzip-dev libpng-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-install pdo_mysql zip gd pcntl \
	&& pip3 install nextcloud_news_updater

# Increase memory as php otherwise shows a warning
RUN echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini

# Run as the same user as nextcloud
USER www-data

# Command (add --loglevel=info for more output)
CMD ["nextcloud-news-updater", "/var/www/html"]
