class AdoptionFormType < ActiveRecord::Base
    has_many :adoption_forms
    has_many :adoption_form_type_questions
    has_many :questions, through: :adoption_form_type_questions
    has_one  :pet_type
end
