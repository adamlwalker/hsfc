class CreateApplicationTypes < ActiveRecord::Migration
  def change
    create_table :application_types do |t|
      t.references :pet_type
      t.timestamps null: false
    end
  end
end
