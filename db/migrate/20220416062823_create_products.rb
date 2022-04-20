class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.float :price
      t.datetime :date_available
      t.timestamps
    end
  end
end
