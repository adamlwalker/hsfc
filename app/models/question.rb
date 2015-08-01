class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_options
    has_many :adoption_form_type_questions
    has_many :adoption_form_types, through: :adoption_form_type_questions
    belongs_to :question,:foreign_key => "parent_id"
end
