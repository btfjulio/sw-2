# frozen_string_literal: true

class Supplement < ApplicationRecord
  validates :name, :link, :external_id, presence: true

  belongs_to :store

  scope :by_store_name, ->(store_name) { where(store: Store.by_name(store_name)) }
end
