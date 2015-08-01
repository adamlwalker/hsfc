class Applicant < ActiveRecord::Base
    has_many :adoption_forms
end
