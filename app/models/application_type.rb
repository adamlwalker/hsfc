class AdoptionFormType < ActiveRecord::Base
    has_many :adoption_forms
    has_many :questions
    has_one  :pet_type
end
