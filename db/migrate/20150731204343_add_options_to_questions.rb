class AddOptionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :option_list, :text
  end
end
