#!/bin/sh

############################## install brew packages ##############################

############### tools ###############
brew install tree;
brew install expect;
brew install telnet; # conflicts with inetutils
brew install tmux;
brew install xz;
brew install imagemagick;
brew install e2fsprogs;
brew install aria2;

# install and config proxychains-ng
brew install proxychains-ng
mkdir ~/.proxychains && cd ~/.proxychains
sed "/\[ProxyList\]/,\${/^[^#\[]/d;}" /usr/local/etc/proxychains.conf > proxychains.conf # edit sys proxychains.conf and save as user proxychains.conf
echo "socks5 127.0.0.1 1086" >> proxychains.conf # add socks5 to user config

############### env management tools ###############
sh ./src/jenv.sh # java env management
sh ./src/pyenv.sh # python env management
sh ./src/rbenv.sh # ruby env management
sh ./src/nvm.sh # node env management

############### language environment ###############
brew install php;
brew install io;
brew install go;

############### project management tools ###############
brew install composer;
# todo: change composer source
brew install maven; # jdk required and conflicts with mvnvm
# todo: change maven source
brew install gradle; # jdk required
# todo: change gradle source

############### db ###############
brew install redis; # config file at /usr/local/etc/redis.conf
brew install memcached;
brew install mysql;
brew install mongodb; # config file at /usr/local/etc/mongod.conf
brew install neo4j; # config file at /usr/local/Cellar/neo4j/<version>/libexec/conf
neo4j-admin set-initial-password <password>; # password read from 1password
cd /usr/local/Cellar/neo4j/<version>/libexec/plugins;
wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.4.0.3/apoc-3.4.0.3-all.jar;

############### server ###############
brew install tomcat; # jdk required
brew install nginx; # config file at /usr/local/etc/nginx/
brew install httpd;

############### distributed system  ###############
brew install zookeeper; # jdk required, config file at /usr/local/etc/zookeeper/
brew install kafka; # jdk and zookeeper required, config file at /usr/local/etc/kafka/
# todo: edit kafka config

############### blockchains ###############
brew install ethereum;

############################## install brew cask packages ##############################
# quick-look-plugins see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode;
brew cask install qlstephen;
brew cask install qlmarkdown;
brew cask install quicklook-json;
brew cask install qlimagesize;

# android related
brew cask install android-platform-tools
