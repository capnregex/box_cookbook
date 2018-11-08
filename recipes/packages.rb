box = node[:box] 

box[:ppas].each_pair do |name, ppa|
  apt_repository name do
    uri ppa
    key_proxy node['apt']['key_proxy']
  end
end

package box[:packages] do
  timeout 3 * 60 * 60 # 3 hours
end

