#
# Cookbook Name:: base
# Recipe:: phing 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# https://github.com/sebastianbergmann/phpcpd
remote_file "/usr/local/bin/phing" do
  source "http://www.phing.info/get/phing-2.6.1.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
