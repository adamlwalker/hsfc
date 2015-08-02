class Submission < ActiveRecord::Base
    belongs_to :applicant
    has_many   :responses
end
