class AddNameToFormTypeAndFixes < ActiveRecord::Migration
  def change
    add_column :form_types, :name, :string
    remove_column :form_type_questions, :adoption_form_type_id, :integer
    remove_column :submissions, :adoption_form_type_id, :integer
    remove_column :responses, :adoption_form_id, :integer
  end
end
