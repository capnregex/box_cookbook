#
# Chef Documentation
# https://docs.chef.io/libraries.html

# require 'open-uri'
# require 'json'
require 'octokit'

module Box
  module DockerComposeSrcHelpers
    def docker_compose_src
      client = Octokit::Client.new

      compose = node['box']['docker']['compose']
      release = compose['release']
      repo = compose['repo']
      bin = compose['bin']
      host = compose['host']
      api_host = compose['api_host']
      release = compose['release']
      name = compose['name']
      latest_url = [api_host,
      release = client.latest_release(repo)

compose['latest'] = "https://api.github.com/repos/docker/compose/releases/latest"

      raw_json = open(latest_uri).read
      latest = JSON.parse()
      assets = latest['assets']
      asset = assets.select{|a| a['name'] == name}.first
      asset['browser_download_url']
    rescue OpenURI::HTTPError
      node['box']['docker']['compose']['source']
    end
  end
end

