class AdoptionForm < ActiveRecord::Base
    belongs_to :applicant
    has_many   :answers
end
