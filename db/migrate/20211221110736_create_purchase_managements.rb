class CreatePurchaseManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_managements do |t|

      t.timestamps
    end
  end
end
