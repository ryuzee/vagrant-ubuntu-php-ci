#
# Cookbook Name:: phpenv
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# installing php mysql and related or useful php extension
%w{curl php5 php5-cli php5-fpm php5-mysql php-pear php5-curl php5-xsl php5-mcrypt mysql-server-5.5 nginx git}.each do |p|
  package p do
    action :install
  end
end

# enable mcrypt module
execute "php5enmod mcrypt" do
  action :run
end

service "apache2" do
  action [:disable, :stop]
  only_if "dpkg -l | grep apache2"
end

template "/etc/nginx/sites-available/#{node['nginx']['site']['template']}" do
  source "#{node['nginx']['site']['template']}.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end

link "/etc/nginx/sites-enabled/#{node['nginx']['site']['template']}" do
  to "/etc/nginx/sites-available/#{node['nginx']['site']['template']}"
end

hostsfile_entry '127.0.0.1' do
  hostname  'test.localhost'
  action    :append
end

template "/etc/nginx/sites-available/default" do
  source "default.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end

directory node['nginx']['docroot']['path'] do
  owner node['nginx']['docroot']['owner'] 
  group node['nginx']['docroot']['group'] 
  mode 0755
  action :create
  recursive true
  only_if { not File.exists?(node['nginx']['docroot']['path']) and node['nginx']['docroot']['force_create']}
end

template "#{node['nginx']['docroot']['path']}/index.php" do
  source "index.php.erb"
  owner node['nginx']['docroot']['owner'] 
  group node['nginx']['docroot']['group'] 
  mode 0644
  action :create
  only_if { not File.exists?("#{node['nginx']['docroot']['path']}/index.php") and node['nginx']['docroot']['force_create']}
end

service "nginx" do
  action [:enable, :restart]
end

service "mysql" do
  action [:enable, :restart]
  supports :status => true, :start => true, :stop => true, :restart => true
  not_if do File.exists?("/var/run/mysqld/mysqld.pid") end
end

execute "set_mysql_root_password" do
  command "/usr/bin/mysqladmin -u root password \"#{node['mysql']['root_password']}\""
  action :run
  only_if "/usr/bin/mysql -u root -e 'show databases;'"
end

# vim: filetype=ruby.chef
