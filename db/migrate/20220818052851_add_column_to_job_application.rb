class AddColumnToJobApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :job_applications, :job_name, :string, null: false
    add_column :job_applications, :job_description, :text, null: false
    add_column :job_applications, :qualification, :string, null: false
    add_column :job_applications, :last_date, :date, null: false
  end
end
