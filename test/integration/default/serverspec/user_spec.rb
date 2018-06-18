require_relative 'spec_helper'

describe command('id -u foobar > /dev/null 2>&1; echo $?') do
  its(:stdout) { should match  %r{0} }
end

describe command('sudo -l -U foobar') do
  its(:stdout) { should include "(ALL : ALL) ALL" }
end