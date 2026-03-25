#!/bin/bash

echo "Installing Kenzo Theme..."

cd /var/www/pterodactyl || exit

echo "Backup panel..."
cp -r resources resources_backup

echo "Downloading theme..."
git clone https://github.com/username/kenzo-theme.git temp-theme

cp -r temp-theme/* .

echo "Building..."
npm install
npm run build

php artisan view:clear
php artisan cache:clear

echo "Theme Installed!"
