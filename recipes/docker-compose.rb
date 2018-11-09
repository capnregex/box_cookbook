
require 'open-uri'

package 'docker-compose' do
  action :remove
end

latest = JSON.parse(open("https://api.github.com/repos/docker/compose/releases/latest").read)
assets = latest['assets']
asset = assets.select{|a| a['name'] == 'docker-compose-Linux-x86_64' }.first
dl_url = asset['browser_download_url']

remote_file "/usr/local/bin/docker-compose" do
  source dl_url
  mode 0755
end

