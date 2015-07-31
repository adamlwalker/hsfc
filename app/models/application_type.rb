class ApplicationType < ActiveRecord::Base
    has_many :applications
    has_many :questions
    has_one  :pet_type
end
