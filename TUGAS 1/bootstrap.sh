 #!/usr/bin/env bash
apt-get update
apt-get install -y python-software-properties # for
add-apt-repository
apt-get install -y language-pack-en-base
apt-get install -y zip unzip git

#nomer 1
useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin)

#no-2
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
#sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir


#no 3
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8"
dpkg-reconfigure locales

sudo apt-get install -y nginx
sudo apt-get install -y php5 php5-fpm php5-cgi
sudo apt-get install -y curl php5-cli
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

curl -sS https://getcomposer.org/installer | php

#sudo apt-get install mysql-server
#mysql_secure_installation


#no 4
sudo apt-get install -y squid
sudo apt-get install -y bind9
