# Use an official PHP image as the base image
FROM php:latest

# Install Composer
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://getcomposer.org/installer -O composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php

# Set the working directory inside the container
WORKDIR /var/www/html/PHP-Assignment-master

# Install any necessary dependencies (if needed)
# For example, if you need additional PHP extensions:
RUN docker-php-ext-install mysqli

# Copy the entire project directory into the container
COPY . .

# Expose the port your PHP server will run on (if applicable)
EXPOSE 80

# Command to run your PHP application (adjust as needed)
CMD [ "php", "-S", "0.0.0.0:80" ]
