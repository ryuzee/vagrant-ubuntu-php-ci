#
# Cookbook Name:: capistrano
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

package "ruby2.0" do
  action :install
end

gem_package "capistrano" do
  action :install
end
