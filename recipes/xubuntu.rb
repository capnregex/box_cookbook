
packages = %w(
  xubuntu-core
  firefox
  vim-gnome
  terminator
)

package(packages)

group 'nopasswdlogin' do
  system true
  members 'vagrant'
end

