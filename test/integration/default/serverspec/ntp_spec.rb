require_relative 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end

describe service('ntp') do
  it { should be_running }
end

describe command('pgrep ntp') do
  its('exit_status') { should eq 0 }
end