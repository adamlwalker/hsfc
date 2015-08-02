class AddAnswerTypesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_type, :string
  end
end
