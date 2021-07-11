# frozen_string_literal: true

class ParseService
  def initialize(body, tags, page_attributes)
    @body = body
    @tags = tags
    @page_attributes = page_attributes
  end

  def perform
    return {} if tags.blank?

    tags.each_with_object({}) { |tag, result| result[tag] = find_info(tag) }
  end

  private

  attr_reader :body, :tags, :page_attributes

  def find_info(tag)
    extract_method = page_attributes[tag]
    extract_method.call(body)
  end
end
