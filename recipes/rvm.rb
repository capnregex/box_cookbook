

# Install mpapis public key (might need `gpg2` and or `sudo`)
#
# keys = %w(
#   409B6B1796C275462A1703113804BB82D39DC0E3
#   7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# )
# key_server = 'hkp://keys.gnupg.net'

vagrant = { 
    'HOME' => '/home/vagrant', 
    'USER' => 'vagrant',
    'USERNAME' => 'vagrant',
    'LOGNAME' => 'vagrant' 
  }

# curl -sSL https://rvm.io/mpapis.asc
directory '/home/vagrant/.rvm' do
  user 'vagrant'
  group 'vagrant'
end

remote_file '/home/vagrant/.rvm/mpapis.asc' do
  source 'https://rvm.io/mpapis.asc'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
  action :create
end

bash 'install mpapis public keys' do
  cwd '/home/vagrant'
  user 'vagrant'
  group 'vagrant'
  environment(vagrant)
  live_stream true
  code "gpg --import /home/vagrant/.rvm/mpapis.asc"
end

directory '/home/vagrant/.rvm' do
  user 'vagrant'
  group 'vagrant'
end

git '/home/vagrant/.rvm/src' do
  repository node[:rvm][:git][:repo]
  revision node[:rvm][:git][:version]
  user 'vagrant'
  group 'vagrant'
end

execute 'install rvm' do
  cwd '/home/vagrant/.rvm/src'
  user 'vagrant'
  group 'vagrant'
  environment(vagrant)
  command './install --ignore-dotfiles'
  creates '/home/vagrant/.rvm/installed.at'
  live_stream true
end

node[:rvm][:rubies].each do |ruby|
  execute 'rvm install ruby' do
    cwd '/home/vagrant'
    user 'vagrant'
    group 'vagrant'
    environment(vagrant)
    command "/home/vagrant/.rvm/bin/rvm install #{ruby}"
    creates "/home/vagrant/.rvm/rubies/#{ruby}"
    live_stream true
  end
end

# source /home/vagrant/.rvm/scripts/rvm

