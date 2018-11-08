# Increase the number of inotify watchers available
sysctl_param 'fs.inotify.max_user_watches' do
  value 524288
end
