class RenameApplicationTypes < ActiveRecord::Migration
  def change
    rename_table :application_types, :adoption_form_types
    rename_column :adoption_form_types, :pet_types_id, :pet_type_id
  end
end
