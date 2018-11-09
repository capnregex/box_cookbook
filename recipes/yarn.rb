
apt_repository 'yarn' do
  components         %w(main)
  distribution       'stable'
  key                'https://dl.yarnpkg.com/debian/pubkey.gpg'
  uri                "https://dl.yarnpkg.com/debian/"
end

apt_package 'yarn'

