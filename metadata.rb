
name 'box'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures box'
long_description 'Installs/Configures box'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
issues_url 'https://github.com/capnregex/box_cookbook/issues'
source_url 'https://github.com/capnregex/box_cookbook'

depends 'ubuntu', '~> 2.0.1'
depends 'java', '~> 2.1.0'
depends 'postgresql', '~> 7.0.0'
# depends 'gpg', '~> 0.3.0'
# depends 'rvm', '~> 0.9.4'
# depends 'chef_rvm', '~> 2.0.0'

