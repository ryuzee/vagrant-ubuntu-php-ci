#
# Cookbook Name:: base
# Recipe:: phing 
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

# http://www.phing.info/trac/wiki/Users/Download
execute "pear channel-discover pear.phing.info" do
  action :run
  ignore_failure true
end

execute "pear upgrade --alldeps phing/phing" do
  action :run
end
