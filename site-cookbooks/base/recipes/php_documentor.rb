#
# Cookbook Name:: base
# Recipe:: php_documentor
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

package "php5-xsl" do
  action :install
end

remote_file "/usr/local/bin/phpdoc" do
  source "http://phpdoc.org/phpDocumentor.phar"
  action :create_if_missing
  owner "root"
  group "root"
  mode 0755
end
