class QuestionAdoptionFormType < ActiveRecord::Base
    belongs_to :question
    belongs_to :adoption_form_type
end
