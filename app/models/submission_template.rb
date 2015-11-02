class SubmissionTemplate < ActiveRecord::Base

  belongs_to :pet_type
  has_many   :submissions
  has_many   :submission_template_questions
  has_many   :questions, through: :submission_template_questions

end
