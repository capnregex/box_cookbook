
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
  only_if { ::File.exist?('/sbin/status') }
end

#if release = node['docker']['compose']['release']
#  remote_file "/usr/local/bin/docker-compose" do
#    release = node['docker']['compose']['release']
#    kernel_name = node['kernel']['name']
#    machine_hw_name = node['kernel']['machine']
#    source "https://github.com/docker/compose/releases/download/#{release}/docker-compose-#{kernel_name}-#{machine_hw_name}"
#    mode 0755
#  end
#
#  remote_file "/etc/bash_completion.d/docker-compose" do
#    source "https://raw.githubusercontent.com/docker/compose/#{release}/contrib/completion/bash/docker-compose"
#    mode 0644
#  end
#end

