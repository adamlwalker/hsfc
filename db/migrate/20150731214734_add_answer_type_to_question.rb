class AddAnswerTypeToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :answer_type
  end
end
