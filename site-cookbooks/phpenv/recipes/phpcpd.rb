#
# Cookbook Name:: phpenv
# Recipe:: phpcpd
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

if node['php_library']['install_method'] == "pear" then
  channels = [ 
    "pear.netpirates.net",
    "pear.symfony.com",
    "pear.phpunit.de"
  ] 
  channels.each do |c|
    execute "pear channel-discover #{c}" do
      action :run
      not_if "pear list-channels | grep #{c}"
    end
  end

  execute "pear upgrade --alldeps phpunit/phpcpd" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  # https://github.com/sebastianbergmann/phpcpd
  remote_file "/usr/local/bin/phpcpd" do
    source "https://phar.phpunit.de/phpcpd.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end
