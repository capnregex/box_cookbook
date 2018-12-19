
chef_gem 'octokit'

extend Box::DockerComposeSrcHelpers

package 'docker-compose' do
  action :remove
end

remote_file node['box']['docker']['compose']['bin'] do
  source docker_compose_src
  mode 0755
end

