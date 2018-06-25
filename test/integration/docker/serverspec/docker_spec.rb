require_relative 'spec_helper'

describe package('docker-ce') do
  it { should be_installed }
end