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
execute "pear upgrade --alldeps PHP_CodeSniffer" do
  action :run
end
