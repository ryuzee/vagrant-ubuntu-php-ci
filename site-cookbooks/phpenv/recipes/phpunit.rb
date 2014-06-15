#
# Cookbook Name:: phpenv
# Recipe:: phpunit 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# you can see the instruction as follows.
# http://phpunit.de/manual/4.0/en/installation.html

if node['php_library']['install_method'] == "pear" then
  execute "pear channel-discover pear.phpunit.de" do
    action :run
    not_if "pear list-channels | grep pear.phpunit.de"
  end

  execute "pear upgrade --alldeps phpunit/phpunit" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  remote_file "/usr/local/bin/phpunit" do
    source "https://phar.phpunit.de/phpunit-3.7.37.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end

package "php5-xdebug" do
  action :install
end
