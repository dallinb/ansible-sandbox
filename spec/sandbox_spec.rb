require_relative 'spec_helper'

describe 'sandbox site.yml' do
  describe user('fbl01') do
    it { should exist }
    it { should belong_to_primary_group 'fbl01' }
  end
end
