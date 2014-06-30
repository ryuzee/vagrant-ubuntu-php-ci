#
# Cookbook Name:: composer
# Recipe:: phpmd
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

remote_file "/usr/local/bin/composer" do
  source "http://getcomposer.org/composer.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
