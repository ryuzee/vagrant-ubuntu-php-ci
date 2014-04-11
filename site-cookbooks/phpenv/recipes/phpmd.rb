#
# Cookbook Name:: phpenv
# Recipe:: phpmd
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# https://github.com/sebastianbergmann/phpcpd
remote_file "/usr/local/bin/phpmd" do
  source "http://static.phpmd.org/php/1.5.0/phpmd.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
