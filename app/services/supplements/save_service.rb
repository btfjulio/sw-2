# frozen_string_literal: true

module Supplements
  class SaveService
    def initialize(product, store)
      @product = product
      @store = store
    end

    def perform
      supplement.assign_attributes(product)
      supplement.save!
    end

    private

    attr_reader :product, :store

    def supplement
      @_supplement ||= store
                       .supplements
                       .find_or_initialize_by(external_id: product['external_id'])
    end
  end
end
