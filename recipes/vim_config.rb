cookbook_file "/etc/vimrc" do
  source 'etc/vimrc'
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file "/etc/gvimrc" do
  source 'etc/vimrc'
  owner 'root'
  group 'root'
  mode '0755'
end
