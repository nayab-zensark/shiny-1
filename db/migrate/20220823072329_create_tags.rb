class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.text :tag_description, null: false
      t.integer :tag_code, null: false

      t.timestamps
    end
  end
end