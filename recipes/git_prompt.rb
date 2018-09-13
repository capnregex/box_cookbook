## from https://github.com/git/git
## git/contrib/completion/git-prompt.sh

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

directory '/opt/git'

cookbook_file '/opt/git/git-prompt.sh' do
  source 'opt/git/git-prompt.sh'
end
