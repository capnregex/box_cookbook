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
  openssh-server
  build-essential
  ruby-full
  ruby-dev
  wget
  curl
  git
  bash-completion
  openjdk-8-jdk
  python3
  nano
  xfce4-mount-plugin
  firefox
  chromium-browser
  chromium-chromedriver
  qt5-default
  libqt5webkit5-dev
  gstreamer1.0-plugins-base
  gstreamer1.0-tools
  gstreamer1.0-x
  xvfb
  libpq-dev
  ruby-pg
  sqlite3
  libsqlite3-dev
  ruby-sqlite3
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


