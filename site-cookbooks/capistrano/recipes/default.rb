#
# Cookbook Name:: phpenv
# Recipe:: capistrano
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

gem_package "capistrano" do
  action :install
end
