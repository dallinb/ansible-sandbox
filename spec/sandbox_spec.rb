require_relative 'spec_helper'

describe 'ofbiz role' do
  describe user('fbl01') do
    it { should exist }
    it { should belong_to_primary_group 'fbl01' }
  end
end
