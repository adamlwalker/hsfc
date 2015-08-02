class CreateQuestionAdoptionFormTypes < ActiveRecord::Migration
  def change
    create_table :question_adoption_form_types do |t|
      t.references :question
      t.references :adoption_form_type
    end
    remove_column :questions, :adoption_form_type_id
  end
end
