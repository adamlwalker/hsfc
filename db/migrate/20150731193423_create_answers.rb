class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :application
      t.integer    :integer_response
      t.string     :string_response
      t.text       :text_response
      t.timestamps null: false
    end
  end
end
