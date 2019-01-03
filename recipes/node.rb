
remote_file '/usr/local/bin/n' do
  source "https://raw.githubusercontent.com/tj/n/master/bin/n"
  mode 0755
  sensitive true
end
execute "n #{node[:node_n][:node][:version]}"

