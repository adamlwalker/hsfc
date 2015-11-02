class SubmissionTemplateQuestion < ActiveRecord::Base

    belongs_to :question
    belongs_to :submission_template

end
