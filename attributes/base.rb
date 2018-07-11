
box = default[:box]
base = box[:base]

base[:packages] = %w(
  linux-virtual
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  wget
  curl
  git
  openjdk-8-jdk
  python3
  vim
  nano
  xubuntu-core
  firefox
  chromium-browser
  chromium-chromedriver
  vim-gnome
  terminator
)

base[:gems] = %w(
  rspec
)


