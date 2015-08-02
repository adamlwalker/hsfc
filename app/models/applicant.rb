class Applicant < ActiveRecord::Base
    has_many :submissions
end
