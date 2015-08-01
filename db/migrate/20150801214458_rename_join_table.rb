class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :question_adoption_form_types, :adoption_form_question_types
  end
end
