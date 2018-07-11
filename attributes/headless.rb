
box = default[:box]
box[:packages] ||= []
box[:packages] = %w(
  linux-virtual
  openssh-server
  build-essential
  nodejs
  npm
  wget
  curl
  git
  openjdk-8-jdk
  python3
  vim
  nano
  firefox
  chromium-browser
  chromium-chromedriver
  ruby-full
  xvfb
)

box[:gems] = []
box[:gems] = %w(
  rspec
)


