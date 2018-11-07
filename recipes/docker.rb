
# be able to controll docker as vagrant
group 'docker' do
  members 'vagrant'
  append true
  system true
end

package 'docker-ce'

docker_service_manager 'default' do
  action :start
  only_if { ::File.exist?('/sbin/status') }
end

