
# be able to controll docker as vagrant
group 'docker' do
  members 'vagrant'
  append true
  system true
end

# docker_install "default"
docker_installation_package 'default' do
  # version '1.8.3'
  # action :create
  # package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'| # if Ubuntu for example
end

docker_service_manager 'default' do
  action :start
end
