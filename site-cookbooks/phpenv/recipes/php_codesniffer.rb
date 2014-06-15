#
# Cookbook Name:: phpenv
# Recipe:: php_codesniffer
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# See https://github.com/squizlabs/PHP_CodeSniffer
# This library is only provided by PEAR

if node['php_library']['install_method'] == "pear" then
  execute "pear upgrade --alldeps PHP_CodeSniffer" do
    action :run
  end
elsif node['php_library']['install_method'] == "phar" then
  remote_file "/usr/local/bin/phpcs" do
    source "https://github.com/squizlabs/PHP_CodeSniffer/releases/download/2.0.0a2/phpcs.phar"
    action :create_if_missing
    owner "root"
    group "root"
    mode 0755
  end
end
