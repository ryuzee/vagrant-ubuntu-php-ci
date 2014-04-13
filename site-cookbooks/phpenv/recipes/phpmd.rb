#
# Cookbook Name:: phpenv
# Recipe:: phpmd
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# https://github.com/sebastianbergmann/phpcpd
if node['php_library']['install_method'] == "pear" then
  channels = [
    "pear.phpmd.org",
    "pear.pdepend.org"
  ] 
  channels.each do |c|
    execute "pear channel-discover #{c}" do
      action :run
      not_if "pear list-channels | grep #{c}"
    end
  end

  execute "pear upgrade --alldeps phpmd/PHP_PMD" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  remote_file "/usr/local/bin/phpmd" do
    source "http://static.phpmd.org/php/1.5.0/phpmd.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end
