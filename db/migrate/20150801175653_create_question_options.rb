class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
        t.references :question
        t.string     :option_text
    end
    remove_column :questions, :option_list
  end
end
