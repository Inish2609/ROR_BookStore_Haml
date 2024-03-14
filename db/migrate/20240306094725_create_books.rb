class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :bookname
      t.text :description
      t.integer :user_id
      t.integer :price
      t.integer :quantity
      t.string :category
      t.timestamps
    end
  end
end
