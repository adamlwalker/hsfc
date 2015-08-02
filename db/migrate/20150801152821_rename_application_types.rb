class RenameApplicationTypes < ActiveRecord::Migration
  def change
    rename_table :application_types, :adoption_form_types
  end
end
