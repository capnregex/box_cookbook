include_recipe "box::git_prompt"

remote_directory '/etc/bashrc.d' do
  source 'etc/bashrc.d'
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file "/etc/bash.bashrc" do
  source 'etc/bash.bashrc'
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file "/home/vagrant/.bashrc" do 
  source "vagrant/bashrc"
  owner "vagrant"
  group "vagrant" 
  mode '0744'
end

cookbook_file "/root/.bashrc" do 
  source "root/bashrc"
  owner "root"
  group "root" 
  mode '0700'
end
