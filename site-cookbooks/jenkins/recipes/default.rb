#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, Ryutaro YOSHIBA
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

package "jenkins" do
  action :install
end

service "jenkins" do
  action [:enable, :start]
end
