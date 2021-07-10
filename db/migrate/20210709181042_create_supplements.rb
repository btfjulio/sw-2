class CreateSupplements < ActiveRecord::Migration[6.1]
  def change
    create_table :supplements do |t|
      t.string 'name'
      t.string 'photo_link'
      t.string 'link'
      t.string 'flavor'
      t.string 'ean'
      t.string 'weight'
      t.integer 'external_id'
      t.string 'category'
      t.string 'subcategory'
      t.string 'brand_name'
      t.timestamps
    end
  end
end
