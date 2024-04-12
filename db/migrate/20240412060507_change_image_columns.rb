class ChangeImageColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :images, :product_id, true
    change_column_null :images, :order_id, true
  end
end
