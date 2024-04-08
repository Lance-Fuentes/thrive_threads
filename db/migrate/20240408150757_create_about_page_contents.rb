class CreateAboutPageContents < ActiveRecord::Migration[7.1]
  def change
    create_table :about_page_contents do |t|
      t.text :content

      t.timestamps
    end
  end
end
