require_relative 'spec_helper'

describe command('id -u foobar > /dev/null 2>&1; echo $?') do
  its(:stdout) { should match  %r{0} }
end

describe command('sudo -l -U foobar') do
  if os[:release] == '16.04'
    its(:stdout) { should include "(ALL) NOPASSWD: ALL" }
  else
    its(:stdout) { should include "(ALL : ALL) ALL" }
  end
end