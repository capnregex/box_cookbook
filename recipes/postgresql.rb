
pg_version = '9.6'
postgresql_repository 'Add downloads.postgresql.org repository' do
  version pg_version
end

apt_update

postgresql_server_install 'install Local development Postgresql Server' do
  version pg_version
  password 'vagrant'
  action [:install, :create]
end

# $ sudo apt-get install libpq-dev=9.6.* libpq5=9.6.*
package 'libpq5' do
  version pg_version + '*'
end

package 'libpq-dev' do
  version pg_version + '*'
end

# create a postgresql user 'vagrant'
postgresql_user 'vagrant' do
  user 'vagrant'
  superuser true
  password 'vagrant'
end

# create default database for the 'vagrant' user
postgresql_database 'vagrant' do
  owner 'vagrant'
  template 'template0'
  locale 'C'
  not_if "psql vagrant -c \"\"", user: 'vagrant'
end
