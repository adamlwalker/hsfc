class FormType < ActiveRecord::Base
    belongs_to :pet_type
    has_many   :submissions
    has_many   :form_type_questions
    has_many   :questions, through: :form_type_questions

end
