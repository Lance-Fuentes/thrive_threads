class RemoveUpdatedAndNewFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :updated, :boolean
    remove_column :products, :new, :boolean
  end
end
