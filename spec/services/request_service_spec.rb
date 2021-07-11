# frozen_string_literal: true

require 'rails_helper'

describe RequestService, vcr: true do
  subject { described_class.new(link).perform }

  describe '#perform' do
    context 'when a link is sent to be requested' do
      let(:link) { 'https://www.netshoes.com.br/suplementos?campaign=compadi' }

      it 'returns response body' do
        is_expected.to be_present
      end
    end
  end
end
