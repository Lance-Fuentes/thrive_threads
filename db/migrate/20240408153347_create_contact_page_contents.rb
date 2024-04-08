class CreateContactPageContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_page_contents do |t|
      t.text :content

      t.timestamps
    end
  end
end
