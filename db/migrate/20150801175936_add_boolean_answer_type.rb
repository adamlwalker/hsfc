class AddBooleanAnswerType < ActiveRecord::Migration
  def change
    add_column :answers, :boolean_response, :boolean
  end
end
