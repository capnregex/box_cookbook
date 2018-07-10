
directory "/opt/test"

cookbook_file "/opt/test/webkit" do 
  source 'webkit/test'
  mode '0755'
end

