class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text       :content
      t.integer    :position
      t.integer :application_type_id
      t.timestamps null: false
    end
  end
end
