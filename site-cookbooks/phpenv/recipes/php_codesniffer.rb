#
# Cookbook Name:: phpenv
# Recipe:: php_codesniffer
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

execute "pear upgrade --alldeps PHP_CodeSniffer" do
  action :run
end
