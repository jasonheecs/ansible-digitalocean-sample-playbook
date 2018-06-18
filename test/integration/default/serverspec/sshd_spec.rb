require_relative 'spec_helper'

describe file('/etc/ssh/sshd_config') do
  it { should exist }
  it { should be_file }
  its(:content) { should include "PasswordAuthentication no" }
  its(:content) { should include "PermitRootLogin no" }
end