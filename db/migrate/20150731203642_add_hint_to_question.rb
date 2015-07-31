class AddHintToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :hint_text, :string
  end
end
