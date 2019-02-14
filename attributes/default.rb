# values for ubuntu
default['ubuntu'] = {
  archive_url: 'http://us.archive.ubuntu.com/ubuntu',
  security_url: 'http://us.archive.ubuntu.com/ubuntu',
  include_source_packages: false,
  components: 'main restricted universe multiverse',
  codename: (node['lsb'] || {})['codename'],
  architectures: ['amd64'],
  locale: 'en_US.UTF-8'
}

default['apt']['key_proxy'] = ENV['http_proxy']

box = default[:box]

box[:ppas] = {
  'git-core': 'ppa:git-core/ppa'
}

# package list
box[:packages] = %w(
  bash-completion
  build-essential
  chromium-browser
  chromium-chromedriver
  curl
  firefox
  git
  graphviz
  graphviz-dev
  gstreamer1.0-plugins-base
  gstreamer1.0-tools
  gstreamer1.0-x
  libqt5webkit5-dev
  libsqlite3-dev
  nano
  ntp
  openjdk-8-jdk
  openssh-server
  python3
  qt5-default
  ruby-dev
  ruby-full
  ruby-sqlite3
  sqlite3
  wget
  xfce4-mount-plugin
  xvfb
  zlib1g
  zlib1g-dev
)

box[:virtual][:packages] = %w(
  linux-virtual
  linux-image-virtual
  linux-image-extra-virtual
  linux-headers-virtual
  linux-tools-virtual
  linux-cloud-tools-virtual
)

box[:gui][:packages] = %w(
  xubuntu-core
  vim-gnome
  terminator
)

box[:cli][:packages] = %w(
  vim-nox
)

box[:gems] = %w(
  rspec-rails
  capybara-webkit
  headless
  rack-app
  puma
  pg
  sqlite3
  mailcatcher
)


