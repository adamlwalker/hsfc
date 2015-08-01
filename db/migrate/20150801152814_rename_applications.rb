class RenameApplications < ActiveRecord::Migration
  def change
    rename_table :applications, :adoption_forms
  end
end
