# Utilisez une image PHP en tant qu'image de base pour Symfony
FROM php:8.0-fpm

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Installez les dépendances nécessaires pour Symfony
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    libzip-dev \
    zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

# Installez Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo_mysql

# Installez Symfony CLI globalement
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN ln -s /root/.symfony/bin/symfony /usr/local/bin/symfony

# Exposez le port 9000 pour PHP-FPM
EXPOSE 9000
