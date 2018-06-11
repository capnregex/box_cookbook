
# package %w(postgresql postgresql-server postgresql-contrib libpq5 ruby-pg)

postgresql_repository 'install'

postgresql_server_install 'package' do
  password 'vagrant'
  action [:install, :create]
end

postgresql_user 'vagrant' do
  user 'vagrant'
  superuser true
  password 'vagrant'
end

postgresql_access 'vagrant' do
  access_type 'host'
  access_db 'all'
  access_user 'vagrant'
  access_method 'md5'
  access_addr '127.0.0.1/32'
  notifies :reload, 'service[postgresql]'
end

# Using this to generate a service resource to control
find_resource(:service, 'postgresql') do
  extend PostgresqlCookbook::Helpers
  service_name lazy { platform_service_name }
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end

postgresql_server_conf 'PostgreSQL Config' do
  notifies :reload, 'service[postgresql]'
end

# postgresql_extension 'postgres adminpack' do
#   database 'postgres'
#   extension 'adminpack'
# end

# postgresql_access 'local_postgres_superuser' do
#   comment 'Local postgres superuser access'
#   access_type 'local'
#   access_db 'all'
#   access_user 'postgres'
#   access_addr nil
#   access_method 'ident'
# end

# postgresql_ident 'Map john to user1' do
#   comment 'John Mapping'
#   mapname 'mymapping'
#   system_user 'john'
#   pg_user 'user1'
# end

