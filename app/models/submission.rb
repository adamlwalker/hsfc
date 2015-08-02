class Submission < ActiveRecord::Base
    belongs_to :applicant
    belongs_to :form_type
    has_many   :responses


    accepts_nested_attributes_for :responses
end
