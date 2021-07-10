# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:base_url) }
  end

  context 'associations' do
    it { is_expected.to have_many(:supplements) }
  end
end
