
apt_repository 'yarn' do
   uri                   "https://dl.yarnpkg.com/debian/"
   distribution          'stable'
   components            'main'
   key                   "https://dl.yarnpkg.com/debian/pubkey.gpg"
end

apt_package 'yarn'

