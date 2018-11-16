user 'vagrant' do
end

%w(adm cdrom sudo dip plugdev lpadmin nopasswdlogin sambashare vboxsf docker).each do |grp|
  group grp do
    append true
    system true
    members 'vagrant'
  end
end

directory "/home/vagrant" do
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.gnupg" do
  recursive true
  mode '0700'
end

cookbook_file "/home/vagrant/.gnupg/dirmngr.conf" do
  source "dirmngr.conf"
end

directory "/home/vagrant/.ssh" do
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

file "/etc/sudoers.d/99_vagrant" do
  content "vagrant ALL=(ALL) NOPASSWD:ALL"
  mode '0440'
end

directory "/etc/lightdm/lightdm.conf.d" do
  recursive true
end

file "/etc/lightdm/lightdm.conf.d/50-myconfig.conf" do
  content <<~CONF
    [SeatDefaults]
    autologin-user=vagrant
    allow-guest=false
    greeter-wrapper=
    guest-wrapper=
    greeter-session=
  CONF
end

directory "/home/vagrant/.config" do
  recursive true
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.config/xfce4" do
  recursive true
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.config/xfce4/terminal" do
  recursive true
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file "/home/vagrant/.config/xfce4/terminal/terminalrc" do
  source 'xfce_terminalrc'
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.config/xfce4/panel" do
  recursive true
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file "/home/vagrant/.config/xfce4/panel/whiskermenu-1.rc" do
  source 'whiskermenu.rc'
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
end
