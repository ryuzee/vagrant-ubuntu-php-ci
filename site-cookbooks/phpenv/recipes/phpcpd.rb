#
# Cookbook Name:: phpenv
# Recipe:: phpcpd
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# https://github.com/sebastianbergmann/phpcpd
remote_file "/usr/local/bin/phpcpd" do
  source "https://phar.phpunit.de/phpcpd.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
