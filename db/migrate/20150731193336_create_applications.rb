class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :application_type_id
      t.integer :applicant_id
      t.timestamps null: false
    end
  end
end
