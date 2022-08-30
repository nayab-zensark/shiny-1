class CreateAadharCards < ActiveRecord::Migration[7.0]
  def change
    create_table :aadhar_cards do |t|
      t.string :name, null: false
      t.integer :aadhar_no, null: false
      t.date :dob, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
