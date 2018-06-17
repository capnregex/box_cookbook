
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

directory '/home/vagrant/.gnupg' do
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

remote_file '/home/vagrant/.rvm/mpapis.asc' do
  source 'https://rvm.io/mpapis.asc'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
  action :create
end

execute 'install mpapis public keys' do
  cwd '/home/vagrant'
  user 'vagrant'
  group 'vagrant'
  environment(vagrant)
  command "gpg --import /home/vagrant/.rvm/mpapis.asc"
  live_stream true
end

git '/home/vagrant/.rvm/src' do
  repository node[:rvm][:git][:repo]
  revision node[:rvm][:git][:version]
  user 'vagrant'
  group 'vagrant'
end

bash 'install rvm' do
  cwd '/home/vagrant/.rvm/src'
  user 'vagrant'
  group 'vagrant'
  environment(vagrant)
  code <<-CODE
    ./install # --ignore-dotfiles
  CODE
  creates '/home/vagrant/.rvm/installed.at'
  live_stream true
end

node[:rvm][:rubies].each do |ruby|
  execute "rvm install #{ruby}" do
    command "sudo -iHu vagrant rvm install #{ruby}"
    creates "/home/vagrant/.rvm/rubies/#{ruby}"
    live_stream true
  end
end

rvm_ruby = node[:rvm][:use]
execute "rvm use #{rvm_ruby}" do
  command "sudo -iHu vagrant rvm use #{rvm_ruby} --default"
  creates "/home/vagrant/.rvm/rubies/default"
  live_stream true
end


# source /home/vagrant/.rvm/scripts/rvm

