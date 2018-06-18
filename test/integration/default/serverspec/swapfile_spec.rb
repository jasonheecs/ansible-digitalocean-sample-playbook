require_relative 'spec_helper'

describe file('/swap') do
  it { should exist }
end

describe command('ls -l --block-size=M /swap') do
  its(:stdout) { should match /954M/ }
end

describe command('grep /swap /etc/fstab | awk \'{ print $1 }\' | tr -d \'\n\'') do
  its(:stdout) { should match %r{/swap} }
end

describe command('sudo swapon -s') do
  its(:stdout) { should match %r{\/swap} }
end

describe command('grep 10 /proc/sys/vm/swappiness') do
  its(:stdout) { should match /10/ }
end

describe command('cat /proc/sys/vm/vfs_cache_pressure') do
  its(:stdout) { should match /50/ }
end
