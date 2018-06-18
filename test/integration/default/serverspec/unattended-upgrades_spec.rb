require_relative 'spec_helper'

describe package('unattended-upgrades') do
  it { should be_installed }
end

describe file('/etc/apt/apt.conf.d/50unattended-upgrades') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should include "#{os[:family].capitalize},archive=${distro_codename}-security"}
end

describe file('/etc/apt/apt.conf.d/20auto-upgrades') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should include "APT::Periodic::Unattended-Upgrade" }
  its(:content) { should include "APT::Periodic::Update-Package-Lists" }
end
