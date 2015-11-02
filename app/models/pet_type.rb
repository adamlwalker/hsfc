class PetType < ActiveRecord::Base
    has_many :submission_templates
end
