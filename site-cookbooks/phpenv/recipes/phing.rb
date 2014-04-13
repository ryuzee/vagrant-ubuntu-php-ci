#
# Cookbook Name:: phpenv
# Recipe:: phing 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# http://www.phing.info/trac/wiki/Users/Download

if node['php_library']['install_method'] == "pear" then
  execute "pear channel-discover pear.phing.info" do
    action :run
    not_if "pear list-channels | grep pear.phing.info"
  end

  execute "pear upgrade --alldeps phing/phing" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  remote_file "/usr/local/bin/phing" do
    source "http://www.phing.info/get/phing-latest.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end
