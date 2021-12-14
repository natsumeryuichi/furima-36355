class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.references :user,           mull: false, foreign_key: true
      t.string :string,             null: false
      t.text :explanation,          null: false
      t.integer :category,          null: false
      t.integer :condition,         null: false
      t.integer :shipping_charge,   null: false
      t.integer :prefecture,        null: false
      t.integer :shipping_day,      null: false
      t.integer :price,             null: false
    end
  end
end
