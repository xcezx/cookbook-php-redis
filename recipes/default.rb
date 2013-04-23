#
# Cookbook Name:: php-redis
# Recipe:: default
#

include_recipe "php"
include_recipe "git"
include_recipe "build-essential"

git "/usr/local/src/phpredis" do
  repository "git://github.com/nicolasff/phpredis.git"
  reference "master"
  action :sync
end

execute "phpize" do
  command "phpize"
  cwd "/usr/local/src/phpredis"
end

execute "configure" do
  command "./configure"
  cwd "/usr/local/src/phpredis"
end

execute "make" do
  command "make"
  cwd "/usr/local/src/phpredis"
end

execute "make install" do
  command "make install"
  cwd "/usr/local/src/phpredis"
end

cookbook_file "#{node['php']['ext_conf_dir']}/redis.ini" do
  source "redis.ini"
  action :create_if_missing
  mode 644
end

