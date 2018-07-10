
gem_package 'box gems' do
  package_name node[:box][:gems] 
  timeout 60 * 10 # 10 minutes
  live_stream true
end
