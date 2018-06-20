#
# Cookbook:: box
# Recipe:: base
#
# Copyright:: 2018, The Authors, All Rights Reserved.

packages = %w(
  linux-virtual
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  wget
  curl
)

package(packages)

