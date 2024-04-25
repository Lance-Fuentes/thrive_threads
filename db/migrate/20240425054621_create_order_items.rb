class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
