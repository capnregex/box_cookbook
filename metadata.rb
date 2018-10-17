
name 'box'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures box'
long_description 'Installs/Configures box'
version '0.1.2'
chef_version '>= 12.14' if respond_to?(:chef_version)
issues_url 'https://github.com/capnregex/box_cookbook/issues'
source_url 'https://github.com/capnregex/box_cookbook'

depends 'ubuntu', '~> 2.0.1'
depends 'java', '~> 2.1.0'
depends 'git', '~> 9.0.1'
depends 'postgresql', '~> 7.0.0'
depends 'nodejs', '~> 5.0.0'
depends 'docker', '~> 4.6.5'
depends 'rvm', '~> 0.1.2'

