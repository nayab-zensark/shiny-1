class CreatePanCards < ActiveRecord::Migration[7.0]
  def change
    create_table :pan_cards do |t|
      t.string :name, null: false
      t.string :pan_no, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
