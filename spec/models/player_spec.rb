require 'rails_helper'

describe Player do
  describe 'name' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.not_to allow_value('').for(:name) }
    it { is_expected.not_to allow_value(nil).for(:name) }
  end
end
