#
# Cookbook Name:: phpenv 
# Recipe:: php_documentor
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

package "php5-xsl" do
  action :install
end

if node['php_library']['install_method'] == "pear" then
  execute "pear channel-discover pear.phpdoc.org" do
    action :run
    not_if "pear list-channels | grep pear.phpdoc.org"
  end

  execute "pear upgrade --alldeps phpdoc/phpDocumentor" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  remote_file "/usr/local/bin/phpdoc" do
    source "http://phpdoc.org/phpDocumentor.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end
