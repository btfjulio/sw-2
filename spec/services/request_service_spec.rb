# frozen_string_literal: true

require 'rails_helper'

describe RequestService, vcr: true do
  subject { described_class.new(link).perform }

  let(:link) { 'https://www.netshoes.com.br/suplementos?campaign=compadi' }

  describe '#perform' do
    context 'when a link is sent to be requested' do
      it 'returns response body' do
        is_expected.to be_truthy
      end
    end
  end
end
