class NameAndFieldChanges < ActiveRecord::Migration
  def change
    remove_column :form_type_questions, :adoption_form_type_id, :integer
    remove_column :submissions, :adoption_form_type_id, :integer
    remove_column :responses, :adoption_form_id, :integer

    rename_table :form_types, :submission_templates
    rename_table :form_type_questions, :submission_template_questions

    rename_column :questions, :content, :name
    rename_column :submissions, :form_type_id, :submission_template_id
    rename_column :submission_template_questions, :form_type_id, :submission_template_id

    # NOTE: change_column is not reversible. Comment these out if you need to rollback
    change_column :applicants, :first_name, :string, null: false
    change_column :applicants, :last_name, :string, null: false
    change_column :events, :title, :string, null: false
    change_column :pet_types, :name, :string, null: false
    change_column :responses, :question_id, :integer, null: false
    change_column :questions, :name, :string, null: false
    change_column :submissions, :applicant_id, :integer, null: false
    change_column :submission_template_questions, :question_id, :integer, null: false

    add_column :questions, :short_name, :string
    add_column :questions, :hint_text, :string
    add_column :questions, :is_required, :boolean, null: false, default: false
    add_column :questions, :active, :boolean, null: false, default: true
    add_column :responses, :datetime_response, :datetime
    add_column :responses, :array_response, :string, default: [], array: true
    add_column :submission_templates, :name, :string, null: false
    add_column :submission_templates, :submission_thank_you_text, :text

    change_table :submission_template_questions do |t|
      t.timestamps
    end
  end
end
