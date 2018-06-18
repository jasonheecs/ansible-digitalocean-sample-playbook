require_relative 'spec_helper'

describe package('fail2ban') do
  it { should be_installed }
end

describe file('/etc/fail2ban/fail2ban.conf') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  if host_inventory['platform_version'] == "8"
    its(:md5sum) { should eq "614b8b0d7f0fa4221ef3b8663fd0ddef" }
  elsif host_inventory['platform_version'] == "9"
    its(:md5sum) { should eq "166738c68301aaa02708f359cf691d25" }
  end
end

describe file('/etc/default/fail2ban') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/fail2ban/jail.conf') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  if host_inventory['platform_version'] == "8"
    its(:md5sum) { should eq "4b83b53a2cf48006907bccef9d80d059" }
  elsif host_inventory['platform_version'] == "9"
    its(:md5sum) { should eq "552ce7f0f1a6a99a26846d8ead97d108" }
  end
end