class PetType < ActiveRecord::Base
    has_many :adoption_form_types
end
