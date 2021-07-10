# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Supplement, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:external_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:store) }
  end
end
