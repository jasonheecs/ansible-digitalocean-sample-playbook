require_relative 'spec_helper'

expected_rules = [
  %r{ 22 + ALLOW IN +Anywhere},
  %r{ 80 + ALLOW IN +Anywhere},
  %r{ OpenSSH + ALLOW IN +Anywhere}
]

describe package('ufw') do
  it { should be_installed }
end

describe service('ufw') do
  it { should be_enabled.with_level('S') }
  it { should be_running }
end

describe command('ufw status numbered') do
  its(:stdout) { should match(/Status: active/) }

  expected_rules.each do |r|
    its(:stdout) { should match(r) }
  end
end