class AddProvinceIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :province, null: false, foreign_key: true
    add_foreign_key :users, :provinces, column: :province_id, default: 1
  end
end
