
box = default[:box]
box[:packages] ||= []
box[:packages] = %w(
  ruby-full
  qt5-default
  libqt5webkit5-dev
  gstreamer1.0-plugins-base
  gstreamer1.0-tools
  gstreamer1.0-x
  xvfb
)

box[:gems] = []
box[:gems] = %w(
  capybara-webkit
  headless
  rack-app
  puma
)


