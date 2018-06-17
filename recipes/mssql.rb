#
# Cookbook:: box
# Recipe:: mssql
#
package 'debconf-utils'

mssql = node[:mssql]
apt = mssql[:apt]
apt[:repos].each do |name, path|
  host = apt[:host]
  apt_repository 'mssql-' + name do
    key host + apt[:key]
    uri host + path
    arch apt[:arch]
    distribution apt[:distribution]
    components apt[:components]
  end
end

package mssql[:packages] do
  response_file 'mssql.seed'
end

execute "install broken packages" do
  pkgs = mssql[:broken_packages].join(' ')
  environment(
    DEBIAN_FRONTEND: 'noninteractive',
    ACCEPT_EULA: 'Y'
  )
  command "apt-get install -y #{pkgs}"
end

# Run mssql-conf setup...
execute 'mssql-conf' do
  command "/opt/mssql/bin/mssql-conf -n setup"
  environment(
    MSSQL_SA_PASSWORD: 'Vagrant1!',
    MSSQL_PID: 'Developer',
    ACCEPT_EULA: 'Y'
  )
  creates "/var/opt/mssql/mssql.conf"
end

service 'mssql-server' do
  action :enable
end

service 'mssql-server' do
  action :restart
end

link '/usr/bin/sqlcmd' do
  to '/opt/mssql-tools/bin/sqlcmd'
end

link '/usr/bin/bcp' do
  to '/opt/mssql-tools/bin/bcp'
end

script "change sa password" do
  environment(
    SQLCMDSERVER: 'localhost',
    SQLCMDUSER: 'SA',
    SQLCMDPASSWORD: 'Vagrant1!',
  )
  interpreter "sqlcmd"
  flags '-i'
  code <<~SQL
    ALTER LOGIN [SA] WITH PASSWORD=N'vagrant', CHECK_POLICY=OFF;
    CREATE DATABASE [vagrant];
    CREATE LOGIN [vagrant] WITH PASSWORD=N'vagrant', DEFAULT_DATABASE=[vagrant] CHECK_POLICY=OFF;
    ALTER SERVER ROLE [sysadmin] ADD MEMBER [vagrant];
    GO
  SQL
end

