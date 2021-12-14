class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.references :user,              mull: false, foreign_key: true
      t.string :string,                null: false
      t.text :explanation,             null: false
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false
      t.integer :shipping_charge_id,   null: false
      t.integer :prefecture_id,        null: false
      t.integer :shipping_day_id,      null: false
      t.integer :price,                null: false
    end
  end
end
