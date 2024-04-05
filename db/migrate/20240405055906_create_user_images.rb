class CreateUserImages < ActiveRecord::Migration[7.1]
  def change
    create_table :user_images do |t|
      t.string :description
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
