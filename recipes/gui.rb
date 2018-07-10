#
# Cookbook:: box
# Recipe:: gui
#
# Copyright:: 2018, The Authors, All Rights Reserved.

group 'nopasswdlogin' do
  system true
  members 'vagrant'
end

