class DropAnswerTypes < ActiveRecord::Migration
  def change
    drop_table :answer_types
  end
end
