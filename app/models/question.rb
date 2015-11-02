class Question < ActiveRecord::Base
  belongs_to :parent, class_name: "Question", foreign_key: :parent_id
  has_many   :responses
  has_many   :submission_template_questions
  has_many   :submission_templates, through: :submission_template_questions

  def self.answered_question_names
    template_ids = SubmissionTemplate.pluck(:id).join(", ")

    Question.order(:position).
      joins(submission_template_questions: :submission_template).
      where("submission_template_questions.submission_template_id IN (#{ template_ids })").
      pluck(:name, :short_name).uniq
  end
end