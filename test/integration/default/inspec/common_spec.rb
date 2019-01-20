describe user('fbl01') do
  it { should exist }
  its('group') { should eq 'fbl01' }
end

describe package('ntp') do
  it { should be_installed }
end

describe file('/etc/ntp.conf') do
  its(:content) { should match(/^server [0-9].uk.pool.ntp.org iburst$/) }
end

describe service('ntpd') do
  it { should be_enabled }
end

describe service('ntpd') do
  it { should be_running }
end
