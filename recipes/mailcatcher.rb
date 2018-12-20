
package 'ruby-dev'

gem_package 'mailcatcher'

user 'mailcatcher' do
  system true
end

cookbook_file '/etc/init.d/mailcatcher' do
  source 'etc/init.d/mailcatcher'
  mode '0755'
end

service 'mailcatcher' do
  action :enable
end

service 'mailcatcher' do
  action :start
end
