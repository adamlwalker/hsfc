class CreateAnswerTypes < ActiveRecord::Migration
  def change
    create_table :answer_types do |t|
        t.string :name
    end
  end
end
