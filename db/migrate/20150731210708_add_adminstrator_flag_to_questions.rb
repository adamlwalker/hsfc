class AddAdminstratorFlagToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_by_applicant, :boolean
  end
end
