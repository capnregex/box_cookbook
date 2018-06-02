#
# Cookbook:: dev_box
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'ubuntu::default'
include_recipe 'dev_box::update'
include_recipe 'dev_box::rvm'
include_recipe 'dev_box::webkit'
include_recipe 'java::default'

