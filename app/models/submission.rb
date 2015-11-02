class Submission < ActiveRecord::Base
  belongs_to :applicant, inverse_of: :submissions
  belongs_to :submission_template
  has_many   :responses
  has_many   :questions, through: :submission_template


  def self.new_with_responses(submission_template_id)
    submission = self.new(submission_template_id: submission_template_id)
    submission.questions.order(:position).each do |q|
      submission.responses.build(question_id: q.id)
    end
    submission
  end
end
