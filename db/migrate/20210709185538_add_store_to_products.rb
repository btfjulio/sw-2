class AddStoreToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :supplements, :store, foreign_key: true
  end
end
