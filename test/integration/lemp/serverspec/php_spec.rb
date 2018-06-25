require_relative 'spec_helper'

describe package('php7.0-common') do
  it { should be_installed }
end