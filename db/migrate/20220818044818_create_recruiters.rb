class CreateRecruiters < ActiveRecord::Migration[7.0]
  def change
    create_table :recruiters do |t|
      t.string :company_name, null: false
      t.string :company_id, null: false
      t.string :email_id, null: false, unique: true
      t.string :phone_no, null: false, unique: true

      t.timestamps
    end
  end
end
