# frozen_string_literal: true

module Crawlers
  module Netshoes
    class IndexService
      STRUCTURE = {
        link: ->(content) { "https:#{content['href']}?campaign=compadi" },
        name: ->(content) { content.search('.item-card__images__image-link').first['title'] },
        photo_link: ->(content) { content.search('.item-card__images__image-link img').first['data-src'] },
        last: ->(content) { content.search('.last').text.strip.to_i },
        external_id: ->(content) { content['parent-sku'] },
        products: ->(content) { content.search('.item-list .wrapper a') }
      }.freeze

      def initialize
        @store = Store.where(name: 'Netshoes').take
        @base_url = store.base_url
        @page = 1
      end

      def perform
        (1..last_page).each do |page|
          response_body = request_service("#{base_url}&page=#{page}")
          products = parse_service(response_body, [:products])[:products]
          save_products(products)
        end
      end

      private

      delegate :base_url, to: :store
      attr_reader :store, :page

      def save_products(products)
        products.each do |product|
          tags = STRUCTURE.slice(:name, :photo_link, :link, :external_id).keys
          parsed_info = parse_service(product, tags)
          save_service(parsed_info)
        end
      end

      def save_service(product)
        Supplements::SaveService.new(product, store).perform
      end

      def request_service(link)
        RequestService.new(link).perform
      end

      def parse_service(reponse_body, info)
        ParseService.new(reponse_body, info, STRUCTURE).perform
      end

      def last_page
        response_body = request_service(base_url)
        parsed_info = parse_service(response_body, [:last])
        parsed_info[:last]
      end
    end
  end
end
