class Applicant < ActiveRecord::Base
  has_many :submissions, inverse_of: :applicant
  has_many :submission_templates, through: :submissions
  has_many :pet_types, through: :submission_templates
  has_many :responses, through: :submissions

  accepts_nested_attributes_for :responses,   allow_destroy: true
  accepts_nested_attributes_for :submissions, allow_destroy: true

  def self.new_with_submissions(submission_template_id)
    applicant = self.new
    submission = Submission.new_with_responses(submission_template_id)
    applicant.submissions << submission
    applicant
  end

  def location
    if city.present? && !state.present?
      city.titleize
    elsif !city.present? && state.present?
      state.titleize
    elsif city.present? && state.present?
      "#{city.titleize}, #{state.upcase}"
    end
  end

  def name
    def capitalize_name(string)
      unless string == nil
        string.split(" ").map{ |word|
          word[0] = word[0].upcase; word }.join(" ")
      else
          ""
      end
    end
    capitalize_name(last_name) + ", " + capitalize_name(first_name)
  end
end
