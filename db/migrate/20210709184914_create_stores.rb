class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string 'base_url'
      t.string 'logo'
      t.string 'name'
      t.timestamps
    end
  end
end
