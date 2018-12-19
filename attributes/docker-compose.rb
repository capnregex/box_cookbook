
compose = default['box']['docker']['compose']
compose['release'] = "1.23.2" # latest
compose['repo'] = 'docker/compose'
compose['bin'] = "/usr/local/bin/docker-compose"
compose['host'] = "https://github.com/"
compose['api_host'] = "https://api.github.com/"
compose['latest'] = "https://api.github.com/repos/docker/compose/releases/latest"
compose['name'] = 'docker-compose-Linux-x86_64'
compose['src'] = "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-Linux-x86_64"


