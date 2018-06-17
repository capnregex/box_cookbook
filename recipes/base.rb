#
# Cookbook:: box
# Recipe:: base
#
# Copyright:: 2018, The Authors, All Rights Reserved.

packages = %w(
  linux-virtual
  xubuntu-core
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  firefox
  wget
  curl
  vim-gnome
  terminator
)

package(packages)

group 'nopasswdlogin' do
  system true
  members 'vagrant'
end

