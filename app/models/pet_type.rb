class PetType < ActiveRecord::Base
    has_many :application_types
end
