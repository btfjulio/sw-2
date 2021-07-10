# frozen_string_literal: true

module Crawlers
  module Netshoes
    class IndexService
      STRUCTURE = {
        link: {
          tag: '.item-card__description__product-name',
          method: proc do |content|
                    link = CGI.escape(content['href'])
                    "https:#{link}?campaign=compadi"
                  end
        },
        name: {
          tag: '.item-card__images__image-link',
          method: proc { |content| content['title'] }
        },
        photo: {
          tag: '.item-card__images__image-link img',
          method: proc { |content| content['data-src'] }
        }
      }.freeze

      def initialize
        @store = Store.where(name: 'Netshoes').take
        @base_url = store.base_url
      end

      private

      delegate :base_url, to: :store
      attr_reader :store

      def perform
        response = call_page(base_url)
        binding.pry
      end

      def call_page(link)
        RequestService.new(link).perform
      end
    end
  end
end
