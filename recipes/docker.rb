
# be able to controll docker as vagrant
include_recipe 'chef-apt-docker'
package 'docker-ce'

group 'docker' do
  members 'vagrant'
  append true
  system true
end

docker_service_manager 'default' do
  action :start
  only_if { ::File.exist?('/sbin/status') }
end

