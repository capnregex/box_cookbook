
describe command('whoami') do
  it { should exist }
  its('stdout') { should match(/^vagrant$/) }
end

describe command('rvm') do
  it { should exist }
end

