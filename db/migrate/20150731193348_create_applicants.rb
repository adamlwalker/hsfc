class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :home_telephone_number
      t.string  :mobile_telephone_number
      t.string  :work_telephone_number
      t.boolean :under_18
      t.string  :address_1
      t.string  :address_2
      t.string  :state
      t.integer :zip_code
      t.string  :email_address
      t.timestamps null: false
    end
  end
end
