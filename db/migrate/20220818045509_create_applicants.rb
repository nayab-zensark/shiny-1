class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name, null: false
      t.string :email_id, null: false, unique: true
      t.string :phone_no, null: false, unique: true
      t.text :education_details, null: false

      t.timestamps
    end
  end
end
