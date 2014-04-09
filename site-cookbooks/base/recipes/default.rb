#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

%w{php5 php5-cli php5-fpm php5-mysql mysql-server-5.5 nginx}.each do |p|
  package p do
    action :install
  end
end

service "apache2" do
  action [:disable, :stop]
  only_if "dpkg -l | grep apache2"
end

template "/etc/nginx/sites-available/default" do
  source "default.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end

directory "/usr/share/nginx/html" do
  owner node['nginx']['docroot']['owner'] 
  group node['nginx']['docroot']['group'] 
  mode 0755
  action :create
end

template "/usr/share/nginx/html/index.php" do
  source "index.php.erb"
  owner node['nginx']['docroot']['owner'] 
  group node['nginx']['docroot']['group'] 
  mode 0644
  action :create
end

service "nginx" do
  action [:enable, :start]
end
