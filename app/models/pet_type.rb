class PetType < ActiveRecord::Base
    has_many :form_types
end
