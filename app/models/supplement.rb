class Supplement < ApplicationRecord
  validates :name, :link, :external_id, presence: true

  belongs_to :store
end
