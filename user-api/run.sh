cp .env.example .env
#copy installer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#match the hash
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#run composer setup
sudo php composer-setup.php
#delete uninstaller
php -r "unlink('composer-setup.php');"
#run composer install
php composer.phar install
#run service host on specific port, for user use port 3132
php -S localhost:3132 -t public
