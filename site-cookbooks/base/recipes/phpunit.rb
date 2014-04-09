#
# Cookbook Name:: base
# Recipe:: phpunit 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# you can see the instruction as follows.
# http://phpunit.de/manual/4.0/en/installation.html
remote_file "/usr/local/bin/phpunit" do
  source "https://phar.phpunit.de/phpunit.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
