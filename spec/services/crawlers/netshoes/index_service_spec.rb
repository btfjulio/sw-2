# frozen_string_literal: true

require 'rails_helper'

describe Crawlers::Netshoes::IndexService, vcr: true do
  subject { -> { described_class.new.perform } }

  let!(:store) { create :store, name: 'Netshoes', base_url: base_url }
  let(:base_url) { 'https://www.netshoes.com.br/suplementos?campaign=compadi' }

  before { allow_any_instance_of(described_class).to receive(:last_page).and_return(1) }

  describe '#perform' do
    it 'save netshoes index product information' do
      is_expected.to change(Supplement.by_store_name('Netshoes'), :count).by(42)
    end
  end
end
