# Cookbook:: box
# Recipe:: cli

include_recipe 'box::base'

package node[:box][:cli][:packages] do
  timeout 3 * 60 * 60 # 3 hours
end

