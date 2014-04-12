#
# Cookbook Name:: phpenv
# Recipe:: phing 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# http://www.phing.info/trac/wiki/Users/Download
execute "pear channel-discover pear.phing.info" do
  action :run
  not_if "pear list-channels | grep pear.phing.info"
end

execute "pear upgrade --alldeps phing/phing" do
  action :run
end
